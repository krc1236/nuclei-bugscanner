#!/bin/bash

# Default input URL for nuclei
echo "https://example.com" > input.txt

# Run nuclei scan and save output
nuclei -l input.txt -o output.txt

# Print the results
cat output.txt
