
#!/bin/sh

# Set the target (replace with your actual target or input source)
echo "https://example.com" > urls.txt

# Update nuclei templates
nuclei -update-templates

# Run nuclei with lightweight settings to avoid OOM (Out of Memory)
nuclei -l urls.txt -t cves/ -severity medium,high,critical -rl 20 -c 10 -nc -json -o results.json
