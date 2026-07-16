#!/bin/bash
set -e

echo "=== Installing Official Compact Compiler ==="
# Download and install the latest stable version of compact
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/midnightntwrk/compact/releases/latest/download/compact-installer.sh | sh -s -- -y

# Symlink the binary to a global PATH location so it's accessible everywhere inside the Codespace
sudo ln -sf "$HOME/.compact/bin/compact" /usr/local/bin/compact

# Initialize and verify the compiler works
compact update
echo "Compact version installed:"
compact --version

echo "=== Pre-fetching Midnight Dev Containers ==="
# Cache the core microservices so they launch instantly later
docker pull midnightntwrk/proof-server:latest
