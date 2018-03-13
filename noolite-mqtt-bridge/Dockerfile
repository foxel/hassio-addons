ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG=C.UTF-8 \
    UPSTREAM_VERSION='v0.0.1-py3'

# Install requirements for add-on
RUN apk add --no-cache python3 jq

# Copy data for add-on
RUN mkdir /opt/noolite -p && \
    wget -qO- https://github.com/foxel/noolite-mqtt-python/archive/${UPSTREAM_VERSION}.tar.gz | \
        tar -xzC /opt/noolite/ --strip-components 1 && \
    pip3 install -r /opt/noolite/requirements.txt

COPY run.sh /

RUN chmod +x /run.sh

CMD [ "/run.sh" ]
