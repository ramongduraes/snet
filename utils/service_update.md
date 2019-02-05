# Instructions on how to update a service

1. Manually publish it on every network:
    - snet service metadata-init service/service_spec/ super-resolution 0xCEb196e0236C5B4EE62d5C87692284FBd52fCBD0 --endpoints http://54.203.198.53:7067 --fixed-price 0
        - change endpoint
    - snet service publish snet super-resolution
    - snet network ropsten
    - repeat
2. Configure Daemon
    - configure port;
    - configure etcd;
    - remove http;
    - 0.0.0.0 instead of localhost;
    - replicate daemon file for each network
3. Update SERVICE_RUN_SCRIPT so that it runs an instance of SNET Daemon per config file;
4. Update Dockerfile
    - update daemon installation script
5. Update CircleCI so that it knows what github account / repo / branch the PRs are comming from
6. Adding a UI
    - add service.js to dapp's /src/components/service
    - add service to /src/components/service/serviceMappings.js
        - actual service call at "submit action"