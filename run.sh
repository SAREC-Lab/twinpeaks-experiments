#!/usr/bin/env bash
set -euo pipefail

IMAGE="twinpeaks-viewer"
PORT="8080"
TARBALL="twinpeaks-viewer.tar.gz"

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║           Twin Peaks Viewer — DroneResponse          ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# Load the image if not already present
if ! docker image inspect "$IMAGE" &>/dev/null; then
  if [ ! -f "$TARBALL" ]; then
    echo "Error: $TARBALL not found in current directory." >&2
    echo "Please place $TARBALL alongside this script and try again." >&2
    exit 1
  fi
  echo "Loading Docker image (one-time setup, may take a moment)..."
  docker load < "$TARBALL"
  echo ""
fi

# Stop any existing container on that port
if docker ps --format '{{.Names}}' | grep -q "^tp-viewer$"; then
  echo "Stopping previous viewer instance..."
  docker stop tp-viewer &>/dev/null
fi

echo "Starting viewer..."
docker run --rm -d -p "$PORT:80" --name tp-viewer "$IMAGE" &>/dev/null

echo ""
echo "  ✓ Viewer is running."
echo ""
echo "  Open your browser and go to:"
echo ""
echo "      http://localhost:$PORT"
echo ""
echo "  To stop the viewer, run:  docker stop tp-viewer"
echo ""
