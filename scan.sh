#!/bin/bash

# Download nuclei templates if not already present
if [ ! -d "/root/nuclei-templates" ]; then
  echo "Downloading nuclei templates..."
  git clone https://github.com/projectdiscovery/nuclei-templates.git /root/nuclei-templates
fi

# Run scan
nuclei -u "$1" -t /root/nuclei-templates -json -o result.json

# Print result
cat result.json
