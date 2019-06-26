# TeamTalk

参考了这些开源项目：
> xiaominfc TeamTalk(主要参考)：[https://github.com/xiaominfc/TeamTalk](TeamTalk)  
> websocket_client：[https://github.com/xiaominfc/teamtalk_websocket_client](websocket_client)  
> websocket_server：[https://github.com/xiaominfc/teamtalk_websocket_server](websocket_server：)  
> Liuthx/TeamTalk（提取了编译、运行脚本，增加websocket_server）：[https://github.com/Liuthx/TeamTalk](TeamTalk)  

## 环境准备

1.安装使用centos 7 1611版本及以上

## 搭建IM

### 安装基础环境

1.安装EPEL源

```bash
> yum install -y epel-release
```

2.安装git（版本控制工具）、wget（http下载）、gcc/gcc-c++（c++编译器） 、unzip（zip包解压）

```bash
> yum install -y git wget gcc gcc-c++ unzip
```

### 安装数据库

1.安装数据库：mariadb

```basj
> yum install -y mariadb-devel mariadb-server
```

2.安装redis

```bash
> yum install -y redis
> 或者
> cd /etc/yum.repos.d/ && wget http://mirrors.aliyun.com/repo/epel-6.repo && sudo yum install -y redis && sudo service redis start
```

### 编译安装其他依赖项

#### 获取项目


```bash
> git clone git@github.com:xmcy0011/TeamTalk.git
```

#### 安装依赖项

``` bash
cd /home/TeamTalk/server/src/ && chmod 777 *.sh  # 赋予脚本执行权限  
./make_hiredis.sh             # 编译redis  
./make_protobuf.sh            # 编译protobuf  
./make_log4cxx.sh             # 编译日志组件  
./make_mariadb.sh             # 安装mariadb和头文件（其实上面yum已安装了，但是还有遗漏）
```

#### 编译IM

```bash
> ./build.sh version 0.6.0      # 编译im，version 后面是版本号
```

### 运行

#### 配置并导入数据库

```bash
> cd /home/TeamTalk/auto_setup/mariadb/ && chmod +x *.sh && ./setup.sh install 

#在这里会提示修改 MariaDB 的 root 密码。这里设置为 12345，确保和 dbproxyserver.conf 和 /home/TeamTalk/auto_setup/mariadb/setup.sh 文件里的保持一致。剩下的 MariaDB 的设置可以都按照默认的来（一路回车）。
```

#### 防火墙设置

以下操作二选其一（如果不熟悉，请关闭防火墙）：
1.关闭防火墙

```bash
> systemctl disable firewalld.service # 防火墙默认开机不启动  
> systemctl stop firewalld.service    # 防火墙关闭
```

2.开放防火墙端口

| 名称 | 类型 | 端口 |
| ---- | ---- | ---- |
| login_server | http | 8080 |
| msg_server | tcp | 8000  |
| msfs_server | http | 8700 |
| file_server | tcp | 8600 |
| push_server | tcp | 8500 |

#### 开机启动mariadb和redis

```bash
> systemctl enable redis      # 开机启动redis  
> systemctl start redis  
> systemctl enable mariadb    # 开机启动mariadb  
> systemctl start mariadb
```

#### 手动添加2个测试账号----可选，后面可以使用web界面配置账户

ps：密码是123456

``` sql
mysql -u root -p12345  
show databases;  
use teamtalk;  
INSERT INTO IMDepart (`id`, `departName`, `priority`, `parentId`, `status`, `created`, `updated`) VALUES ('1', '测试', '0', '0', '0', '1546410063', '1546410063');  
INSERT INTO `teamtalk`.`IMUser` (`id`, `sex`, `name`, `domain`, `nick`, `password`, `salt`, `phone`, `email`, `avatar`, `departId`, `status`, `created`, `updated`, `push_shield_status`, `sign_info`) VALUES ('7', '0', 'gaozz', '0', '高真真', 'abe84781319bd8222792f124245429f8', '1952', '', '', 'http://127.0.0.1:8700/', '1', '0', '1548215851', '1548215942', '0', '');  
INSERT INTO `teamtalk`.`IMUser` (`id`, `sex`, `name`, `domain`, `nick`, `password`, `salt`, `phone`, `email`, `avatar`, `departId`, `status`, `created`, `updated`, `push_shield_status`, `sign_info`) VALUES ('8', '0', 'hanmm', '0', '韩梅梅', 'd4e546771dd30d75076b928326947df1', '4650', '', '', 'http://127.0.0.1:8700/', '1', '0', '1548215935', '1548215948', '0', '');
```

#### 配置并运行IM

1.确保数据库配置正确

``` bash
> cd /home/repo/TeamTalk/server/src
> cd db_proxy_server
> vim dbproxyserver.conf
> 修改：teamtalk_master_username=root
> 修改：teamtalk_slave_username=root
```

2.配置服务器IP

```bash
> cd ../msg_server/
> vim msgserver.conf
> 修改：IpAdr1 为 运行机器的 IP 地址
> 修改：IpAdr2 为 运行机器的 IP 地址
```

3.配置2个数据库实例

```html
> vim msgserver.conf
> #DBServerIP2 改为：DBServerIP2
> #DBServerPort2 改为：DBServerPort2
> ConcurrentDBConnCnt=1 改为：ConcurrentDBConnCnt=2
```

5.同步拷贝库

```bash
> chmod 777 sync_lib_for_zip.sh  
> sync_lib_for_zip.sh
```

6.重新build下

```bash
> ./build.sh version 0.6.0
```

7.解压运行

```bash
> cd /home/repo/TeamTalk/server  
> tar -zxvf im-server-0.6.0.tar.gz  
> 修改login_server/loginserver.conf   msfs=http://127.0.0.1:8700/ discovery=http://127.0.0.1/api/discovery  为 msfs=http://本机IP:8700/ discovery=http://本机IP/api/discovery
> 修改auto_setup/im_web/conf/config.php 中的 $config['msfs_url'] = 'http://127.0.0.1:8700/'; 为 $config['msfs_url'] = 'http://本机IP:8700/'; 不修改头像会不能上传下载

> sync_lib_for_zip.sh  
> restart.sh all
```

8.如果成功，则显示：

```bash
> ps -ef|grep _server

root     11163     1  0 12:11 ?        00:00:01 ./db_proxy_server  
root     11171     1  0 12:11 ?        00:00:00 ./login_server  
root     11179     1  0 12:11 ?        00:00:00 ./route_server  
root     11182     1  0 12:11 ?        00:00:00 ./msg_server  
root     11193     1  0 12:11 ?        00:00:00 ./file_server  
root     11204     1  0 12:11 ?        00:00:00 ./push_server  
```

否则：查看log，排查错误

```bash
> cat msg_server/log/default.log  
> 或者  
> tail msg_server/log/default.log   # 实时查看
```

## 搭建WEB

1.安装nginx和php

``` bash
> cd /home/svn/TeamTalk/auto_setup
> chmod 777 nginx_php/nginx/setup.sh && chmod 777 nginx_php/php/setup.sh # 脚本执行权限
> ./nginx_php/nginx/setup.sh install    # 安装nginx
> ./nginx_php/php/setup.sh install      # 安装php5.6.6
```

2.部署发布web

```bash
> yum install -y zip                                        # 安装压缩软件
> cd /home/svn/TeamTalk && cp -rf php/ tt && zip -r tt.zip tt # 打tt.zip的web源码包
> mv tt.zip auto_setup/im_web/                              # 放入im_web下，以便脚本能解压安装
> cd auto_setup/im_web/
> ./setup.sh install                                        # 发布web包到 nginx /var/www/html/目录下
> cd /etc/nginx/conf.d/                                     # 进入nginx配置文件目录
> vim im.com.conf 把80改为如8099                             # 更改web访问端口
```

3.临时关闭selinux[https://blog.csdn.net/lzm198707/article/details/50130615](永久关闭selinux参考)

```bash
> getenforce  
> setenforce 0      ##设置SELinux 成为permissive模式
```

4.启动nginx

```bash
> systemctl start nginx  
> systemctl status nginx    # 查看nginx启动状态
```

5.启动php-fmp [https://www.cnblogs.com/hnhycnlc888/p/9434309.html](参考)

```bash
> /usr/local/php5/sbin/php-fpm
```

6.打开浏览器，输入：192.168.100.185:8099即可，默认用户admin\admin
