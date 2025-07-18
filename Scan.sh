#!/bin/sh

# TARGET URL TO SCAN
TARGET="https://hackerone.com"  # Change this if needed

# Run nuclei scan
nuclei -u "$TARGET" -o results.txt

# Check if any results
if [ -s results.txt ]; then
  echo "Results found"
  cat results.txt
else
  echo "No results file found" > results.txt
fi

# Send results to webhook (Make.com)
curl -X POST https://hook.us1.make.com/YOUR_WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d "{\"results\": \"$(cat results.txt | sed 's/\"/\\"/g')\"}"
#!/bin/sh

# Update nuclei templates
nuclei -update-templates

# Run nuclei on target.txt
nuclei -l target.txt -o result.txt
