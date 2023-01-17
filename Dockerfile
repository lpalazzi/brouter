# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

COPY . .
RUN bash ./scripts/update_segments.sh
RUN bash ./scripts/build.sh

CMD bash ./scripts/run.sh
