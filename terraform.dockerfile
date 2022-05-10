FROM alpine
MAINTAINER Engineer

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /
RUN apk add --no-cache ca-certificates curl

ENTRYPOINT [ "/terraform" ]