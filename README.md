This is the Git source repo for unofficial [Docker images of WSO2IS with Lo4j CVE-2021-45046 and CVE-2021-44228 patched](https://github.com/codebling/wso2is).

# Docker images for WSO2IS with Lo4j [CVE-2021-45046](https://cve.mitre.org/cgi-bin/cvename.cgi?name=2021-45046) and [CVE-2021-44228](https://cve.mitre.org/cgi-bin/cvename.cgi?name=2021-44228) patched 

The CVEs were patched by deleting the file `org/apache/logging/log4j/core/lookup/JndiLookup.class` from affected jars, per the recommended mitigations listed on [the Log4j Security page](https://logging.apache.org/log4j/2.x/security.html).

# Quick reference

## How to use this image.

If you're already using WSO2IS images, simply substitute `codebling/wso2is` in place of `wso2/wso2is` and keep the same version tag. 

If you're not already using WSO2IS images, consult [the documentation for the WSO2IS images](https://hub.docker.com/r/wso2/wso2is)

## Supported tags and respective `Dockerfile` links
All images are based on (`FROM`) WSO2IS images and all tags match those ones. 
-	[`latest, 5.11.0, 5.10.0, 5.9.0, 5.8.0`](https://github.com/codebling/wso2-docker-patches/blob/6b605fe34421aaed65325ccfc3177abf1c2ef70b/ubuntu/Dockerfile)
-	[`5.9.0-centos7, 5.10.0-centos7`](https://github.com/codebling/wso2-docker-patches/blob/6b605fe34421aaed65325ccfc3177abf1c2ef70b/centos/Dockerfile)
-	[`5.9.0-alpine3.10, 5.10.0-alpine3.11, 5.8.0-alpine3.10`](https://github.com/codebling/wso2-docker-patches/blob/6b605fe34421aaed65325ccfc3177abf1c2ef70b/alpine/Dockerfile)


## What is WSO2? What is WSO2IS? 

See [the official WSO2 website](https://wso2.com/) for more info. 

