ARG BUILD_FROM

FROM $BUILD_FROM

ENV LANG=C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache python3 py3-pip jq

RUN pip3 install noolite-mqtt==0.1.3

COPY run.sh /

RUN chmod +x /run.sh

CMD [ "/run.sh" ]
