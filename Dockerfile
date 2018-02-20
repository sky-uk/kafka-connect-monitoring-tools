# This is a multi build docker file

# Build binary
FROM golang:1.9-alpine3.6 as builder
RUN mkdir -p /src/kafka-connect-monitoring-tools 
ADD . /src/kafka-connect-monitoring-tools/ 
WORKDIR /src/kafka-connect-monitoring-tools
ENV GOPATH /
RUN ./build.sh

# Clean image with just binary
FROM alpine:3.6
RUN mkdir -p /src/kafka-connect-monitoring-tools/build/
COPY --from=builder /src/kafka-connect-monitoring-tools/build/kafka_connect_metrics_exporter /src/kafka-connect-monitoring-tools/build/kafka_connect_metrics_exporter

CMD ["/src/kafka-connect-monitoring-tools/build/kafka_connect_metrics_exporter"]
