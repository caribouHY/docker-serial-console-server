FROM alpine:3.18

ENV USER="user"
ENV PASSWORD="password"
ENV SPEED="9600"
ENV TTY_DEVICE_PATH="/dev/ttyUSB"

RUN apk add --no-cache openssh-server

COPY ./login_text.txt /etc/motd
COPY ./entrypoint.sh /entrypoint.sh
COPY ./console.sh /usr/local/bin/console.sh
COPY ./sshd_config /etc/ssh/sshd_config

RUN chmod u+x /entrypoint.sh && \
    echo /bin/busybox microcom -s $SPEED $TTY_DEVICE_PATH >> /usr/local/bin/console.sh && \
    chmod a+x /usr/local/bin/console.sh && \
    echo "/usr/local/bin/console.sh" >> /etc/shells

EXPOSE 22/tcp
ENTRYPOINT [ "/entrypoint.sh" ]