FROM python:3.8.2-alpine3.11

LABEL maintainer="Kojiro Tanaka <kojirotanaka@musette.xyz>"

ENV PYTHONIOENCODING=UTF-8

RUN apk add --no-cache curl
RUN pip install awscli
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
