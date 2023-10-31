FROM amazonlinux:2023

RUN yum install -y yum-utils shadow-utils
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
RUN yum -y install terraform

LABEL maintainer="docker@2martens.de" description="Terraform for Drone"
COPY tool.sh /usr/local/bin
RUN chmod +x /usr/local/bin/tool.sh
ENTRYPOINT ["/usr/local/bin/tool.sh"]
