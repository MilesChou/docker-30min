## Dockercraft

https://github.com/docker/dockercraft

```
# 需要使用 Linux VM 才能啟動
$ sudo docker run --rm --privileged -t -i -p 25565:25565 -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/.docker/settings.ini:/srv/Server/settings.ini --name dockercraft docker/dockercraft
```

> F3 + P 就不會跳自動選單了

### Docker Run

```
$ docker run php:8.3-alpine
$ docker run -it php:8.3-alpine
$ docker run -it --rm php:8.3-alpine
$ docker run -it --rm php:8.3-alpine php -v
```

### Understand Docker Run

```
$ docker images
$ docker pull busybox
$ docker create -it --name mycontainer busybox
$ docker start -i mycontainer
$ docker ls -a
```
