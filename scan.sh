#!/bin/sh

# Download latest templates
nuclei -update-templates

# Check if input.txt exists
if [ ! -f input.txt ]; then
  echo "❌ input.txt not found!"
  exit 1
fi

echo "📡 Starting Nuclei scan..."
nuclei -l input.txt -o output.json

echo "✅ Scan complete. Output:"
cat output.json
