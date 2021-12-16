#!/bin/sh

TAGS=`curl -L -s 'https://registry.hub.docker.com/v2/repositories/wso2/wso2is/tags/' | jq --raw-output '.results[].name'`; 
UBUNTU_TAGS=$(for t in `echo "$TAGS" | grep -v -e centos -e alpine`; do echo $t; done); 
ALPINE_TAGS=$(for t in `echo "$TAGS" | grep alpine`; do echo $t; done); 
CENTOS_TAGS=$(for t in `echo "$TAGS" | grep centos`; do echo $t; done);

for t in `echo "$UBUNTU_TAGS"`; do docker build --build-arg=IMAGE=wso2/wso2is:$t ./ubuntu -t codebling/wso2is:$t && docker push codebling/wso2is:$t; done
for t in `echo "$CENTOS_TAGS"`; do docker build --build-arg=IMAGE=wso2/wso2is:$t ./centos -t codebling/wso2is:$t && docker push codebling/wso2is:$t; done
