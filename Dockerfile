FROM oraclelinux:7-slim
LABEL maintainer="Raghavendra Eranki"
RUN yum install -y git
ENTRYPOINT [ "/bin/bash" ]
