FROM alpine

RUN apk add --no-cache curl jq bash git

# Install nuclei
RUN wget https://github.com/projectdiscovery/nuclei/releases/download/v3.4.7/nuclei_3.4.7_linux_amd64.zip && \
    unzip nuclei_3.4.7_linux_amd64.zip && \
    mv nuclei /usr/local/bin && \
    nuclei -update-templates

COPY scan.sh /scan.sh
RUN chmod +x /scan.sh

CMD ["/scan.sh"]
