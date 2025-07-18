#!/bin/sh

echo "Running Nuclei scan..."

# Create directory for output if not exists
mkdir -p /output

# Run a simple scan (you can expand this with your target list)
echo "https://example.com" > /tmp/targets.txt

# Run nuclei
nuclei -l /tmp/targets.txt -o /output/result.txt

echo "Scan complete. Output saved to /output/result.txt"
