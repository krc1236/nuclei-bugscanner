#!/bin/sh

# Make sure templates are updated
nuclei -update-templates

# Set target (replace with a domain or put in urls.txt)
echo "https://example.com" > urls.txt

# Run a lightweight scan to avoid memory errors
nuclei -l urls.txt -t cves/ -severity medium,high,critical -rl 15 -c 5 -json -o results.json
