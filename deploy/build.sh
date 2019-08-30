
cp ../rel-arm64-v8a/armnn-arm64-v8a.tar.gz .
cp ../rel-arm64-v8a/mnist_tf_convol .
cp -r ../rel-arm64-v8a/data .
cp -r ../rel-arm64-v8a/model .

docker buildx build --platform linux/arm64 --push -t jasonrandrews/armnn-deploy-v8 -f Dockerfile.v8 .

cp ../rel-armv7a/armnn-armv7a.tar.gz .
cp ../rel-armv7a/mnist_tf_convol .

docker buildx build --platform linux/arm/v7 --push -t jasonrandrews/armnn-deploy-v7 -f Dockerfile.v7 .

