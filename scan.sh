#!/bin/bash

# Default target if none provided
TARGET=${TARGET_URL:-https://testphp.vulnweb.com}

echo "[*] Running Nuclei scan on: $TARGET"
nuclei -u "$TARGET" -json -o /tmp/result.json

# Check and send results to webhook if defined
if [ -f /tmp/result.json ] && [ -n "$WEBHOOK_URL" ]; then
  curl -X POST -H "Content-Type: application/json" \
    --data-binary @/tmp/result.json "$WEBHOOK_URL"
else
  echo "No results file found or WEBHOOK_URL not set."
fi
