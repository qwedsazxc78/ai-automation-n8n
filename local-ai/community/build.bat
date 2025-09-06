@echo off
REM Build script for n8n Community Docker Image
REM Supports both local testing and Docker Hub push

REM Load environment variables from .env file if it exists
if exist .env (
    for /f "delims=" %%x in (.env) do (
        echo %%x | findstr /c:"=" >nul && set "%%x"
    )
)

REM Set defaults if not in .env
if "%DOCKER_USERNAME%"=="" set DOCKER_USERNAME=your-dockerhub-username
if "%IMAGE_NAME%"=="" set IMAGE_NAME=n8n-community
if "%IMAGE_TAG%"=="" set IMAGE_TAG=latest
if "%N8N_VERSION%"=="" set N8N_VERSION=1.109.2
if "%COMMUNITY_NODES%"=="" set COMMUNITY_NODES=n8n-nodes-mcp
if "%PLATFORMS%"=="" set PLATFORMS=linux/amd64,linux/arm64

REM Detect current architecture
set CURRENT_ARCH=amd64
wmic cpu get architecture | findstr /c:"9" >nul && set CURRENT_ARCH=amd64
wmic cpu get architecture | findstr /c:"12" >nul && set CURRENT_ARCH=arm64

echo ============================================
echo n8n Community Docker Builder
echo ============================================
echo Image: %DOCKER_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG%
echo Base n8n Version: %N8N_VERSION%
echo Community Nodes: %COMMUNITY_NODES%
echo Current Architecture: %CURRENT_ARCH%
echo.

REM Check if Docker is running
docker version >nul 2>&1
if errorlevel 1 (
    echo Error: Docker is not running or not installed
    echo Please start Docker Desktop and try again
    exit /b 1
)

echo Choose build option:
echo 1) Build for local testing (current architecture only)
echo 2) Build and push to Docker Hub (multi-platform)
echo.
set /p choice="Enter choice (1 or 2): "

if "%choice%"=="1" (
    echo.
    echo Building for local testing (current architecture only)...
    echo.
    
    REM Build for current platform
    docker build ^
        --build-arg N8N_VERSION="%N8N_VERSION%" ^
        --build-arg COMMUNITY_NODES="%COMMUNITY_NODES%" ^
        --tag %DOCKER_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG% ^
        --tag %DOCKER_USERNAME%/%IMAGE_NAME%:latest ^
        .
    
    if errorlevel 1 (
        echo.
        echo Build failed!
        echo Please check the error messages above
        exit /b 1
    )
    
    echo.
    echo Successfully built local image!
    echo.
    echo Local Image:
    echo    %DOCKER_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG%
    echo    %DOCKER_USERNAME%/%IMAGE_NAME%:latest
    echo.
    echo Test locally with:
    echo    docker-compose up -d
    echo.
    echo Or run directly:
    echo    docker run -p 5678:5678 %DOCKER_USERNAME%/%IMAGE_NAME%:latest
    echo.
    echo Access n8n at: http://localhost:5678
    
) else if "%choice%"=="2" (
    echo.
    echo Setting up Docker buildx for multi-platform builds...
    docker buildx ls | findstr "n8n-multiplatform" >nul 2>&1
    if errorlevel 1 (
        echo Creating multi-platform builder...
        docker buildx create --name n8n-multiplatform --platform %PLATFORMS% --use
        docker buildx inspect --bootstrap
    ) else (
        echo Using existing multi-platform builder...
        docker buildx use n8n-multiplatform
    )
    
    echo.
    echo This will build a multi-platform image and push to Docker Hub.
    echo Platforms: %PLATFORMS%
    echo.
    
    REM Login to Docker Hub
    echo Logging in to Docker Hub...
    docker login
    
    if errorlevel 1 (
        echo Failed to login to Docker Hub
        echo Please ensure you have a Docker Hub account and correct credentials
        exit /b 1
    )
    
    echo.
    echo Building and pushing multi-platform image...
    echo This may take a few minutes...
    echo.
    
    REM Build and push with all platforms
    docker buildx build ^
        --platform %PLATFORMS% ^
        --build-arg N8N_VERSION="%N8N_VERSION%" ^
        --build-arg COMMUNITY_NODES="%COMMUNITY_NODES%" ^
        --tag %DOCKER_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG% ^
        --tag %DOCKER_USERNAME%/%IMAGE_NAME%:latest ^
        --push ^
        --progress plain ^
        .
    
    if errorlevel 1 (
        echo.
        echo Build/push failed!
        echo Please check the error messages above
        exit /b 1
    )
    
    echo.
    echo Successfully built and pushed multi-platform image!
    echo.
    echo Docker Hub Repository:
    echo    docker.io/%DOCKER_USERNAME%/%IMAGE_NAME%
    echo    Tags: %IMAGE_TAG%, latest
    echo    Platforms: %PLATFORMS%
    echo.
    echo Users can now pull with:
    echo    docker pull %DOCKER_USERNAME%/%IMAGE_NAME%:latest
    
) else (
    echo Invalid choice. Exiting.
    exit /b 1
)

echo.
echo Done!
pause