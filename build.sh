#!/usr/bin/env sh

rm -f build/*

cd prometheus
go get
echo "Building kafka_connect_metrics_exporter"
go build -o ../build/kafka_connect_metrics_exporter
echo "Done"
