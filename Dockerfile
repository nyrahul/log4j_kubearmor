FROM openjdk:16-alpine3.13

WORKDIR /log4j

RUN apk add --update make
RUN apk add --update bash

COPY . .

RUN cd /log4j && make
EXPOSE 1337

ENTRYPOINT ["/log4j/start_log4j.sh"]

