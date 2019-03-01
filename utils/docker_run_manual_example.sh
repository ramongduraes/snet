#!/usr/bin/env bash

docker run --runtime=nvidia --name PLACES365_FIXES --restart unless-stopped -p 7019:7019 -p 7079:7079 -v ~/singnet/.certs:/opt/singnet/.certs -v ~/singnet/etcd/places365-scene-recognition:/opt/singnet/dnn-model-services/Services/gRPC/places365-scene-recognition/etcd -it places365_scene_recognition:ramongduraes bash -c "git pull origin fixing-scene-recognition;python3 run_scene_recognition_service.py --ssl"

# docker run --runtime=nvidia --name SUPER_RESOLUTION_TESTING --restart unless-stopped -p 7017:7017 -p 7067:7067 -v ~/singnet/.certs:/opt/singnet/.certs -v ~/singnet/etcd/super-resolution-service:/opt/singnet/super-resolution-service/etcd -it super_resolution:ramongduraes bash -c "git pull origin updating-daemon-0.1.7;python3 run_service.py --ssl"