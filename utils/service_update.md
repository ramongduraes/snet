# Creating the service code: TOOLS

- docker logs CONTAINER_NAME will show everything thats logged inside it!

# Instructions on how to update a service

1. Manually publish it on every network:
    - Activate snet-cli virtual environment
    - Verify its version agaist latest / update:
        - cd to snet-cli
        - git fetch upstream
        - git merge upstream/master
        - ./scripts/blockchain install
        - pip3 install -e .
    - Create the service metadata 
        - snet service metadata-init service/service_spec/ "SERVICE DISPLAY NAME" 0xCEb196e0236C5B4EE62d5C87692284FBd52fCBD0 --endpoints http://54.203.198.53:7067 --fixed-price 0
        - change display name, endpoint
        - snet service metadata-add-description --url "" --description ""
    - Publish the service
        - snet service publish -y ORG_ID SERVICE_ID
    - Change network
        - snet network NETWORK_NAME
    - Repeat
2. Configure Daemon
    - verify if its the latest version
    - configure port;
    - configure etcd;
    - remove http;
    - 0.0.0.0 instead of localhost;
    - replicate daemon file for each network
3. Update SERVICE_RUN_SCRIPT so that it runs an instance of SNET Daemon per config file;
4. Update Dockerfile
    - update daemon installation script
5. CircleCI
    - Update CircleCI so that it knows what github account / repo / branch the PRs are comming from
    - Beware of caching (docker build --no-cache helps! Also, verify docker image on AWS: was it created? When ?).
    - Remember that only on singnet/master the service will actually be deployed
6. Adding a UI
    - add service.js to dapp's /src/components/service
        - actual service call at "submit action"
    - add service to /src/components/service/serviceMappings.js
    - Verify inputs and its types
    
    
    
___
METADATA EXAMPLE:

```bash
{
    "version": 1,
    "display_name": "Style Transfer",
    "encoding": "proto",
    "service_type": "grpc",
    "payment_expiration_threshold": 40320,
    "model_ipfs_hash": "Qmd4vQRQJFbubjbUqY359AZVbH89i4eusMraGiKa8J6TBN",
    "mpe_address": "0x39f31Ac7B393fE2C6660b95b878FEB16eA8f3156",
    "pricing": {
        "price_model": "fixed_price",
        "price_in_cogs": 0
    },
    "groups": [
        {
            "group_name": "default_group",
            "group_id": "unEV8lrAanIGLQskeCPD4Z/VBAHgIyoUkHC5bcQeVQQ=",
            "payment_address": "0xCEb196e0236C5B4EE62d5C87692284FBd52fCBD0"
        }
    ],
    "endpoints": [
        {
            "group_name": "default_group",
            "endpoint": "http://54.203.198.53:7018"
        }
    ],
    "service_description": {
        "url": "https://github.com/singnet/style-transfer-service",
        "description": "Uses deep neural networks to transfer the artistic style of a Style Image to a Content Image"
    }
}
```
___