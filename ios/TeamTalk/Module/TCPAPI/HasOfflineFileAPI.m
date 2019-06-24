//
//  HasOfflineFileAPI.m
//  TeamTalk
//
//  Created by xiaominfc on 2018/4/28.
//  Copyright © 2018 MoguIM. All rights reserved.
//

#import "HasOfflineFileAPI.h"
#import "ImBaseDefine.pbobjc.h"
#import "ImFile.pbobjc.h"

@implementation HasOfflineFileAPI


/**
 *  请求超时时间
 *
 *  @return 超时时间
 */
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
    return SID_BUDDY_LIST;
}

/**
 *  请求返回的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)responseServiceID
{
    return SID_BUDDY_LIST;
}

/**
 *  请求的commendID
 *
 *  @return 对应的commendID
 */
- (int)requestCommendID
{
    return FileCmdID_CidFileHasOfflineReq;
}

/**
 *  请求返回的commendID
 *
 *  @return 对应的commendID
 */
- (int)responseCommendID
{
    return FileCmdID_CidFileHasOfflineRes;
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
        IMFileHasOfflineRsp *rsp = [IMFileHasOfflineRsp parseFromData:data error:nil];
        return rsp;
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
        IMFileHasOfflineReq *req = [IMFileHasOfflineReq new];
        [req setUserId:0];
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        [dataout writeInt:0];
        [dataout writeTcpProtocolHeader:SID_BUDDY_LIST
                                    cId:IM_USERS_STAT_REQ
                                  seqNo:seqNo];
        [dataout directWriteBytes:[req data]];
        [dataout writeDataCount];
        return [dataout toByteArray];
    };
    return package;
}

@end
