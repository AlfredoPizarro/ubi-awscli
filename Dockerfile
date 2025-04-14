FROM registry.redhat.io/ubi8/ubi

ENV HOME=/tmp
ENV LANG=en_US.UTF-8
ENV TERM=xterm-256color

RUN yum install -y \
    unzip \
    curl \
    gzip \
    tar \
    less \
    && yum clean all

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

RUN aws --version

CMD ["/bin/sh", "-c", "sleep infinity"]
