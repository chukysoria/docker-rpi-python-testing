FROM resin/rpi-raspbian:jessie
MAINTAINER Carlos Sánchez

ENV QEMU_EXECVE 1
COPY . /usr/bin
RUN [ "cross-build-start" ]

RUN  apt-get update                                                         && \
     apt-get install -y --no-install-recommends                                \
	 git                                                                   \
	 python                                                                \
	 python-dev                                                            \
	 python-pip                                                            \
	 python3                                                               \
	 python3-dev                                                           \
	 libffi-dev                                                            \
	 libasound2-dev                                                        \
	 pandoc                                                                \
	 build-essential                                                    && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*         && \
     sed -i 's/jessie/stretch/g' /etc/apt/sources.list                      && \
     apt-get update                                                         && \
     apt-get install -y --no-install-recommends                                \
	 pypy                                                                  \
	 pypy-dev                                                           && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/bash"]

RUN [ "cross-build-end" ]
