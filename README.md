## 数据库： mysql-8.0.16-winx64
## 账户：root
## 密码：111
## 数据库管理工具： Navicat 12.1.25

## mysql 初始化步骤，在安装目录的 bin 中打开管理员命令行

```bash
mysqld --initialize --console

mysqld -install

net start MySQL

mysql -u root -p

ALTER user 'root'@'localhost' IDENTIFIED BY '111';

flush privileges;

quit
```

mvn jetty:run


export M2_HOME=/Users/zx/Documents/work/apache-maven-3.6.2
export PATH=$PATH:$M2_HOME/bin

mysql.server start

评论
