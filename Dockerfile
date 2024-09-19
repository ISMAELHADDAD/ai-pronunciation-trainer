FROM python:3.9-bullseye

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libsndfile1

COPY --from=mwader/static-ffmpeg:7.0.2 /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg:7.0.2 /ffprobe /usr/local/bin/

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 3000

CMD [ "python", "./webApp.py" ]
