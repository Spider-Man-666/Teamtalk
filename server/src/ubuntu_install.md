#ubuntu16.04 编译

依次运行下列脚本

~~~~
ubuntu_make_log4cxx.sh

#编译调用redis API的依赖库
make_hiredis.sh

#如果装了mysql可以不运行（运行脚本会提示设置mysql的密码）
ubuntu_install_mysql.sh

make_protobuf.sh

~~~~

修改点编译配置

编辑server/src/db_proxy_server/CMakeLists.txt
最后一行替换 mysqlclient_r 为 mysqlclient


运行build_ubuntu.sh

~~~~
./build_ubuntu.sh version test
~~~~






