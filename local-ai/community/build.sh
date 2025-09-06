#!/bin/bash

# Build script for n8n Community Docker Image
# Supports both local testing and Docker Hub push

# Docker Hub configuration - read from .env if exists
if [ -f .env ]; then
    source .env
fi

DOCKER_USERNAME="${DOCKER_USERNAME:-your-dockerhub-username}"
IMAGE_NAME="${IMAGE_NAME:-n8n-community}"
IMAGE_TAG="${IMAGE_TAG:-latest}"
N8N_VERSION="${N8N_VERSION:-1.109.2}"
COMMUNITY_NODES="${COMMUNITY_NODES:-n8n-nodes-mcp}"

# Detect current architecture
CURRENT_ARCH=$(uname -m)
case "$CURRENT_ARCH" in
    x86_64|amd64)
        LOCAL_PLATFORM="linux/amd64"
        ;;
    arm64|aarch64)
        LOCAL_PLATFORM="linux/arm64"
        ;;
    *)
        LOCAL_PLATFORM="linux/amd64"
        ;;
esac

# Supported platforms for multi-arch
PLATFORMS="${PLATFORMS:-linux/amd64,linux/arm64}"

echo "============================================"
echo "n8n Community Docker Builder"
echo "============================================"
echo "Image: $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
echo "Base n8n Version: $N8N_VERSION"
echo "Community Nodes: $COMMUNITY_NODES"
echo "Current Architecture: $CURRENT_ARCH ($LOCAL_PLATFORM)"
echo ""

# Check Docker
if ! docker version >/dev/null 2>&1; then
    echo "❌ Error: Docker is not running or not installed"
    echo "Please start Docker and try again"
    exit 1
fi

# Build for local testing
build_local() {
    echo "Building for local testing (current architecture only)..."
    echo ""
    
    # Build for current platform and load into local Docker
    docker build \
        --build-arg N8N_VERSION="$N8N_VERSION" \
        --build-arg COMMUNITY_NODES="$COMMUNITY_NODES" \
        --tag "$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG" \
        --tag "$DOCKER_USERNAME/$IMAGE_NAME:latest" \
        .
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Successfully built local image!"
        echo ""
        echo "📦 Local Image:"
        echo "   $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
        echo "   $DOCKER_USERNAME/$IMAGE_NAME:latest"
        echo ""
        echo "🚀 Test locally with:"
        echo "   docker-compose up -d"
        echo ""
        echo "Or run directly:"
        echo "   docker run -p 5678:5678 $DOCKER_USERNAME/$IMAGE_NAME:latest"
        echo ""
        echo "Access n8n at: http://localhost:5678"
    else
        echo ""
        echo "❌ Build failed!"
        echo "Please check the error messages above"
        exit 1
    fi
}

# Setup buildx for multi-platform
setup_buildx() {
    echo "Setting up Docker buildx for multi-platform builds..."
    
    # Create or use multi-platform builder
    if ! docker buildx ls | grep -q "n8n-multiplatform"; then
        echo "Creating multi-platform builder..."
        docker buildx create --name n8n-multiplatform --platform "$PLATFORMS" --use
    else
        echo "Using existing multi-platform builder..."
        docker buildx use n8n-multiplatform
    fi
    
    docker buildx inspect --bootstrap
}

# Build and push multi-platform image
build_and_push() {
    setup_buildx
    
    echo ""
    echo "This will build a multi-platform image and push to Docker Hub."
    echo "Platforms: $PLATFORMS"
    echo ""
    
    # Login to Docker Hub
    echo "Logging in to Docker Hub..."
    docker login
    
    if [ $? -ne 0 ]; then
        echo "❌ Failed to login to Docker Hub"
        echo "Please ensure you have a Docker Hub account and correct credentials"
        exit 1
    fi
    
    echo ""
    echo "Building and pushing multi-platform image..."
    echo "This may take a few minutes..."
    echo ""
    
    # Build and push with all platforms
    docker buildx build \
        --platform "$PLATFORMS" \
        --build-arg N8N_VERSION="$N8N_VERSION" \
        --build-arg COMMUNITY_NODES="$COMMUNITY_NODES" \
        --tag "$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG" \
        --tag "$DOCKER_USERNAME/$IMAGE_NAME:latest" \
        --push \
        --progress plain \
        .
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Successfully built and pushed multi-platform image!"
        echo ""
        echo "📦 Docker Hub Repository:"
        echo "   docker.io/$DOCKER_USERNAME/$IMAGE_NAME"
        echo "   Tags: $IMAGE_TAG, latest"
        echo "   Platforms: $PLATFORMS"
        echo ""
        echo "🚀 Users can now pull with:"
        echo "   docker pull $DOCKER_USERNAME/$IMAGE_NAME:latest"
    else
        echo ""
        echo "❌ Build/push failed!"
        echo "Please check the error messages above"
        exit 1
    fi
}

# Main menu
echo "Choose build option:"
echo "1) Build for local testing (current architecture only)"
echo "2) Build and push to Docker Hub (multi-platform)"
echo ""
read -p "Enter choice (1 or 2): " choice

# Trim whitespace from input
choice=$(echo "$choice" | tr -d '[:space:]')

case $choice in
    1)
        build_local
        ;;
    2)
        build_and_push
        ;;
    *)
        echo "Invalid choice: '$choice'. Please enter 1 or 2."
        exit 1
        ;;
esac

echo ""
echo "Done! 🎉"