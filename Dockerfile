FROM python:3.12-slim

WORKDIR /app

COPY . /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends bash ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    python -m pip install --no-cache-dir -U pip && \
    python -m pip install --no-cache-dir uv && \
    ./script/bootstrap

CMD bash
