#!/bin/bash

project_path=$(pwd)/../

echo $project_path

docker_image_name=xiaominfc/centos_tt_test

if [ -n "$1" ]; then
    docker_image_name=$1
fi

docker_file=./Dockerfile

docker kill $(docker ps -q)

image=$(docker images -q $docker_image_name 2> /dev/null)

if [ "$image" == ""  ];then
    docker build --rm -t $docker_image_name -f $docker_file . 
fi



docker run -d  --privileged=true -v "$project_path:/opt/tt_source_code"   $docker_image_name
docker exec -it $(docker ps -q) /bin/bash

