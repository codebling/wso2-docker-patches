FROM wso2/wso2is:latest

RUN \
    apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        zip \
    && rm -rf /var/lib/apt/lists/* \
    && VULNERABLE_JARS=$(for jar in `find . -iname '*.jar'`; do unzip -l $jar | grep -v -E '^Archive' | grep org/apache/logging/log4j/core/lookup/JndiLookup.class >/dev/null 2>&1 && echo $jar; done) \
    && for jar in $VULNERABLE_JARS; do zip -q -d $jar org/apache/logging/log4j/core/lookup/JndiLookup.class; done

