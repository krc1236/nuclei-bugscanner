#!/bin/bash

# Check for required environment variable
if [ -z "$WEBHOOK_URL" ]; then
  echo "WEBHOOK_URL not set"
  exit 1
fi

# Run the scan and save output to file
nuclei -u https://testphp.vulnweb.com -o result.json -json

# Check if the output file exists
if [ ! -f result.json ]; then
  echo "No results file found"
  exit 1
fi

# Send the results to your webhook (Make, Discord, etc.)
curl -X POST -H "Content-Type: application/json" \
     -d @"result.json" \
     "$WEBHOOK_URL"
