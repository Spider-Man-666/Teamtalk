//
//  DDAddMemberToGroupAPI.m
//  Duoduo
//
//  Created by 独嘉 on 14-5-8.
//  Copyright (c) 2015年 MoguIM All rights reserved.
//

#import "DDAddMemberToGroupAPI.h"
#import "DDGroupModule.h"
#import "MTTGroupEntity.h"
#import "RuntimeStatus.h"
#import "ImGroup.pbobjc.h"
#import "ImBaseDefine.pbobjc.h"
@implementation DDAddMemberToGroupAPI
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
    return SID_GROUP;
}

/**
 *  请求返回的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)responseServiceID
{
    return SID_GROUP;
}

/**
 *  请求的commendID
 *
 *  @return 对应的commendID
 */
- (int)requestCommendID
{
    return IM_GROUP_CHANGE_MEMBER_REQ;
}

/**
 *  请求返回的commendID
 *
 *  @return 对应的commendID
 */
- (int)responseCommendID
{
    return IM_GROUP_CHANGE_MEMBER_RES;
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
        
        IMGroupChangeMemberRsp *rsp = [IMGroupChangeMemberRsp parseFromData:data error:nil];

        uint32_t result =rsp.resultCode;
    NSMutableArray *array = [NSMutableArray new];
        if (result != 0)
        {
            return array;
        }
    

        NSUInteger userCnt = [[rsp curUserIdListArray] count];

        for (NSUInteger i = 0; i < userCnt; i++) {
                NSString* userId = [MTTUtil changeOriginalToLocalID:[[rsp curUserIdListArray]valueAtIndex:i] SessionType:SessionType_SessionTypeSingle];
                [array addObject:userId];
            }
        return array;
        
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
        NSArray* array = (NSArray*)object;
        NSString* groupId = array[0];
        NSArray* userList = array[1];
        GPBUInt32Array *users = [GPBUInt32Array new];
        for (NSString *user in userList) {
            [users addValue:[MTTUtil changeIDToOriginal:user]];
        }
        IMGroupChangeMemberReq *memberChange = [IMGroupChangeMemberReq new];
        [memberChange setUserId:0];
        [memberChange setChangeType:GroupModifyType_GroupModifyTypeAdd];
        [memberChange setGroupId:[MTTUtil changeIDToOriginal:groupId]];
        [memberChange setMemberIdListArray:users];
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        [dataout writeInt:0];
        [dataout writeTcpProtocolHeader:SID_GROUP cId:IM_GROUP_CHANGE_MEMBER_REQ seqNo:seqNo];
        [dataout directWriteBytes:[memberChange data]];
        [dataout writeDataCount];
        return [dataout toByteArray];
    };
    return package;
}
@end
