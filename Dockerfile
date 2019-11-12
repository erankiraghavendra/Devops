FROM oraclelinux:7-slim
LABEL maintainer="Raghavendra Eranki"
RUN yum install -y \
	ruby-devel \
	gcc \
	make \
	ruby \
	rpm-build \
	rpm-sign && yum clean all
  ENTRYPOINT [ "/bin/bash" ]
