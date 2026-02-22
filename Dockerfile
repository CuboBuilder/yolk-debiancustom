FROM debian:bookworm-slim

RUN apt update && apt install -y \
    sudo curl ca-certificates iproute2 python3 python3-pip git \
    && useradd -m -d /home/container -u 999 -s /bin/bash container \
    && echo "container ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
