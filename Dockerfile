FROM python:3.7-alpine

WORKDIR /usr/src/app

RUN apk update && apk upgrade \
    && apk add ffmpeg

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

VOLUME /dest /config

WORKDIR /dest

CMD [ "youtube-dl", "--config-location", "/config/youtube-dl.conf", "--batch-file", "/config/batch.txt" ]
