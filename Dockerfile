FROM armel/debian:jessie
MAINTAINER Carlos Sánchez

ENV QEMU_CPU arm1176
ENV QEMU_EXECVE 1
COPY . /usr/bin
RUN [ "cross-build-start" ]

RUN  apt-get update                                                         && \
     apt-get install -y --no-install-recommends                                \
	 pandoc                                                             && \
     sed -i 's/jessie/stretch/g' /etc/apt/sources.list                      && \
     apt-get update                                                         && \
     apt-get install -y --no-install-recommends                                \
	 git                                                                   \
	 python2.7                                                             \
	 python2.7-dev                                                         \
	 python-pip                                                            \
	 python-setuptools                                                     \
	 python3.4                                                             \
	 python3.4-dev                                                         \
	 python3.5                                                             \
	 python3.5-dev                                                         \
	 pypy                                                                  \
	 pypy-dev                                                              \
	 libffi-dev                                                            \
	 libasound2-dev                                                        \
	 build-essential                                                    && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/bash"]

RUN [ "cross-build-end" ]
