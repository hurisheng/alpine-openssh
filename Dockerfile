FROM alpine:latest

LABEL author="hurisheng"

RUN apk add --no-cache openssh-server rsync

# sshd config directory, host keys directory and root public keys directory
VOLUME [ "/etc/ssh/host_keys", "/etc/ssh/sshd_config.d", "/root/.ssh" ]

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D", "-h", "/etc/ssh/host_keys/ssh_host_ed25519_key" ]
