cmake_minimum_required(VERSION 2.6)
PROJECT(db_proxy_server)

AUX_SOURCE_DIRECTORY(./ SRC_LIST)
AUX_SOURCE_DIRECTORY(./business SRC_LIST)

#SET(LIBRARY_OUTPUT_PATH ./)
SET(EXECUTABLE_OUTPUT_PATH  ./)

SET(MYSQL_LIB /usr/lib64/mysql)
SET(UBUNTU_MYSQL_LIB /usr/lib/x86_64-linux-gnu)
SET(MYSQL_LIB_NAME mysqlclient_r)


SET(PB_INCLUDE_DIR ../protobuf/include)
SET(PB_LIB_DIR ../protobuf/lib)

SET(SLOG_LIB_DIR ../slog)

SET(HIREDIS_INCLUDE_DIR ../hiredis/hiredis-master)
#SET(HIREDIS_LIB_DIR ../hiredis/hiredis-master)


#设置自己mac os的openssl的路径
if(APPLE)
    SET(OPENSSL_INCLUDE_DIR /usr/local/Cellar/openssl/1.0.2n/include)
    SET(OPENSSL_LIB_DIR /usr/local/Cellar/openssl/1.0.2n/lib)
endif()

if(APPLE)
    SET(MYSQL_INCLUDE_DIR /usr/local/mysql/include)
    SET(MYSQL_LIB /usr/lib64/mysql /usr/local/mysql/lib)
    SET(MYSQL_LIB_NAME mysqlclient)
else()
    SET(MYSQL_INCLUDE_DIR /usr/include/mysql)
endif()
    

ADD_DEFINITIONS( -g -W -Wall -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DAC_HAS_INFO
-DAC_HAS_WARNING -DAC_HAS_ERROR -DAC_HAS_CRITICAL -DTIXML_USE_STL
-DAC_HAS_DEBUG -DLINUX_DAEMON -std=c++11 -DENCRYPT)

INCLUDE_DIRECTORIES(./ ./businiess ../base ../base/jsoncpp ../base/pb/protocol ${PB_INCLUDE_DIR} ${MYSQL_INCLUDE_DIR}  ${OPENSSL_INCLUDE_DIR} ${HIREDIS_INCLUDE_DIR})
LINK_DIRECTORIES(./ ../base ${PB_LIB_DIR} ${MYSQL_LIB} ${UBUNTU_MYSQL_LIB} ../base/slog/lib ${OPENSSL_LIB_DIR} ${SLOG_LIB_DIR})

#ADD_XXXX必须在TARGET_LINK_LIBRARIES前面，否则会报错
#ADD_LIBRARY(${PROJECTNAME} SHARED/STATIC ${SRC_LIST})
ADD_EXECUTABLE(db_proxy_server ${SRC_LIST})

TARGET_LINK_LIBRARIES(db_proxy_server pthread base protobuf-lite ${MYSQL_LIB_NAME} hiredis curl slog ssl crypto)
 
