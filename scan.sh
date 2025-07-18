#!/bin/bash

# Exit on error
set -e

# Define your scan target
TARGET_URL="https://example.com"  # Replace this with your actual target URL or domain list

# Download latest templates if not already present
if [ ! -d "./templates" ]; then
  nuclei -update-templates
else
  nuclei -update-templates -ut ./templates
fi

# Run Nuclei scan with JSON output
nuclei -target "$TARGET_URL" -t ./templates -o result.json -json

# Check if result file exists and is not empty
if [ -s result.json ]; then
  echo "Scan completed. Results:"
  cat result.json

  # Optional: Send results to a webhook (e.g., Make / Zapier)
  if [ ! -z "$WEBHOOK_URL" ]; then
    curl -X POST -H "Content-Type: application/json" --data @result.json "$WEBHOOK_URL"
    echo "Results sent to webhook."
  else
    echo "No WEBHOOK_URL set, skipping webhook upload."
  fi
else
  echo "No results found or empty output."
fi
