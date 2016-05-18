FROM armel/debian:jessie
MAINTAINER Carlos Sánchez

ENV QEMU_CPU arm1176
ENV QEMU_EXECVE 1
COPY . /usr/bin
RUN [ "cross-build-start" ]

RUN  apt-get update                                                     && \
     apt-get install -y --no-install-recommends                            \
	 python2.7                                                             \
	 python2.7-dev                                                         \
	 python-pip                                                            \
	 libffi-dev                                                            \
	 libasound2-dev                                                        \
	 build-essential                                                    && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://github.com/sashahilton00/spotify-connect-resources/raw/master/libs/armel/armv6/release-esdk-1.18.0-v1.18.0-g121b4b2b/libspotify_embedded_shared.so /usr/lib/

ENTRYPOINT ["/bin/bash"]

RUN [ "cross-build-end" ]
