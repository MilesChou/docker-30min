## 保存狀態

### 在 Container 裡編輯檔案

```
$ docker run -d --name my-web -p 8080:80 nginx:alpine
$ docker exec -it my-web bash
# echo "hello world" > /usr/share/nginx/html/my-web.html
$ docker rm -f my-web
$ docker run -d --name my-web -p 8080:80 nginx:alpine
```

### Volume mapping

```
$ echo "hello world" > ./my-web.html
$ docker run --rm -it -p 8080:80 -v `pwd`/my-web.html:/usr/share/nginx/html/my-web.html nginx:alpine
```

### 環境變數

```
$ docker run --rm -it -e NODE_ENV=testing node:alpine
> process.env.NODE_ENV
```