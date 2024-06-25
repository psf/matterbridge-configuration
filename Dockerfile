FROM 42wim/matterbridge:1.26

RUN apk add --no-cache bash gettext libintl

RUN mkdir /matterbridge
RUN chown nobody:nobody /matterbridge

COPY config/config-template.toml /matterbridge/config-template.toml
COPY start.sh /matterbridge/start.sh

USER nobody
ENTRYPOINT ["/matterbridge/start.sh"]
