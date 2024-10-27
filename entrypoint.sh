#!/bin/sh

# URL of the script to download
SCRIPT_URL="https://raw.githubusercontent.com/balu100/simc-aoe-profiles/main/torun.sh"
# Path where the script will be saved
SCRIPT_PATH="/app/SimulationCraft/torun.sh"
# Log file path (optional)
LOG_FILE="/var/log/torun_download.log"

# Download the latest version of the script with retries and timestamp to avoid caching
echo "Downloading the latest script from $SCRIPT_URL..." | tee -a "$LOG_FILE"
curl -fsSL --retry 3 --retry-delay 5 -H "Cache-Control: no-cache" "$SCRIPT_URL?$(date +%s)" -o "$SCRIPT_PATH" >> "$LOG_FILE" 2>&1

# Check if the download succeeded and the file is not empty
if [ ! -s "$SCRIPT_PATH" ]; then
    echo "Download failed or file is empty. Exiting." | tee -a "$LOG_FILE"
    exit 1
fi

# Make the script executable
chmod +x "$SCRIPT_PATH"

# Run the script
echo "Running the script..." | tee -a "$LOG_FILE"
exec "$SCRIPT_PATH"
