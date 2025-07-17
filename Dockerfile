FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
  curl unzip

# Install Nuclei
RUN curl -s https://api.github.com/repos/projectdiscovery/nuclei/releases/latest \
  | grep "browser_download_url.*linux_amd64.zip" \
  | cut -d '"' -f 4 \
  | wget -qi - && \
  unzip nuclei_*_linux_amd64.zip && mv nuclei /usr/local/bin/ && rm nuclei_*_linux_amd64.zip

# Update templates on build
RUN nuclei -update-templates

COPY scan.sh /usr/local/bin/scan.sh
RUN chmod +x /usr/local/bin/scan.sh

ENTRYPOINT ["scan.sh"]
