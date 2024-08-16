## 與 Container 互動

### Port forwarding

```
$ docker run -d nginx:alpine
$ docker run -d nginx:alpine
$ docker run -d nginx:alpine
$ docker run -d nginx:alpine
$ docker run -d nginx:alpine
```

```
$ docker run -d --name my-web -p 8080:80 nginx:alpine
$ docker run -d -p 8080:80 nginx:alpine
$ docker container stop my-web
$ docker container rm my-web
```