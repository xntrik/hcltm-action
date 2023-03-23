FROM xntrik/hcltm:v0.1.6
RUN apk update
RUN apk add --update bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
