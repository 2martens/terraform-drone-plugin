FROM alpine
ARG TARGETARCH

RUN wget "https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_linux_$TARGETARCH.zip" -O "/tmp/terraform_1.6.2_linux_$TARGETARCH.zip"  \
    && unzip "/tmp/terraform_1.6.2_linux_$TARGETARCH.zip" -d /usr/local/bin  \
    && chmod +x /usr/local/bin/terraform

LABEL maintainer="docker@2martens.de" description="Terraform for Drone"
COPY tool.sh /usr/local/bin
RUN chmod +x /usr/local/bin/tool.sh
ENTRYPOINT ["/usr/local/bin/tool.sh"]
