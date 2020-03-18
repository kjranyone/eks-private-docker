#!/bin/sh

set -e
export AWS_ACCESS_KEY_ID="$INPUT_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$INPUT_AWS_SECRET_ACCESS_KEY"

aws eks --region "$INPUT_AWS_REGION" update-kubeconfig --name "$INPUT_CLUSTER_NAME"
kubectl create secret docker-registry "$INPUT_SECRET_NAME" \
  --docker-server="$INPUT_DOCKER_SERVER" \
  --docker-username="$INPUT_DOCKER_USERNAME" \
  --docker-password="$INPUT_DOCKER_PASSWORD" \
  --docker-email="$INPUT_DOCKER_EMAIL"

kubectl "$@"
