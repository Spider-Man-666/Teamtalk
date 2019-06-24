cmake_minimum_required(VERSION 2.6)
PROJECT(pushserver)

AUX_SOURCE_DIRECTORY(./ SRC_LIST1)
AUX_SOURCE_DIRECTORY(./socket SRC_LIST2)
AUX_SOURCE_DIRECTORY(../base/pb/protocol SRC_LIST3)


#SET(LIBRARY_OUTPUT_PATH ./)
SET(EXECUTABLE_OUTPUT_PATH  ./)

SET(PB_INCLUDE_DIR ../protobuf/include)
SET(PB_LIB_DIR ../protobuf/lib)

SET(SLOG_LIB_DIR ../slog)

#设置自己mac os的openssl的路径
if(APPLE)
    SET(OPENSSL_INCLUDE_DIR /usr/local/Cellar/openssl/1.0.2n/include)
    SET(OPENSSL_LIB_DIR /usr/local/Cellar/openssl/1.0.2n/lib)
endif()

ADD_DEFINITIONS( -g -W -Wall -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DAC_HAS_INFO
-DAC_HAS_WARNING -DAC_HAS_ERROR -DAC_HAS_CRITICAL -DTIXML_USE_STL
-DAC_HAS_DEBUG -DLINUX_DAEMON -std=c++11)

INCLUDE_DIRECTORIES(./ ../base/pb/protocol ${PB_INCLUDE_DIR} ../base/slog ${OPENSSL_INCLUDE_DIR})
LINK_DIRECTORIES(./ ${PB_LIB_DIR} ${SLOG_LIB_DIR} ${OPENSSL_LIB_DIR})

#ADD_XXXX必须在TARGET_LINK_LIBRARIES前面，否则会报错
#ADD_LIBRARY(${PROJECTNAME} SHARED/STATIC ${SRC_LIST})
ADD_EXECUTABLE(push_server ${SRC_LIST1} ${SRC_LIST2} ${SRC_LIST3})
# MOD_S by Spider-Man@2019/6/24 将protobuf2 升级为protobuf3,因为protobuf3的文件编译，不在支持lite模式，所以这里要修改链接库
#TARGET_LINK_LIBRARIES(push_server pthread protobuf-lite ssl slog)
TARGET_LINK_LIBRARIES(push_server pthread protobuf ssl slog)
# MOD_E by Spider-Man@2019/6/24
