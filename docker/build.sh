#!/bin/bash


im_server=im_server

srcpaths=(slog base login_server db_proxy_server push_server route_server file_server msg_server msfs http_msg_server)
base_path=$(pwd)
base_src_path=$base_path/../server/src

out_path=$base_path/$im_server

rm -rf $base_src_path/base/pb/protocol/*

if [ ! -f ../server/src/protobuf/bin/protoc  ];then

cd ../server/src/
./make_protobuf.sh
./make_hiredis.sh
./make_log4cxx.sh
cd ../../docker/

fi


../server/src/protobuf/bin/protoc -I=$base_path/../pb --cpp_out=$base_src_path/base/pb/protocol/ $base_path/../pb/*.proto

cd $base_src_path

find . -name "CMakeCache.txt" -exec rm -rf {} \;


for sub_src_path in ${srcpaths[@]}
do
    cd $sub_src_path
    make clean
    cmake .
    make
    cd ..
done

mkdir -p $out_path/lib
cp $base_src_path/slog/libslog.* $out_path/lib/

delete=(slog base)

for del in ${delete[@]}
do
   srcpaths=("${srcpaths[@]/$del}")
done

for server in ${srcpaths[@]}
do
    mkdir -p $build_path/$server
    cp -f $base_src_path/$server/$server $out_path/$server/$server
    cp -f $base_src_path/$server/*.conf $out_path/$server/
    cp -f $base_src_path/slog/log4cxx.properties $out_path/$server/
done

