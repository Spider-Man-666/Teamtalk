// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: IM.Group.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class GroupInfo;
@class GroupVersionInfo;
GPB_ENUM_FWD_DECLARE(GroupModifyType);
GPB_ENUM_FWD_DECLARE(GroupType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - ImGroupRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface ImGroupRoot : GPBRootObject
@end

#pragma mark - IMNormalGroupListReq

typedef GPB_ENUM(IMNormalGroupListReq_FieldNumber) {
  IMNormalGroupListReq_FieldNumber_UserId = 1,
  IMNormalGroupListReq_FieldNumber_AttachData = 20,
};

@interface IMNormalGroupListReq : GPBMessage

/** cmd id:			0x0401 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

#pragma mark - IMNormalGroupListRsp

typedef GPB_ENUM(IMNormalGroupListRsp_FieldNumber) {
  IMNormalGroupListRsp_FieldNumber_UserId = 1,
  IMNormalGroupListRsp_FieldNumber_GroupVersionListArray = 2,
  IMNormalGroupListRsp_FieldNumber_AttachData = 20,
};

@interface IMNormalGroupListRsp : GPBMessage

/** cmd id:			0x0402 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<GroupVersionInfo*> *groupVersionListArray;
/** The number of items in @c groupVersionListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger groupVersionListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

#pragma mark - IMGroupInfoListReq

typedef GPB_ENUM(IMGroupInfoListReq_FieldNumber) {
  IMGroupInfoListReq_FieldNumber_UserId = 1,
  IMGroupInfoListReq_FieldNumber_GroupVersionListArray = 2,
  IMGroupInfoListReq_FieldNumber_AttachData = 20,
};

@interface IMGroupInfoListReq : GPBMessage

/** cmd id:			0x0403 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<GroupVersionInfo*> *groupVersionListArray;
/** The number of items in @c groupVersionListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger groupVersionListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

#pragma mark - IMGroupInfoListRsp

typedef GPB_ENUM(IMGroupInfoListRsp_FieldNumber) {
  IMGroupInfoListRsp_FieldNumber_UserId = 1,
  IMGroupInfoListRsp_FieldNumber_GroupInfoListArray = 2,
  IMGroupInfoListRsp_FieldNumber_AttachData = 20,
};

@interface IMGroupInfoListRsp : GPBMessage

/** cmd id:			0x0404 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<GroupInfo*> *groupInfoListArray;
/** The number of items in @c groupInfoListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger groupInfoListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

#pragma mark - IMGroupCreateReq

typedef GPB_ENUM(IMGroupCreateReq_FieldNumber) {
  IMGroupCreateReq_FieldNumber_UserId = 1,
  IMGroupCreateReq_FieldNumber_GroupType = 2,
  IMGroupCreateReq_FieldNumber_GroupName = 3,
  IMGroupCreateReq_FieldNumber_GroupAvatar = 4,
  IMGroupCreateReq_FieldNumber_MemberIdListArray = 5,
  IMGroupCreateReq_FieldNumber_AttachData = 20,
};

@interface IMGroupCreateReq : GPBMessage

/** cmd id:			0x0405 */
@property(nonatomic, readwrite) uint32_t userId;

/** IM.BaseDefine.GroupType group_type = 2 [default = GROUP_TYPE_TMP];		//默认是创建临时群，且客户端只能创建临时群 */
@property(nonatomic, readwrite) enum GroupType groupType;

@property(nonatomic, readwrite, copy, null_resettable) NSString *groupName;

@property(nonatomic, readwrite, copy, null_resettable) NSString *groupAvatar;

@property(nonatomic, readwrite, strong, null_resettable) GPBUInt32Array *memberIdListArray;
/** The number of items in @c memberIdListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger memberIdListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

/**
 * Fetches the raw value of a @c IMGroupCreateReq's @c groupType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t IMGroupCreateReq_GroupType_RawValue(IMGroupCreateReq *message);
/**
 * Sets the raw value of an @c IMGroupCreateReq's @c groupType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetIMGroupCreateReq_GroupType_RawValue(IMGroupCreateReq *message, int32_t value);

#pragma mark - IMGroupCreateRsp

typedef GPB_ENUM(IMGroupCreateRsp_FieldNumber) {
  IMGroupCreateRsp_FieldNumber_UserId = 1,
  IMGroupCreateRsp_FieldNumber_ResultCode = 2,
  IMGroupCreateRsp_FieldNumber_GroupId = 3,
  IMGroupCreateRsp_FieldNumber_GroupName = 4,
  IMGroupCreateRsp_FieldNumber_UserIdListArray = 5,
  IMGroupCreateRsp_FieldNumber_AttachData = 20,
};

@interface IMGroupCreateRsp : GPBMessage

/** cmd id:			0x0406 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite) uint32_t resultCode;

@property(nonatomic, readwrite) uint32_t groupId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *groupName;

@property(nonatomic, readwrite, strong, null_resettable) GPBUInt32Array *userIdListArray;
/** The number of items in @c userIdListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger userIdListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

#pragma mark - IMGroupChangeMemberReq

typedef GPB_ENUM(IMGroupChangeMemberReq_FieldNumber) {
  IMGroupChangeMemberReq_FieldNumber_UserId = 1,
  IMGroupChangeMemberReq_FieldNumber_ChangeType = 2,
  IMGroupChangeMemberReq_FieldNumber_GroupId = 3,
  IMGroupChangeMemberReq_FieldNumber_MemberIdListArray = 4,
  IMGroupChangeMemberReq_FieldNumber_AttachData = 20,
};

@interface IMGroupChangeMemberReq : GPBMessage

/** cmd id:			0x0407 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite) enum GroupModifyType changeType;

@property(nonatomic, readwrite) uint32_t groupId;

@property(nonatomic, readwrite, strong, null_resettable) GPBUInt32Array *memberIdListArray;
/** The number of items in @c memberIdListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger memberIdListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

/**
 * Fetches the raw value of a @c IMGroupChangeMemberReq's @c changeType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t IMGroupChangeMemberReq_ChangeType_RawValue(IMGroupChangeMemberReq *message);
/**
 * Sets the raw value of an @c IMGroupChangeMemberReq's @c changeType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetIMGroupChangeMemberReq_ChangeType_RawValue(IMGroupChangeMemberReq *message, int32_t value);

#pragma mark - IMGroupChangeMemberRsp

typedef GPB_ENUM(IMGroupChangeMemberRsp_FieldNumber) {
  IMGroupChangeMemberRsp_FieldNumber_UserId = 1,
  IMGroupChangeMemberRsp_FieldNumber_ChangeType = 2,
  IMGroupChangeMemberRsp_FieldNumber_ResultCode = 3,
  IMGroupChangeMemberRsp_FieldNumber_GroupId = 4,
  IMGroupChangeMemberRsp_FieldNumber_CurUserIdListArray = 5,
  IMGroupChangeMemberRsp_FieldNumber_ChgUserIdListArray = 6,
  IMGroupChangeMemberRsp_FieldNumber_AttachData = 20,
};

@interface IMGroupChangeMemberRsp : GPBMessage

/** cmd id:			0x0408 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite) enum GroupModifyType changeType;

@property(nonatomic, readwrite) uint32_t resultCode;

@property(nonatomic, readwrite) uint32_t groupId;

/** 现有的成员id */
@property(nonatomic, readwrite, strong, null_resettable) GPBUInt32Array *curUserIdListArray;
/** The number of items in @c curUserIdListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger curUserIdListArray_Count;

/** 变动的成员id,add: 表示添加成功的id,   del: 表示删除的id */
@property(nonatomic, readwrite, strong, null_resettable) GPBUInt32Array *chgUserIdListArray;
/** The number of items in @c chgUserIdListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger chgUserIdListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

/**
 * Fetches the raw value of a @c IMGroupChangeMemberRsp's @c changeType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t IMGroupChangeMemberRsp_ChangeType_RawValue(IMGroupChangeMemberRsp *message);
/**
 * Sets the raw value of an @c IMGroupChangeMemberRsp's @c changeType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetIMGroupChangeMemberRsp_ChangeType_RawValue(IMGroupChangeMemberRsp *message, int32_t value);

#pragma mark - IMGroupShieldReq

typedef GPB_ENUM(IMGroupShieldReq_FieldNumber) {
  IMGroupShieldReq_FieldNumber_UserId = 1,
  IMGroupShieldReq_FieldNumber_GroupId = 2,
  IMGroupShieldReq_FieldNumber_ShieldStatus = 3,
  IMGroupShieldReq_FieldNumber_AttachData = 20,
};

@interface IMGroupShieldReq : GPBMessage

/** cmd id:			0x0409 */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite) uint32_t groupId;

@property(nonatomic, readwrite) uint32_t shieldStatus;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

#pragma mark - IMGroupShieldRsp

typedef GPB_ENUM(IMGroupShieldRsp_FieldNumber) {
  IMGroupShieldRsp_FieldNumber_UserId = 1,
  IMGroupShieldRsp_FieldNumber_GroupId = 2,
  IMGroupShieldRsp_FieldNumber_ResultCode = 3,
  IMGroupShieldRsp_FieldNumber_AttachData = 20,
};

@interface IMGroupShieldRsp : GPBMessage

/** cmd id:			0x040a */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite) uint32_t groupId;

/** 0:successed 1:failed */
@property(nonatomic, readwrite) uint32_t resultCode;

@property(nonatomic, readwrite, copy, null_resettable) NSData *attachData;

@end

#pragma mark - IMGroupChangeMemberNotify

typedef GPB_ENUM(IMGroupChangeMemberNotify_FieldNumber) {
  IMGroupChangeMemberNotify_FieldNumber_UserId = 1,
  IMGroupChangeMemberNotify_FieldNumber_ChangeType = 2,
  IMGroupChangeMemberNotify_FieldNumber_GroupId = 3,
  IMGroupChangeMemberNotify_FieldNumber_CurUserIdListArray = 4,
  IMGroupChangeMemberNotify_FieldNumber_ChgUserIdListArray = 5,
};

@interface IMGroupChangeMemberNotify : GPBMessage

/** cmd id: 			0x040b */
@property(nonatomic, readwrite) uint32_t userId;

@property(nonatomic, readwrite) enum GroupModifyType changeType;

@property(nonatomic, readwrite) uint32_t groupId;

/** 现有的成员id */
@property(nonatomic, readwrite, strong, null_resettable) GPBUInt32Array *curUserIdListArray;
/** The number of items in @c curUserIdListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger curUserIdListArray_Count;

/** add: 表示添加成功的id,   del: 表示删除的id */
@property(nonatomic, readwrite, strong, null_resettable) GPBUInt32Array *chgUserIdListArray;
/** The number of items in @c chgUserIdListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger chgUserIdListArray_Count;

@end

/**
 * Fetches the raw value of a @c IMGroupChangeMemberNotify's @c changeType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t IMGroupChangeMemberNotify_ChangeType_RawValue(IMGroupChangeMemberNotify *message);
/**
 * Sets the raw value of an @c IMGroupChangeMemberNotify's @c changeType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetIMGroupChangeMemberNotify_ChangeType_RawValue(IMGroupChangeMemberNotify *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
