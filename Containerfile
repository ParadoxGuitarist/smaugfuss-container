FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y build-essential automake autoconf zlib1g-dev csh net-tools git && \
    apt-get clean

WORKDIR /opt/
RUN git clone https://github.com/Arthmoor/SmaugFUSS.git
WORKDIR SmaugFUSS/src
RUN make && \
    chmod a+x ./startup

EXPOSE 4020
CMD [ "./startup" ]
