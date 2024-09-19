#!/bin/sh

# URL of the script to download
SCRIPT_URL="https://raw.githubusercontent.com/balu100/simc-aoe-profiles/main/torun.sh"

# Path where the script will be saved
SCRIPT_PATH="/app/SimulationCraft/torun.sh"

# Download the latest version of the script with a timestamp to avoid caching
echo "Downloading the latest script from $SCRIPT_URL..."
curl -fsSL "$SCRIPT_URL?$(date +%s)" -o "$SCRIPT_PATH"

# Make the script executable
chmod +x "$SCRIPT_PATH"

# Run the script
echo "Running the script..."
exec "$SCRIPT_PATH"
