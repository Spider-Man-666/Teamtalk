//
//  DDGroupMsgReadACKAPI.m
//  Duoduo
//
//  Created by 独嘉 on 14-5-7.
//  Copyright (c) 2015年 MoguIM All rights reserved.
//

#import "MsgReadACKAPI.h"
#import "ImMessage.pbobjc.h"
@implementation MsgReadACKAPI
/**
 *  请求超时时间
 *
 *  @return 超时时间
 */
- (int)requestTimeOutTimeInterval
{
    return 0;
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
    return 0;
}

/**
 *  请求的commendID
 *
 *  @return 对应的commendID
 */
- (int)requestCommendID
{
    return IM_MSG_DATA_READ_ACK;
}

/**
 *  请求返回的commendID
 *
 *  @return 对应的commendID
 */
- (int)responseCommendID
{
    return 0;
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
        
        IMMsgDataReadAck *req = [IMMsgDataReadAck new];
        [req setUserId:0];
        [req setSessionId:[MTTUtil changeIDToOriginal:object[0]]];
        [req setMsgId:[object[1] integerValue]];
        [req setSessionType:[object[2] integerValue]];
    
        
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        [dataout writeInt:0];
        [dataout writeTcpProtocolHeader:SID_MSG cId:IM_MSG_DATA_READ_ACK seqNo:seqNo];
        [dataout directWriteBytes:[req data]];
        [dataout writeDataCount];
        return [dataout toByteArray];
    };
    return package;
}
@end
