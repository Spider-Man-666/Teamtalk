//
//  MTUserEntity.m
//  Duoduo
//
//  Created by 独嘉 on 15/1/11.
//  Copyright (c) 2015年 zuoye. All rights reserved.
//

#import "MTUserEntity.h"
#import "MTImageCache.h"
#import "MTDepartmentManager.h"
@implementation MTUserEntity

- (instancetype)initWithID:(NSString*)ID name:(NSString*)name avatar:(NSString*)avatar gender:(NSInteger)gender department:(NSInteger)department email:(NSString*)email realName:(NSString*)realName userDomain:(NSString *)userDomain tel:(NSString*)tel status:(NSInteger)status
{
    self = [super init];
    if (self)
    {
        self.ID = ID;
        self.name = name;
        self.avatar = avatar;
        self.gender = gender;
        self.department = department;
        self.email = email;
        self.realName = realName;
        self.userDomain = userDomain;
        self.tel = tel;
        self.status = status;
    }
    return self;
}


- (instancetype)initWithUserInfo:(UserInfo*)userInfo
{
    NSString* ID = [NSString stringWithFormat:@"%d",userInfo.userId];
    self = [self initWithID:ID name:userInfo.userNickName avatar:userInfo.avatarUrl gender:userInfo.userGender department:userInfo.departmentId email:userInfo.email realName:userInfo.userRealName userDomain:userInfo.userDomain tel:userInfo.userTel status:userInfo.status];
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (object == self)
    {
        return YES;
    }
    if (![object isKindOfClass:[MTUserEntity class]])
    {
        return NO;
    }
    MTUserEntity* user = (MTUserEntity*)object;
    if ([self.ID isEqualToString:user.ID] &&
        [self.name isEqualToString:self.name])
    {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return [self.ID hash];
}

- (NSString*)toJson
{
    NSString* avatar = self.smallAvatar;
    NSString* filePath = [[MTImageCache shareInstance] filePathWithKey:avatar];
    if (filePath)
    {
        avatar = [filePath copy];
    }
    NSDictionary* dic = @{@"ID":self.ID,
                          @"Name":self.name,
                          @"Avatar":self.avatar,
                          @"Gender":@(self.gender),
                          @"Department":self.department ? @(self.department) : @"",
                          @"Email":self.email ? self.email : @"",
                          @"RealName":self.realName ? self.realName : @"",
                          @"UserDoamin":self.userDomain ? self.userDomain : @"",
                          @"Tel":self.tel ? self.tel : @"",
                          @"Status":@(self.status)};
    NSError* error = nil;
    NSData *historyData = [NSJSONSerialization dataWithJSONObject:dic
                                                          options:NSJSONWritingPrettyPrinted
                                                            error:&error];
    
    if (!error)
    {
        NSString* json = [[NSString alloc] initWithData:historyData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
    
}

- (NSString*)smallAvatar
{
    if (![self.avatar hasSuffix:@"_100x100.jpg"])
    {
        return [NSString stringWithFormat:@"%@_100x100.jpg",self.avatar];
    }
    return self.avatar;
}

- (NSString*)departmentName
{
    if ([self.departmentName length] == 0)
    {
        MTDepartmentEntity* department = [[MTDepartmentManager shareInstance] getDepartmentForID:self.department];
        self.departmentName = [NSString stringWithString:department.name];
    }
    return self.departmentName;
}
@end
