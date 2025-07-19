#!/bin/bash

# Download nuclei templates if not already present
if [ ! -d "/root/nuclei-templates" ]; then
  echo "[*] Downloading nuclei-templates..."
  git clone https://github.com/projectdiscovery/nuclei-templates.git /root/nuclei-templates
fi

# Create a sample input file
echo "https://example.com" > input.txt

# Run nuclei scan
nuclei -l input.txt -t /root/nuclei-templates -o output.txt

# Show output
cat output.txt
