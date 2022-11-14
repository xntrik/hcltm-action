FROM xntrik/hcltm:0.1.5
RUN apk update
RUN apk add --update bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
