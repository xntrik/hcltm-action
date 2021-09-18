FROM xntrik/hcltm:latest
RUN apk update
RUN apk add --update bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
