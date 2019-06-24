#构建IM的docker环境



## 编译环境

### 1.clone源码 建议使用我维护的Teamtalk分支

~~~
git clone https://github.com/xiaominfc/TeamTalk.git

~~~

如果用官方分支则(TeamtalkProjectPath换成你tt的路径)

~~~
git clone https://github.com/xiaominfc/TeamTalk.git xiaominfcTeamtalk

cp -r ./xiaominfcTeamtalk/docker {TeamtalkProjectPath}
~~~

### 2.构建环境(先在系统中装好docker)


~~~
cd {TeamTalkProjectPath}/docker
#TeamTalkProjectPath你要编译TeamTalkProject的路径(可以是我维护的那个 也可以官方的那个)


./docker_build.sh {image_name}
#image_name 你要生成的docker镜像的名字，你可以传也可以不传，不传就是默认的

#可以看一下docker_build.sh 执行完后就会进入container中了

~~~

### 3.编译源码(熟悉的环节)

~~~
cd /opt/tt_source_code #默认我挂在的路径 在docker_build.sh写了

cd server/src

./make_log4cxx.sh
./make_protobuf.sh
./make_hiredis.sh

./build.sh veriosn {version_name}

# 这样就编译完了
~~~

ps: 兼容mac linux下的docker。win的没测试过


## 运行环境

### 1.配置mariadb的 密码(初始没有密码的)

~~~
mysqladmin -u root password {your_password} #or run mysql_secure_installation

~~~

后面的就不用我说了

ps:

~~~
1.如果要部署web端 建议用别的镜像实现
2.需要访问的话 要配置好docker的端口
3.运行时最好默认挂载一个本地路径给容器的mysql跟redis存持久化的数据,以免数据丢失
4.减少运行时所需的依赖优化镜像
~~~
