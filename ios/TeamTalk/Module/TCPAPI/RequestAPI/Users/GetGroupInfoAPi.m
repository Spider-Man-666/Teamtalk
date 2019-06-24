//
//  GetGroupInfoAPi.m
//  TeamTalk
//
//  Created by Michael Scofield on 2014-09-18.
//  Copyright (c) 2014 dujia. All rights reserved.
//

#import "GetGroupInfoAPI.h"
#import "MTTGroupEntity.h"
#import "ImBaseDefine.pbobjc.h"
#import "ImGroup.pbobjc.h"
@implementation GetGroupInfoAPI
- (int)requestTimeOutTimeInterval
{
    return 0;
}

- (int)requestServiceID
{
    return SID_GROUP;
}

- (int)responseServiceID
{
    return SID_GROUP;
}

- (int)requestCommendID
{
    return IM_GROUP_INFO_LIST_REQ;
}

- (int)responseCommendID
{
    return IM_GROUP_INFO_LIST_RES;
}

- (Analysis)analysisReturnData
{
    Analysis analysis = (id)^(NSData* data)
    {
        IMGroupInfoListRsp *rsp = [IMGroupInfoListRsp parseFromData:data error:nil];
       // NSUInteger userid = rsp.userId;
        NSMutableArray *array = [NSMutableArray new];
        for (GroupInfo *info in [rsp groupInfoListArray]) {
            MTTGroupEntity *group = [MTTGroupEntity initMTTGroupEntityFromPBData:info];
            [array addObject:group];
        }
        
        return array;
       
    };
    return analysis;
}

- (Package)packageRequestObject
{
    Package package = (id)^(id object,uint32_t seqNo)
    {
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        IMGroupInfoListReq *info = [IMGroupInfoListReq new];
        GroupVersionInfo *groupInfo = [GroupVersionInfo new];
        
        NSMutableArray* gvinfos = [NSMutableArray new];
        [gvinfos addObject:groupInfo];
        [groupInfo setGroupId:[object[0] intValue]];
        [groupInfo setVersion:[object[1] intValue]];
        [info setUserId:0];
        [info setGroupVersionListArray:gvinfos];
        [dataout writeInt:0];
        [dataout writeTcpProtocolHeader:SID_GROUP
                                    cId:IM_GROUP_INFO_LIST_REQ
                                  seqNo:seqNo];
        [dataout directWriteBytes:[info data]];
        [dataout writeDataCount];
        return [dataout toByteArray];

    };
    return package;
}
@end
