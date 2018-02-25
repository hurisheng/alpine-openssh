FROM alpine:3.7

LABEL author="hurisheng"

RUN apk add --no-cache bash openssh-server

# persistent sshd config and root authorized key
VOLUME [ "/etc/ssh", "/root/.ssh" ]

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]