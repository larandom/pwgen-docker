FROM alpine:latest

ENV HOME /home/user

RUN set -eux; \
	adduser -u 1000 -D -h "$HOME" user; \
	chown -R user:user "$HOME"; \
	apk --no-cache -U upgrade; \
	apk add --no-cache \
		pwgen

WORKDIR $HOME

USER user
ENTRYPOINT ["pwgen"]
