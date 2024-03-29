#!/bin/sh
export PATH=$PATH:../server/src/protobuf/bin


SRC_DIR=./
DST_DIR=./gen

#C++
mkdir -p $DST_DIR/cpp
protoc -I=$SRC_DIR --cpp_out=$DST_DIR/cpp/ $SRC_DIR/*.proto

#JAVA
mkdir -p $DST_DIR/java
protoc -I=$SRC_DIR --java_out=$DST_DIR/java/ $SRC_DIR/*.proto

#OBJC
mkdir -p $DST_DIR/objc
protoc -I=$SRC_DIR --objc_out=$DST_DIR/objc/ $SRC_DIR/*.proto

#PYTHON
mkdir -p $DST_DIR/python
protoc -I=$SRC_DIR --python_out=$DST_DIR/python/ $SRC_DIR/*.proto


# ADD_S by Spider-Man@2019/6/24 增加C#代码生成
#CSHARP
mkdir -p $DST_DIR/csharp
protoc -I=$SRC_DIR --python_out=$DST_DIR/csharp/ $SRC_DIR/*.proto
# ADD_E by Spider-Man@2019/6/24
