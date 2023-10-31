FROM hashicorp/tfci

LABEL maintainer="docker@2martens.de" description="Terraform for Drone"
COPY tool.sh /usr/local/bin
RUN chmod +x /usr/local/bin/tool.sh
ENTRYPOINT ["tool.sh"]
