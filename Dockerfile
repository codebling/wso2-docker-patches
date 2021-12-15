FROM wso2/wso2is:latest

USER root

RUN \
    apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        zip \
    && rm -rf /var/lib/apt/lists/*

ARG USER_ID=802
USER ${USER_ID}

RUN \    
    VULNERABLE_JARS=$(for jar in `find $(pwd) -iname '*.jar'`; do unzip -l $jar | grep -v -E '^Archive' | grep org/apache/logging/log4j/core/lookup/JndiLookup.class >/dev/null 2>&1 && echo $jar; done || true) \
    && for jar in $VULNERABLE_JARS; do echo "Patching vulnerable jar $jar"; zip -q -d $jar org/apache/logging/log4j/core/lookup/JndiLookup.class; done
