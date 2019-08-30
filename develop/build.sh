cp ../rel-arm64-v8a/armnn-arm64-v8a.tar.gz .
cp ../rel-armv7a/armnn-armv7a.tar.gz .

docker buildx build --platform linux/arm64 --push -t jasonrandrews/armnn-develop-v8 -f Dockerfile.v8 .
docker buildx build --platform linux/arm/v7 --push -t jasonrandrews/armnn-develop-v7 -f Dockerfile.v7 .

