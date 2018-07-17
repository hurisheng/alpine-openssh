FROM alpine:latest

LABEL author="hurisheng"

RUN apk add --no-cache bash openssh-server rsync tzdata \
  && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone \
  && apk --no-cache del tzdata

# persistent sshd config and root authorized key
VOLUME [ "/etc/ssh", "/root/.ssh" ]

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" , "-h", "/etc/ssh/ssh_host_rsa_key" ]