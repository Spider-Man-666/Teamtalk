// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: IM.Group.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "ImGroup.pbobjc.h"
 #import "ImBaseDefine.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - ImGroupRoot

@implementation ImGroupRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - ImGroupRoot_FileDescriptor

static GPBFileDescriptor *ImGroupRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"IM.Group"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - IMNormalGroupListReq

@implementation IMNormalGroupListReq

@dynamic userId;
@dynamic attachData;

typedef struct IMNormalGroupListReq__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  NSData *attachData;
} IMNormalGroupListReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMNormalGroupListReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMNormalGroupListReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMNormalGroupListReq_FieldNumber_AttachData,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMNormalGroupListReq__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMNormalGroupListReq class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMNormalGroupListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMNormalGroupListRsp

@implementation IMNormalGroupListRsp

@dynamic userId;
@dynamic groupVersionListArray, groupVersionListArray_Count;
@dynamic attachData;

typedef struct IMNormalGroupListRsp__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  NSMutableArray *groupVersionListArray;
  NSData *attachData;
} IMNormalGroupListRsp__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMNormalGroupListRsp_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMNormalGroupListRsp__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupVersionListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(GroupVersionInfo),
        .number = IMNormalGroupListRsp_FieldNumber_GroupVersionListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMNormalGroupListRsp__storage_, groupVersionListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMNormalGroupListRsp_FieldNumber_AttachData,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMNormalGroupListRsp__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMNormalGroupListRsp class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMNormalGroupListRsp__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMGroupInfoListReq

@implementation IMGroupInfoListReq

@dynamic userId;
@dynamic groupVersionListArray, groupVersionListArray_Count;
@dynamic attachData;

typedef struct IMGroupInfoListReq__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  NSMutableArray *groupVersionListArray;
  NSData *attachData;
} IMGroupInfoListReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupInfoListReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupInfoListReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupVersionListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(GroupVersionInfo),
        .number = IMGroupInfoListReq_FieldNumber_GroupVersionListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupInfoListReq__storage_, groupVersionListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupInfoListReq_FieldNumber_AttachData,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupInfoListReq__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupInfoListReq class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupInfoListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMGroupInfoListRsp

@implementation IMGroupInfoListRsp

@dynamic userId;
@dynamic groupInfoListArray, groupInfoListArray_Count;
@dynamic attachData;

typedef struct IMGroupInfoListRsp__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  NSMutableArray *groupInfoListArray;
  NSData *attachData;
} IMGroupInfoListRsp__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupInfoListRsp_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupInfoListRsp__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupInfoListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(GroupInfo),
        .number = IMGroupInfoListRsp_FieldNumber_GroupInfoListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupInfoListRsp__storage_, groupInfoListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupInfoListRsp_FieldNumber_AttachData,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupInfoListRsp__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupInfoListRsp class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupInfoListRsp__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMGroupCreateReq

@implementation IMGroupCreateReq

@dynamic userId;
@dynamic groupType;
@dynamic groupName;
@dynamic groupAvatar;
@dynamic memberIdListArray, memberIdListArray_Count;
@dynamic attachData;

typedef struct IMGroupCreateReq__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  GroupType groupType;
  NSString *groupName;
  NSString *groupAvatar;
  GPBUInt32Array *memberIdListArray;
  NSData *attachData;
} IMGroupCreateReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupCreateReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupType",
        .dataTypeSpecific.enumDescFunc = GroupType_EnumDescriptor,
        .number = IMGroupCreateReq_FieldNumber_GroupType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupCreateReq__storage_, groupType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "groupName",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateReq_FieldNumber_GroupName,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMGroupCreateReq__storage_, groupName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupAvatar",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateReq_FieldNumber_GroupAvatar,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMGroupCreateReq__storage_, groupAvatar),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "memberIdListArray",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateReq_FieldNumber_MemberIdListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupCreateReq__storage_, memberIdListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateReq_FieldNumber_AttachData,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(IMGroupCreateReq__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupCreateReq class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupCreateReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t IMGroupCreateReq_GroupType_RawValue(IMGroupCreateReq *message) {
  GPBDescriptor *descriptor = [IMGroupCreateReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupCreateReq_FieldNumber_GroupType];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMGroupCreateReq_GroupType_RawValue(IMGroupCreateReq *message, int32_t value) {
  GPBDescriptor *descriptor = [IMGroupCreateReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupCreateReq_FieldNumber_GroupType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - IMGroupCreateRsp

@implementation IMGroupCreateRsp

@dynamic userId;
@dynamic resultCode;
@dynamic groupId;
@dynamic groupName;
@dynamic userIdListArray, userIdListArray_Count;
@dynamic attachData;

typedef struct IMGroupCreateRsp__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  uint32_t resultCode;
  uint32_t groupId;
  NSString *groupName;
  GPBUInt32Array *userIdListArray;
  NSData *attachData;
} IMGroupCreateRsp__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateRsp_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupCreateRsp__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "resultCode",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateRsp_FieldNumber_ResultCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupCreateRsp__storage_, resultCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateRsp_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMGroupCreateRsp__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupName",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateRsp_FieldNumber_GroupName,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMGroupCreateRsp__storage_, groupName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "userIdListArray",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateRsp_FieldNumber_UserIdListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupCreateRsp__storage_, userIdListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupCreateRsp_FieldNumber_AttachData,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(IMGroupCreateRsp__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupCreateRsp class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupCreateRsp__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMGroupChangeMemberReq

@implementation IMGroupChangeMemberReq

@dynamic userId;
@dynamic changeType;
@dynamic groupId;
@dynamic memberIdListArray, memberIdListArray_Count;
@dynamic attachData;

typedef struct IMGroupChangeMemberReq__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  GroupModifyType changeType;
  uint32_t groupId;
  GPBUInt32Array *memberIdListArray;
  NSData *attachData;
} IMGroupChangeMemberReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "changeType",
        .dataTypeSpecific.enumDescFunc = GroupModifyType_EnumDescriptor,
        .number = IMGroupChangeMemberReq_FieldNumber_ChangeType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberReq__storage_, changeType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "memberIdListArray",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberReq_FieldNumber_MemberIdListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberReq__storage_, memberIdListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberReq_FieldNumber_AttachData,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberReq__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupChangeMemberReq class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupChangeMemberReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t IMGroupChangeMemberReq_ChangeType_RawValue(IMGroupChangeMemberReq *message) {
  GPBDescriptor *descriptor = [IMGroupChangeMemberReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupChangeMemberReq_FieldNumber_ChangeType];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMGroupChangeMemberReq_ChangeType_RawValue(IMGroupChangeMemberReq *message, int32_t value) {
  GPBDescriptor *descriptor = [IMGroupChangeMemberReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupChangeMemberReq_FieldNumber_ChangeType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - IMGroupChangeMemberRsp

@implementation IMGroupChangeMemberRsp

@dynamic userId;
@dynamic changeType;
@dynamic resultCode;
@dynamic groupId;
@dynamic curUserIdListArray, curUserIdListArray_Count;
@dynamic chgUserIdListArray, chgUserIdListArray_Count;
@dynamic attachData;

typedef struct IMGroupChangeMemberRsp__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  GroupModifyType changeType;
  uint32_t resultCode;
  uint32_t groupId;
  GPBUInt32Array *curUserIdListArray;
  GPBUInt32Array *chgUserIdListArray;
  NSData *attachData;
} IMGroupChangeMemberRsp__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberRsp_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberRsp__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "changeType",
        .dataTypeSpecific.enumDescFunc = GroupModifyType_EnumDescriptor,
        .number = IMGroupChangeMemberRsp_FieldNumber_ChangeType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberRsp__storage_, changeType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "resultCode",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberRsp_FieldNumber_ResultCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberRsp__storage_, resultCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberRsp_FieldNumber_GroupId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberRsp__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "curUserIdListArray",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberRsp_FieldNumber_CurUserIdListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberRsp__storage_, curUserIdListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "chgUserIdListArray",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberRsp_FieldNumber_ChgUserIdListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberRsp__storage_, chgUserIdListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberRsp_FieldNumber_AttachData,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberRsp__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupChangeMemberRsp class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupChangeMemberRsp__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t IMGroupChangeMemberRsp_ChangeType_RawValue(IMGroupChangeMemberRsp *message) {
  GPBDescriptor *descriptor = [IMGroupChangeMemberRsp descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupChangeMemberRsp_FieldNumber_ChangeType];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMGroupChangeMemberRsp_ChangeType_RawValue(IMGroupChangeMemberRsp *message, int32_t value) {
  GPBDescriptor *descriptor = [IMGroupChangeMemberRsp descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupChangeMemberRsp_FieldNumber_ChangeType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - IMGroupShieldReq

@implementation IMGroupShieldReq

@dynamic userId;
@dynamic groupId;
@dynamic shieldStatus;
@dynamic attachData;

typedef struct IMGroupShieldReq__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  uint32_t groupId;
  uint32_t shieldStatus;
  NSData *attachData;
} IMGroupShieldReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupShieldReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldReq_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupShieldReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "shieldStatus",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldReq_FieldNumber_ShieldStatus,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMGroupShieldReq__storage_, shieldStatus),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldReq_FieldNumber_AttachData,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMGroupShieldReq__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupShieldReq class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupShieldReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMGroupShieldRsp

@implementation IMGroupShieldRsp

@dynamic userId;
@dynamic groupId;
@dynamic resultCode;
@dynamic attachData;

typedef struct IMGroupShieldRsp__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  uint32_t groupId;
  uint32_t resultCode;
  NSData *attachData;
} IMGroupShieldRsp__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldRsp_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupShieldRsp__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldRsp_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupShieldRsp__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "resultCode",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldRsp_FieldNumber_ResultCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMGroupShieldRsp__storage_, resultCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "attachData",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupShieldRsp_FieldNumber_AttachData,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMGroupShieldRsp__storage_, attachData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupShieldRsp class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupShieldRsp__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMGroupChangeMemberNotify

@implementation IMGroupChangeMemberNotify

@dynamic userId;
@dynamic changeType;
@dynamic groupId;
@dynamic curUserIdListArray, curUserIdListArray_Count;
@dynamic chgUserIdListArray, chgUserIdListArray_Count;

typedef struct IMGroupChangeMemberNotify__storage_ {
  uint32_t _has_storage_[1];
  uint32_t userId;
  GroupModifyType changeType;
  uint32_t groupId;
  GPBUInt32Array *curUserIdListArray;
  GPBUInt32Array *chgUserIdListArray;
} IMGroupChangeMemberNotify__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberNotify_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberNotify__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "changeType",
        .dataTypeSpecific.enumDescFunc = GroupModifyType_EnumDescriptor,
        .number = IMGroupChangeMemberNotify_FieldNumber_ChangeType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberNotify__storage_, changeType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberNotify_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberNotify__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "curUserIdListArray",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberNotify_FieldNumber_CurUserIdListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberNotify__storage_, curUserIdListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "chgUserIdListArray",
        .dataTypeSpecific.className = NULL,
        .number = IMGroupChangeMemberNotify_FieldNumber_ChgUserIdListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(IMGroupChangeMemberNotify__storage_, chgUserIdListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeUInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMGroupChangeMemberNotify class]
                                     rootClass:[ImGroupRoot class]
                                          file:ImGroupRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMGroupChangeMemberNotify__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t IMGroupChangeMemberNotify_ChangeType_RawValue(IMGroupChangeMemberNotify *message) {
  GPBDescriptor *descriptor = [IMGroupChangeMemberNotify descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupChangeMemberNotify_FieldNumber_ChangeType];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMGroupChangeMemberNotify_ChangeType_RawValue(IMGroupChangeMemberNotify *message, int32_t value) {
  GPBDescriptor *descriptor = [IMGroupChangeMemberNotify descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMGroupChangeMemberNotify_FieldNumber_ChangeType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
