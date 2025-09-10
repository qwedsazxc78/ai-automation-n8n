# n8n Community Nodes Docker Image

A multi-platform Docker image with built-in community nodes to extend n8n functionality. This image follows the [official n8n community node installation guide](https://docs.n8n.io/integrations/community-nodes/installation/manual-install/).

## ⚠️ Important Notes

### Data Persistence and Community Nodes

If you have an existing n8n instance with mounted volumes, **the newly built image will not override existing community node configurations**. Here's why:

```yaml
volumes:
  - n8n_data:/home/node/.n8n  # Existing data remains unchanged
```

**Environment Support:**
- ✅ **Docker Compose**: Fully supported, works normally
- ⚠️ **Kubernetes**: PVC cannot be shared between multiple n8n Pods, may have compatibility issues

### 🔍 Verify Community Node Installation

Use the following methods to confirm community nodes are properly installed:

**Method 1: Using Container Terminal**
```bash
# Enter container
docker exec -it <container-name> sh

# Check community nodes directory
cd /home/node/.n8n/nodes
ls -la

# View package.json contents
cat package.json
```

**Method 2: Via Docker Compose**
```bash
# Check community node installation status
docker-compose exec n8n ls -la /home/node/.n8n/nodes/
docker-compose exec n8n cat /home/node/.n8n/nodes/package.json
```

**Expected Results:**
You should see package.json content similar to:
```json
{
  "dependencies": {
    "@tavily/core": "^0.5.11",
    "n8n-nodes-discord-trigger": "^0.8.0",
    "n8n-nodes-document-generator": "^1.0.10",
    "n8n-nodes-edit-image-plus": "^0.1.10",
    "n8n-nodes-linewebhook": "^0.1.50",
    "n8n-nodes-mcp": "^0.1.29",
    "n8n-nodes-pdfco": "^1.0.6",
    "n8n-nodes-qrcode": "^0.1.0",
    "n8n-nodes-ragic": "^2.3.1",
    "n8n-nodes-webpage-content-extractor": "^0.1.3"
  }
}
```

**If Community Nodes Are Not Properly Installed:**
1. Clear existing volumes: `docker-compose down -v`
2. Rebuild image and restart services
3. Verify installation again

## Features

* **Multi-platform Support**: Supports AMD64 (Intel/AMD) and ARM64 (Apple Silicon) architectures, Docker automatically selects the appropriate version
* **Community Node Integration**: Pre-installed extensions following official n8n standards (`~/.n8n/nodes`)
* **Flexible Configuration**: Easily adjust n8n version, nodes, and image tags using environment variables
* **PostgreSQL Database**: Built-in database persistence support, suitable for production environments
* **Local Testing First**: Build and test locally without Docker Hub account
* **Docker Compose Ready**: Complete docker-compose.yml configuration included

## Pre-installed Community Nodes

This image comes with the following commonly used community nodes:

### Core Integration Nodes
* **n8n-nodes-mcp** - MCP (Model Context Protocol) node for easy AI model integration
* **n8n-nodes-linewebhook** - LINE messaging platform webhook integration with full LINE bot functionality
* **n8n-nodes-ragic** - [Ragic](https://www.ragic.com/) online database integration for simplified data management

### Recommended Additional Nodes

#### Communication & Community
* **n8n-nodes-discord-trigger** - Discord trigger node to listen for Discord events and messages

#### Document Processing
* **n8n-nodes-document-generator** - Document generator supporting multiple format creation
* **n8n-nodes-pdfco** - PDF.co integration for PDF processing, conversion, and editing
* **n8n-nodes-webpage-content-extractor** - Web content extractor for intelligent web information extraction

#### Tools & Utilities
* **n8n-nodes-qrcode** - QR Code generation and parsing node
* **n8n-nodes-edit-image-plus** - Advanced image editing with multiple processing operations
* **@tavily/core** - Tavily AI search engine integration for intelligent web search

### Explore More Community Nodes

Looking for more powerful community nodes?

🌟 **[Awesome N8N: Top 100 Community Nodes](https://github.com/restyler/awesome-n8n)**

This curated list includes over 100 quality community nodes:
- AI/ML service integrations
- Social media platforms
- Cloud storage services
- Database connectors
- Communication tools
- And so much more!

## Quick Start

### Option 1: Use Pre-built Image (Fastest)

```bash
# Pull image (Docker automatically selects appropriate architecture)
docker pull your-dockerhub-username/n8n-community:latest

# Start n8n service
docker run -p 5678:5678 your-dockerhub-username/n8n-community:latest
```

### Option 2: Local Build and Test (Recommended for Developers)

```bash
# 1. Copy and configure environment variables
cp .env.example .env
# Edit .env file to adjust your settings

# 2. Run local build (no Docker Hub account needed)
./build.sh
# Enter 1 to select local test mode

# 3. Start services
docker-compose up -d

# 4. Open browser to access n8n
# URL: http://localhost:5678
# Default credentials: admin/adminpass
```

## Configuration

### Environment Variables (.env)

```env
# Docker image configuration
DOCKER_USERNAME=your-dockerhub-username
IMAGE_NAME=n8n-community
IMAGE_TAG=latest

# n8n base image version
N8N_VERSION=1.109.2

# Community nodes (space-separated)
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic"

# Build platforms
PLATFORMS=linux/amd64,linux/arm64

# PostgreSQL configuration
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8npass
POSTGRES_DB=n8n

# n8n authentication
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpass
```

## Build Scripts

### build.sh / build.bat

Both scripts provide two options:

1. **Local Build** (No Docker Hub login required)
   * Builds for current architecture only
   * Creates local image for testing
   * Suitable for development

2. **Multi-platform Push** (Requires Docker Hub)
   * Builds for AMD64 and ARM64
   * Pushes to Docker Hub
   * Creates multi-platform manifest

### Usage Examples

```bash
# Scenario 1: Local development testing
./build.sh
> Please choose (1 or 2): 1
# Will build image for your current system architecture

# Scenario 2: Publish to Docker Hub
./build.sh
> Please choose (1 or 2): 2
# Requires docker login first
# Will build both AMD64 and ARM64 versions
```

## Docker Compose Complete Configuration

The provided `docker-compose.yml` includes:
* n8n main service (with built-in community nodes)
* PostgreSQL database service
* Data persistence volume settings
* Container network configuration
* Complete environment variable support

### Common Commands

```bash
# Start all services
docker-compose up -d

# View n8n execution logs
docker-compose logs -f n8n

# Stop services (preserve data)
docker-compose down

# Complete cleanup (including volumes)
docker-compose down -v
```

## How It Works

### Dockerfile Architecture

1. **Base Image**: Uses `n8nio/n8n:${N8N_VERSION}` (version adjustable)
2. **Node Installation**: Installs community nodes in `~/.n8n/nodes` directory
3. **Permissions**: Ensures node user has correct file permissions
4. **Package Installation**: Executes `npm install` as node user

This approach fully follows n8n's official manual community node installation process.

### Community Node Management

Edit the `COMMUNITY_NODES` variable in .env file to add or remove nodes:

```env
# Single node
COMMUNITY_NODES="n8n-nodes-mcp"

# Multiple nodes (default configuration)
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic"

# Add custom nodes
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic n8n-nodes-your-custom"
```

#### Common Community Node Examples

```env
# AI/LLM Integration
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-openai-assistant n8n-nodes-langchain @tavily/core"

# Taiwan Local Services
COMMUNITY_NODES="n8n-nodes-linewebhook n8n-nodes-ragic"

# Document & Content Processing
COMMUNITY_NODES="n8n-nodes-document-generator n8n-nodes-pdfco n8n-nodes-webpage-content-extractor"

# Community Platform Integration
COMMUNITY_NODES="n8n-nodes-discord-trigger n8n-nodes-linewebhook"

# Image & Media Processing
COMMUNITY_NODES="n8n-nodes-qrcode n8n-nodes-edit-image-plus"

# Database & API
COMMUNITY_NODES="n8n-nodes-mongodb n8n-nodes-graphql n8n-nodes-redis"

# Complete Feature Set (includes all recommended nodes)
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic n8n-nodes-discord-trigger n8n-nodes-qrcode n8n-nodes-webpage-content-extractor n8n-nodes-document-generator n8n-nodes-pdfco @tavily/core n8n-nodes-edit-image-plus"
```

💡 **Pro Tip**: Explore more quality nodes at [Awesome N8N](https://github.com/restyler/awesome-n8n)!

### Update n8n Version

Simply change `N8N_VERSION` in .env:

```env
# Update to latest version
N8N_VERSION=1.110.0
```

## Architecture Support

| Platform | Architecture | Support |
|----------|-------------|---------|
| macOS (Apple Silicon) | ARM64 | ✅ Native |
| macOS (Intel) | AMD64 | ✅ Native |
| Linux | AMD64 | ✅ Native |
| Linux | ARM64 | ✅ Native |
| Windows | AMD64 | ✅ Via Docker Desktop |
| Windows | ARM64 | ✅ Via Docker Desktop |

## Troubleshooting

### Build Issues

```bash
# Confirm Docker service status
docker version

# Verify buildx tool installation
docker buildx version

# Reset builder if encountering issues
docker buildx rm n8n-multiplatform
```

### Community Node Loading Issues

```bash
# Confirm node installation status
docker exec n8n-container ls -la /home/node/.n8n/nodes

# View related error messages
docker-compose logs n8n | grep -i "node"
```

### Script Input Issues

Build scripts automatically clear excess spaces from input. If encountering issues, ensure you only enter "1" or "2", avoiding other characters.

## File Structure

```
community/
├── Dockerfile           # Multi-stage build with ARG support
├── docker-compose.yml   # Complete n8n + PostgreSQL setup
├── build.sh            # Unix/Linux/macOS build script
├── build.bat           # Windows build script
├── .env.example        # Configuration template
└── README.md           # This file
```

## Docker Compose Usage Guide

### PostgreSQL Database Integration

1. **Initialize Environment Settings**:
```bash
cp .env.example .env
# Edit .env file to set your parameters
```

2. **Start All Services**:
```bash
docker-compose up -d
```

3. **Access n8n Admin Interface**:
* URL: http://localhost:5678
* Default credentials: admin/adminpass (can be modified in .env)

4. **Stop Service Options**:
```bash
# Preserve data
docker-compose down

# Complete cleanup (including volumes)
docker-compose down -v
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DOCKER_USERNAME` | Docker Hub username | Required for builds |
| `IMAGE_NAME` | Docker image name | `n8n-community` |
| `IMAGE_TAG` | Docker image tag | `latest` |
| `N8N_VERSION` | n8n base image version | `1.109.2` |
| `COMMUNITY_NODES` | Space-separated node list | `n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic` |
| `PLATFORMS` | Build platforms | `linux/amd64,linux/arm64` |
| `POSTGRES_USER` | PostgreSQL username | `n8n` |
| `POSTGRES_PASSWORD` | PostgreSQL password | `n8npass` |
| `N8N_BASIC_AUTH_USER` | n8n login username | `admin` |
| `N8N_BASIC_AUTH_PASSWORD` | n8n login password | `adminpass` |

## System Requirements

### Minimum Requirements for Building Images
* Docker 20.10 or higher
* Docker buildx tool
* Docker Hub account (required for publishing)

### Recommended Runtime Environment
* Docker 20.10 or higher
* 2GB+ RAM

## Common Issues and Solutions

### Image Build Related
* Confirm buildx installation: `docker buildx version`
* Docker Hub login: `docker login`
* View builder list: `docker buildx ls`

### Runtime Issues
* Check image architecture: `docker image inspect your-username/n8n-community:latest | grep Architecture`
* View container logs: `docker logs container-name`
* Verify port status: `lsof -i :5678`

## Support

* n8n Documentation: https://docs.n8n.io
* Community Forum: https://community.n8n.io
* This Project: Create an issue for build problems