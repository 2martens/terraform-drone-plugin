FROM hashicorp/tfci

LABEL maintainer="docker@2martens.de" description="Terraform for Drone"
RUN mkdir -p /opt/terraform/bin
COPY tool.sh /opt/terraform/bin
RUN chmod +x /opt/terraform/bin/tool.sh
ENTRYPOINT ["/opt/terraform/bin/tool.sh"]
