#!/bin/bash
set -e

DHUSER=bharathp8055
VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: ./release.sh v3"
  exit 1
fi

IMAGE=$DHUSER/hello-app:$VERSION

docker build -t $IMAGE .
docker push $IMAGE
kubectl set image deployment/hello-app "*=$IMAGE"
kubectl rollout status deployment/hello-app --timeout=60s
echo "Released $IMAGE"
