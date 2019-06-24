//
//  GetMsgByMsgIDsAPI.m
//  TeamTalk
//
//  Created by Michael Scofield on 2015-02-05.
//  Copyright (c) 2015 Michael Hu. All rights reserved.
//

#import "GetMsgByMsgIDsAPI.h"
#import "ImMessage.pbobjc.h"
@implementation GetMsgByMsgIDsAPI
- (int)requestTimeOutTimeInterval
{
    return TimeOutTimeInterval;
}

/**
 *  请求的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)requestServiceID
{
    return SID_MSG;
}

/**
 *  请求返回的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)responseServiceID
{
    return SID_MSG;
}

/**
 *  请求的commendID
 *
 *  @return 对应的commendID
 */
- (int)requestCommendID
{
    return IM_GET_MSG_BY_ID_REQ;
}

/**
 *  请求返回的commendID
 *
 *  @return 对应的commendID
 */
- (int)responseCommendID
{
    return IM_GET_MSG_BY_ID_RES;
}

/**
 *  解析数据的block
 *
 *  @return 解析数据的block
 */
- (Analysis)analysisReturnData
{
    Analysis analysis = (id)^(NSData* data)
    {
        IMGetMsgByIdRsp *lstMsgs = [IMGetMsgByIdRsp parseFromData:data error:nil];
        return [lstMsgs msgListArray];
    };
    return analysis;
}

/**
 *  打包数据的block
 *
 *  @return 打包数据的block
 */
- (Package)packageRequestObject
{
    Package package = (id)^(id object,uint16_t seqNo)
    {
        enum SessionType type = [object[0] intValue];
        int sessionID = [MTTUtil changeIDToOriginal:object[1]];
        NSArray *array = object[2];
        
        GPBUInt32Array *ids = [GPBUInt32Array new];
        
        for(NSNumber *number in array) {
            [ids addValue:[number unsignedIntValue]];
        }
        
        IMGetMsgByIdReq *req = [IMGetMsgByIdReq new];
        [req setUserId:0];
        [req setSessionType:type];
        [req setSessionId:sessionID];
        [req setMsgIdListArray:ids];
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        [dataout writeInt:0];
        [dataout writeTcpProtocolHeader:SID_MSG
                                    cId:IM_GET_MSG_BY_ID_REQ
                                  seqNo:seqNo];
        [dataout directWriteBytes:[req data]];
        [dataout writeDataCount];
        return [dataout toByteArray];
    };
    return package;
}
@end
