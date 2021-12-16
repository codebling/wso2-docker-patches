ARG IMAGE=wso2/wso2is:5.11.0

FROM $IMAGE

USER root

RUN \
    yum install -y \
        zip \
    && rm -rf /var/cache/yum/*

ARG USER_ID=802
USER ${USER_ID}

# Search for jars which may be vulnerable to CVE-2021-44228 or CVE-2021-45046
# and patch them by removing JndiLookup.class
RUN \    
    VULNERABLE_JARS=$(for jar in `find $(pwd) -iname '*.jar'`; do unzip -l $jar | grep -v -E '^Archive' | grep org/apache/logging/log4j/core/lookup/JndiLookup.class >/dev/null 2>&1 && echo $jar; done || true) \
    && for jar in $VULNERABLE_JARS; do echo "Patching vulnerable jar $jar"; zip -q -d $jar org/apache/logging/log4j/core/lookup/JndiLookup.class; done
