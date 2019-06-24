//
//  MTUserEntity.h
//  Duoduo
//
//  Created by 独嘉 on 15/1/11.
//  Copyright (c) 2015年 zuoye. All rights reserved.
//

#import "DDOriginEntity.h"
#import "IMBaseDefine.pb.h"
@interface MTUserEntity : DDOriginEntity

@property (nonatomic,assign)NSInteger gender;
@property (nonatomic,assign)NSInteger department;
@property (nonatomic,strong)NSString* email;
@property (nonatomic,strong)NSString* realName;
@property (nonatomic,strong)NSString* userDomain;
@property (nonatomic,strong)NSString* tel;
@property (nonatomic,assign)NSInteger status;
@property (nonatomic,strong)NSString* departmentName;

- (instancetype)initWithID:(NSString*)ID name:(NSString*)name avatar:(NSString*)avatar gender:(NSInteger)gender department:(NSInteger)department email:(NSString*)email realName:(NSString*)realName userDomain:(NSString*)userDomain tel:(NSString*)tel status:(NSInteger)status;

- (instancetype)initWithUserInfo:(UserInfo*)userInfo;

- (NSString*)toJson;

- (NSString*)smallAvatar;

@end
