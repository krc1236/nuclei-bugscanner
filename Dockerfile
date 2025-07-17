FROM debian:stable-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl unzip wget bash && \
  apt-get clean

# Install Nuclei
RUN curl -s https://api.github.com/repos/projectdiscovery/nuclei/releases/latest \
  | grep "browser_download_url.*linux_amd64.zip" \
  | cut -d '"' -f 4 \
  | wget -qi - && \
  unzip nuclei_*_linux_amd64.zip && mv nuclei /usr/local/bin/ && rm nuclei_*_linux_amd64.zip

# Update Nuclei templates
RUN nuclei -update-templates

# Copy scan script
COPY scan.sh /scan.sh
RUN chmod +x /scan.sh

ENTRYPOINT ["/scan.sh"]
