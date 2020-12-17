FROM golang:latest
WORKDIR /go/src/app
RUN echo "deb http://http.us.debian.org/debian testing main non-free contrib" >> /etc/apt/sources.list && \
    apt-get update && \
    apt install --yes gcc-8-base rtl-sdr
RUN go get github.com/bemasher/rtlamr
RUN go get github.com/bemasher/rtlamr-collect

ENV RTLAMR_FORMAT=json
#ENV RTLAMR_FILTERID=44152170
ENV COLLECT_INFLUXDB_HOSTNAME="http://192.168.244.49:8086"
ENV COLLECT_INFLUXDB_DATABASE=rtlamr
ENV COLLECT_INFLUXDB_USER=rtlamr
ENV COLLECT_INFLUXDB_PASS=rtlamr

COPY init.sh /go/src/app

CMD ./init.sh