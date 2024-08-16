## Container 互連

```
$ docker network create my-net
$ docker run -d --name my-web --network my-net -p 8080:80 nginx:alpine
$ docker run --rm -it --network my-net busybox
# wget my-web -O -
```
