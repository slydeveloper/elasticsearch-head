FROM node:13.8
LABEL maintainer="sylwek.sokolowski@gmail.com"

ARG BUILD_DATE
ARG BUILD_NAME
ARG BUILD_VERSION
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name=$BUILD_NAME
LABEL org.label-schema.description="Elasticsearch-Head Slydeveloper"
LABEL org.label-schema.url="https://github.com/slydeveloper/elasticsearch-head"
LABEL org.label-schema.vcs-url="https://github.com/slydeveloper/elasticsearch-head"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Sylwester Sokolowski"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -p 9100:9100 slydeveloper/elasticsearch-head"

COPY elasticsearch-head.zip /

RUN unzip elasticsearch-head.zip && \
    rm elasticsearch-head.zip

WORKDIR /elasticsearch-head-master

RUN npm install && \
    npm audit fix --force

EXPOSE 9100

ENTRYPOINT ["npm", "run", "start"]