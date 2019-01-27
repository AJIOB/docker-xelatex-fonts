$IMAGE="tex:1"
$NAME="ctex"
$HOST_FOLDER="$(Get-Location)/work"
$CONTAINER_FOLDER="/test-folder"

docker stop $NAME
docker rm $NAME

docker build -t $IMAGE .
docker run -d --name $NAME -v "$HOST_FOLDER\:$CONTAINER_FOLDER" -w $CONTAINER_FOLDER $IMAGE sleep 10000
