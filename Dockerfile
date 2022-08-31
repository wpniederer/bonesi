FROM ubuntu:latest

LABEL version="1.0" \
      docker_build="docker build -f Dockerfile -t bonesi-image:1.0 ." \
      docker_run_basic="docker run --rm -it --network="host" bonesi-container bonesi <your command>"

COPY . app
RUN apt-get update && apt-get install -y gcc libpcap-dev libnet-dev make automake autoconf m4 perl libtool

WORKDIR app
RUN autoreconf -f -i
RUN ./configure
RUN make
RUN make install
