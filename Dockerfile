### EGEOFFREY ###

### define base image
## the SDK version to bind to has to be passed by the builder so to select the right base image
ARG SDK_VERSION
ARG ARCHITECTURE
## Use the small python alpine image if you don't have OS dependencies
FROM egeoffrey/egeoffrey-sdk-alpine:${SDK_VERSION}-${ARCHITECTURE}

RUN apk update && apk add gcc musl-dev libffi-dev openssl-dev && rm -rf /var/cache/apk/*

### copy files into the image
COPY . $WORKDIR
RUN pip install pyicloud click==6.7
