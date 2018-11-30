#!/usr/bin/env bash

if [[ $# -eq 0 ]]
then
    echo "No arguments supplied. Expected service name (e.g.: super_resolution)."
    exit 1
fi

env service_name=$1

python3.6 -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. service/service_spec/$service_name.proto