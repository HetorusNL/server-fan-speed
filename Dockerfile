FROM ghcr.io/astral-sh/uv:debian-slim

WORKDIR /code

COPY . /code

RUN apt-get update \
    && apt-get install -y --no-install-recommends ipmitool \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /code/run-server-fan-speed.sh /code/prepare.sh

# ENV to be set when running the docker container
# ENV HOST_ADDRESS=0.0.0.0 \
#     HOST_PORT=8000 \
#     SERVER_IP_ADDRESS=127.0.0.1 \
#     SERVER_USERNAME=username \
#     SERVER_PASSWORD=password

CMD ["uv", "run", "main.py"]
