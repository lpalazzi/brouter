# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

COPY ./scripts ./scripts
COPY ./misc ./misc
RUN bash ./scripts/update_segments.sh; exit 0

COPY . .
RUN bash ./scripts/build.sh

CMD bash ./scripts/run.sh