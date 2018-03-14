ARG BUILD_FROM

FROM $BUILD_FROM as git

ENV UPSTREAM_VERSION='v0.0.1-py3'

RUN apk add --no-cache git

RUN mkdir /opt/noolite -p && \
    git clone -b ${UPSTREAM_VERSION} https://github.com/foxel/noolite-mqtt-python.git /opt/noolite && \
    rm -rf /opt/noolite/.git

FROM $BUILD_FROM

ENV LANG=C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache python3 jq

# Copy data for add-on
COPY --from=git /opt/noolite/ /opt/noolite/

RUN pip3 install -r /opt/noolite/requirements.txt

COPY run.sh /

RUN chmod +x /run.sh

CMD [ "/run.sh" ]
