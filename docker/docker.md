# build for dockerfile

~~~
docker build --rm -t {name} . -f {DockerfilePath}
~~~

# stop container

~~~
docker kill {container_id}
~~~

# show all running container

~~~
docker ps
~~~

# remove image

~~~
docker images | grep none | awk '/ / { print $3 }'
docker rmi {image_id}
~~~

# show all images
~~~
docker images
~~~

# cleanup (unused) resources

~~~
docker volume rm $(docker volume ls -qf dangling=true)
~~~


