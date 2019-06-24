cmake_minimum_required(VERSION 2.6)
PROJECT(http_msg_server)

AUX_SOURCE_DIRECTORY(./ SRC_LIST)

#SET(LIBRARY_OUTPUT_PATH ./)
SET(EXECUTABLE_OUTPUT_PATH  ./)

SET(PB_INCLUDE_DIR ../protobuf/include)
SET(PB_LIB_DIR ../protobuf/lib)

SET(SLOG_LIB_DIR ../slog)

if(APPLE)
    SET(OPENSSL_INCLUDE_DIR /usr/local/Cellar/openssl/1.0.2n/include)
    SET(OPENSSL_LIB_DIR /usr/local/Cellar/openssl/1.0.2n/lib)
endif()


ADD_DEFINITIONS( -g -W -Wall -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DAC_HAS_INFO
-DAC_HAS_WARNING -DAC_HAS_ERROR -DAC_HAS_CRITICAL -DTIXML_USE_STL
-DAC_HAS_DEBUG -DLINUX_DAEMON -std=c++11)

INCLUDE_DIRECTORIES(./  ../base ../base/jsoncpp ../base/pb/protocol ${PB_INCLUDE_DIR} ${OPENSSL_INCLUDE_DIR})
LINK_DIRECTORIES(./ ../base ${PB_LIB_DIR} ${SLOG_LIB_DIR} ${OPENSSL_LIB_DIR})

#ADD_XXXX必须在TARGET_LINK_LIBRARIES前面，否则会报错
#ADD_LIBRARY(${PROJECTNAME} SHARED/STATIC ${SRC_LIST})
ADD_EXECUTABLE(http_msg_server ${SRC_LIST})

TARGET_LINK_LIBRARIES(http_msg_server base protobuf-lite slog  pthread ssl crypto) 
 
