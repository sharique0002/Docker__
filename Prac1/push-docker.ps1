# PowerShell script to automate Docker image push to Docker Hub
# Usage: .\push-docker.ps1 [-Tag <version>]

param(
    [Parameter(Mandatory=$false)]
    [string]$Tag = "v1"
)

# Configuration
$LocalImageName = "pythonll"
$DockerHubUsername = "<REPLACE_WITH_MY_USERNAME>"

# Stop on any error
$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Docker Hub Push Automation Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check if Docker is installed
Write-Host "[1/5] Checking if Docker is installed..." -ForegroundColor Yellow
try {
    $dockerVersion = docker --version 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "Docker command failed"
    }
    Write-Host "✓ Docker is installed: $dockerVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: Docker is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Docker Desktop from https://www.docker.com/products/docker-desktop" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Step 2: Verify that the local image exists
Write-Host "[2/5] Verifying local image '$LocalImageName' exists..." -ForegroundColor Yellow
try {
    $imageExists = docker images --format "{{.Repository}}" | Where-Object { $_ -eq $LocalImageName }
    if (-not $imageExists) {
        throw "Image not found"
    }
    Write-Host "✓ Local image '$LocalImageName' found" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: Image '$LocalImageName' does not exist locally" -ForegroundColor Red
    Write-Host "Available images:" -ForegroundColor Yellow
    docker images
    exit 1
}

Write-Host ""

# Step 3: Prompt user to login to Docker Hub
Write-Host "[3/5] Docker Hub Authentication" -ForegroundColor Yellow
Write-Host "Please login to Docker Hub (you will be prompted for credentials):" -ForegroundColor Cyan
Write-Host ""

try {
    docker login
    if ($LASTEXITCODE -ne 0) {
        throw "Docker login failed"
    }
    Write-Host ""
    Write-Host "✓ Successfully logged in to Docker Hub" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: Docker login failed" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Step 4: Tag the image
$TaggedImageName = "$DockerHubUsername/$LocalImageName`:$Tag"
Write-Host "[4/5] Tagging image as '$TaggedImageName'..." -ForegroundColor Yellow
try {
    docker tag $LocalImageName $TaggedImageName
    if ($LASTEXITCODE -ne 0) {
        throw "Docker tag failed"
    }
    Write-Host "✓ Image tagged successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: Failed to tag image" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Step 5: Push the image to Docker Hub
Write-Host "[5/5] Pushing image to Docker Hub..." -ForegroundColor Yellow
Write-Host "This may take a while depending on image size and network speed..." -ForegroundColor Cyan
try {
    docker push $TaggedImageName
    if ($LASTEXITCODE -ne 0) {
        throw "Docker push failed"
    }
    Write-Host ""
    Write-Host "✓ Image pushed successfully to Docker Hub!" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: Failed to push image to Docker Hub" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "SUCCESS: Deployment Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Your image is now available at:" -ForegroundColor White
Write-Host "  https://hub.docker.com/r/$DockerHubUsername/$LocalImageName" -ForegroundColor White
Write-Host ""
Write-Host "To pull this image on another machine, use:" -ForegroundColor White
Write-Host "  docker pull $TaggedImageName" -ForegroundColor Cyan
Write-Host ""
