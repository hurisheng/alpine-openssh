FROM alpine:latest

LABEL author="hurisheng"

RUN apk add --no-cache openssh-server rsync

# sshd config directory, host keys directory and root public keys directory
VOLUME [ "/etc/ssh/sshd_config.d", "/root/.ssh" ]

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]
