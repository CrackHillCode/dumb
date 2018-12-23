COPY libfaketime /libfaketime 
RUN apk add --update alpine-sdk
RUN cd /libfaketime; make; make install; rm -Rf /libfaketime
RUN apk del alpine-sdk

version: '3'
services:
  test:
    container_name: test
    image: test
    volumes:
      - ./maange.py:/srv/intercept/manage.py
      - ./Test.class:/srv/intercept/Test.class
      - ./faketime:/root/.faketimerc
    environment:
      - LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1
      - FAKETIME_NO_CACHE=1
      - DONT_FAKE_MONOTONIC=0
      - "FAKETIME_TIMESTAMP_FILE=/root/.faketimerc"