# TeamTalk
	TeamTalk is a solution for enterprise IM
	
	具体文档见doc目录下,安装之前请仔细阅读相关文档。

# 改进

~~~~
1.修复android 加载历史消息的bug
2.为了兼容web端播放音频 android／ios改用ogg+opus的格式编码
3.修复php部分bug
4.修复ios部分bug
5.添加ssl的服务端支持
6.升级protobuf到3.5.1
7.ios使用google 官方的objc pb方便统一pb文件的生成
8.也换了android的pb类 以及protobuf的版本 删了一些不用的依赖库
9.android添加离线文件的上传跟下载功能
10.docker 部署编译的支持
~~~~

~~~~
2018-11-23:
  msg_server 添加线程池处理任务


2019-01-22:
  加上支持监听和连接unix socket的功能 使用后应该会有助于本地连接的稳定性
~~~~

2019-06-24:
修改增加restart.sh all 选项
增加一键重启所有服务脚本 reboot_teamtalk.sh

将protobuf2 升级为protobuf3,因为protobuf3的文件编译，不在支持lite模式，所以这里要修改链接库

增加C#代码生成

修改替换proto2不支持的方法
增加拷贝重启所有服务脚本

升级替换所有平台的proto文件2版本为3版本



# 测试的msg_server

[http://im.xiaominfc.com:8080/msg_server](http://im.xiaominfc.com:8080/msg_server)

## 测试账号 密码
~~~~
xiaoyang 123456
test  123456
~~~~

# 在线demo

[http://chat.xiaominfc.com/im/](http://chat.xiaominfc.com/im/)


# 估值一个亿的ai代码测试:
![ai代码测试](https://raw.githubusercontent.com/xiaominfc/TeamTalk/master/android_test_ai.png)



