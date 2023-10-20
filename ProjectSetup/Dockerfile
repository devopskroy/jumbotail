
FROM jenkins/inbound-agent


LABEL maintainer="kishan <roykishan8@gmail.com>"

USER root
RUN apt-get update && \
    apt-get install -y openjdk-11-jre && \
    apt-get clean


RUN curl -fsSL -o /usr/local/bin/helm https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod +x /usr/local/bin/helm


RUN curl -fsSL -o /tmp/awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" && \
    unzip /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip


RUN apt-get install -y maven && \
    apt-get clean


USER jenkins


ENTRYPOINT ["jenkins-agent"]
