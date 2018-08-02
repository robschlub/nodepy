PROJECT_PATH=`pwd`
PROJECT_NAME=dev

if [ $1 ];
then
  PROJECT_NAME=$1
fi

cp $PROJECT_NAME/Dockerfile Dockerfile

docker build -t $DOCKER_HUB_USERNAME/$PROJECT_NAME .

rm Dockerfile

if [ $PROJECT_NAME = 'base' ];
then
  docker run -it --rm --name nodepy-base $DOCKER_HUB_USERNAME/nodepy
fi
if [ $PROJECT_NAME = 'dev' ];
then
  docker run -it --rm \
    -v $PROJECT_PATH/dev/package.json:/opt/app/package.json \
    -v $PROJECT_PATH/dev/package-lock.json:/opt/app/package-lock.json \
    --name nodepy-base \
    $DOCKER_HUB_USERNAME/nodepy:dev
fi
