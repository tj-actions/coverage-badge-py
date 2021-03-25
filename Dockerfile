FROM python:3.9.2-alpine3.13

LABEL maintainer="Tonye Jack <jtonye@ymail.com>"

RUN apk add bash

RUN pip install -U coverage coverage-badge

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
