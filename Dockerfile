FROM openjdk:8u181-jdk-alpine3.8

COPY libfaketime /libfaketime 
RUN apk add --update alpine-sdk
RUN cd /libfaketime; make; make install; rm -Rf /libfaketime
RUN apk del alpine-sdk

WORKDIR /srv/test/

COPY Test.class /srv/test/Test.class

CMD java Test

# CMD sleep 5000s