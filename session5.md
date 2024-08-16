## 組合技

```
$ docker run --rm -it redis:5 redis-cli
$ docker run --rm -it redis:6 redis-cli

$ docker run -d -p 3306:3306 mysql
$ docker run -d -p 3306:3306 mariadb
$ docker run -d -p 3306:3306 percona
```

```
alias php="docker run -it --rm -v \$PWD:/source -w /source php:8.3-cli php"
alias composer="docker run -it --rm -v \$PWD:/source -w /source composer:2.7"
alias npm="docker run -it --rm -v \$PWD:/source -w /source node:22-alpine npm"
alias gradle="docker run -it --rm -v \$PWD:/source -w /source gradle:8.10-alpine gradle"
```