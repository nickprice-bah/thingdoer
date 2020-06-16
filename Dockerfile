FROM python:3.7-alpine

ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"

RUN apk add --no-cache python3 \
    && python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools \
    && rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

COPY docker-entrypoint.sh /opt/
COPY function /opt/thingdoer
RUN cd /opt/thingdoer \
    && pip install -r ./requirements.txt

RUN chmod +x opt/docker-entrypoint.sh
ENTRYPOINT ["opt/docker-entrypoint.sh"]
