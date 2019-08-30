docker run -t -d --rm jasonrandrews/armnn-develop-v7 /bin/bash
ID=$(docker ps -lqa)
docker cp $ID:/home/ubuntu/mnist-demo/mnist_tf_convol ../rel-armv7a
docker cp $ID:/home/ubuntu/mnist-demo/data ../rel-armv7a
docker cp $ID:/home/ubuntu/mnist-demo/model ../rel-armv7a

docker run -t -d --rm jasonrandrews/armnn-develop-v8 /bin/bash
ID=$(docker ps -lqa)
docker cp $ID:/home/ubuntu/mnist-demo/mnist_tf_convol ../rel-rel-arm64-v8a
docker cp $ID:/home/ubuntu/mnist-demo/data ../rel-arm64-v8a
docker cp $ID:/home/ubuntu/mnist-demo/model ../rel-arm64-v8a
