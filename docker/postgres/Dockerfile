FROM postgres:15.1
LABEL maintainer="Merlin Unterfinger <info@munterfinger.ch>"

ENV DB_FILE="docker-entrypoint-initdb.d/demo-small-en.zip"
ADD https://edu.postgrespro.com/demo-small-en.zip $DB_FILE

RUN apt-get update && apt-get install -y \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && chown postgres:postgres $DB_FILE

COPY . /
EXPOSE 5432
