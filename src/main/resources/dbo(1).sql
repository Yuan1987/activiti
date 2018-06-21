/*
Navicat SQL Server Data Transfer

Source Server         : mba
Source Server Version : 110000
Source Host           : 192.168.20.91:1433
Source Database       : CETC
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2017-10-13 10:38:01
*/


-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
DROP TABLE [dbo].[ACT_EVT_LOG]
GO
CREATE TABLE [dbo].[ACT_EVT_LOG] (
[LOG_NR_] numeric(19) NOT NULL IDENTITY(1,1) ,
[TYPE_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[TIME_STAMP_] datetime NOT NULL ,
[USER_ID_] nvarchar(255) NULL ,
[DATA_] varbinary(MAX) NULL ,
[LOCK_OWNER_] nvarchar(255) NULL ,
[LOCK_TIME_] datetime NULL ,
[IS_PROCESSED_] tinyint NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Records of ACT_EVT_LOG
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ACT_EVT_LOG] ON
GO
SET IDENTITY_INSERT [dbo].[ACT_EVT_LOG] OFF
GO

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
DROP TABLE [dbo].[ACT_GE_BYTEARRAY]
GO
CREATE TABLE [dbo].[ACT_GE_BYTEARRAY] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[NAME_] nvarchar(255) NULL ,
[DEPLOYMENT_ID_] nvarchar(64) NULL ,
[BYTES_] varbinary(MAX) NULL ,
[GENERATED_] tinyint NULL 
)


GO

-- ----------------------------
-- Records of ACT_GE_BYTEARRAY
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
DROP TABLE [dbo].[ACT_GE_PROPERTY]
GO
CREATE TABLE [dbo].[ACT_GE_PROPERTY] (
[NAME_] nvarchar(64) NOT NULL ,
[VALUE_] nvarchar(300) NULL ,
[REV_] int NULL 
)


GO

-- ----------------------------
-- Records of ACT_GE_PROPERTY
-- ----------------------------
INSERT INTO [dbo].[ACT_GE_PROPERTY] ([NAME_], [VALUE_], [REV_]) VALUES (N'next.dbid', N'1', N'1')
GO
GO
INSERT INTO [dbo].[ACT_GE_PROPERTY] ([NAME_], [VALUE_], [REV_]) VALUES (N'schema.history', N'create(5.22.0.0)', N'1')
GO
GO
INSERT INTO [dbo].[ACT_GE_PROPERTY] ([NAME_], [VALUE_], [REV_]) VALUES (N'schema.version', N'5.22.0.0', N'1')
GO
GO

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_ACTINST]
GO
CREATE TABLE [dbo].[ACT_HI_ACTINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NOT NULL ,
[EXECUTION_ID_] nvarchar(64) NOT NULL ,
[ACT_ID_] nvarchar(255) NOT NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[CALL_PROC_INST_ID_] nvarchar(64) NULL ,
[ACT_NAME_] nvarchar(255) NULL ,
[ACT_TYPE_] nvarchar(255) NOT NULL ,
[ASSIGNEE_] nvarchar(255) NULL ,
[START_TIME_] datetime NOT NULL ,
[END_TIME_] datetime NULL ,
[DURATION_] numeric(19) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Records of ACT_HI_ACTINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_ATTACHMENT]
GO
CREATE TABLE [dbo].[ACT_HI_ATTACHMENT] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[USER_ID_] nvarchar(255) NULL ,
[NAME_] nvarchar(255) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[TYPE_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[URL_] nvarchar(4000) NULL ,
[CONTENT_ID_] nvarchar(64) NULL ,
[TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Records of ACT_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_COMMENT]
GO
CREATE TABLE [dbo].[ACT_HI_COMMENT] (
[ID_] nvarchar(64) NOT NULL ,
[TYPE_] nvarchar(255) NULL ,
[TIME_] datetime NOT NULL ,
[USER_ID_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[ACTION_] nvarchar(255) NULL ,
[MESSAGE_] nvarchar(4000) NULL ,
[FULL_MSG_] varbinary(MAX) NULL 
)


GO

-- ----------------------------
-- Records of ACT_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_DETAIL]
GO
CREATE TABLE [dbo].[ACT_HI_DETAIL] (
[ID_] nvarchar(64) NOT NULL ,
[TYPE_] nvarchar(255) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[ACT_INST_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NOT NULL ,
[VAR_TYPE_] nvarchar(255) NULL ,
[REV_] int NULL ,
[TIME_] datetime NOT NULL ,
[BYTEARRAY_ID_] nvarchar(64) NULL ,
[DOUBLE_] float(53) NULL ,
[LONG_] numeric(19) NULL ,
[TEXT_] nvarchar(4000) NULL ,
[TEXT2_] nvarchar(4000) NULL 
)


GO

-- ----------------------------
-- Records of ACT_HI_DETAIL
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_IDENTITYLINK]
GO
CREATE TABLE [dbo].[ACT_HI_IDENTITYLINK] (
[ID_] nvarchar(64) NOT NULL ,
[GROUP_ID_] nvarchar(255) NULL ,
[TYPE_] nvarchar(255) NULL ,
[USER_ID_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Records of ACT_HI_IDENTITYLINK
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_PROCINST]
GO
CREATE TABLE [dbo].[ACT_HI_PROCINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NOT NULL ,
[BUSINESS_KEY_] nvarchar(255) NULL ,
[PROC_DEF_ID_] nvarchar(64) NOT NULL ,
[START_TIME_] datetime NOT NULL ,
[END_TIME_] datetime NULL ,
[DURATION_] numeric(19) NULL ,
[START_USER_ID_] nvarchar(255) NULL ,
[START_ACT_ID_] nvarchar(255) NULL ,
[END_ACT_ID_] nvarchar(255) NULL ,
[SUPER_PROCESS_INSTANCE_ID_] nvarchar(64) NULL ,
[DELETE_REASON_] nvarchar(4000) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[NAME_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of ACT_HI_PROCINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_TASKINST]
GO
CREATE TABLE [dbo].[ACT_HI_TASKINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[TASK_DEF_KEY_] nvarchar(255) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NULL ,
[PARENT_TASK_ID_] nvarchar(64) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[OWNER_] nvarchar(255) NULL ,
[ASSIGNEE_] nvarchar(255) NULL ,
[START_TIME_] datetime NOT NULL ,
[CLAIM_TIME_] datetime NULL ,
[END_TIME_] datetime NULL ,
[DURATION_] numeric(19) NULL ,
[DELETE_REASON_] nvarchar(4000) NULL ,
[PRIORITY_] int NULL ,
[DUE_DATE_] datetime NULL ,
[FORM_KEY_] nvarchar(255) NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Records of ACT_HI_TASKINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_VARINST]
GO
CREATE TABLE [dbo].[ACT_HI_VARINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NOT NULL ,
[VAR_TYPE_] nvarchar(100) NULL ,
[REV_] int NULL ,
[BYTEARRAY_ID_] nvarchar(64) NULL ,
[DOUBLE_] float(53) NULL ,
[LONG_] numeric(19) NULL ,
[TEXT_] nvarchar(4000) NULL ,
[TEXT2_] nvarchar(4000) NULL ,
[CREATE_TIME_] datetime NULL ,
[LAST_UPDATED_TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Records of ACT_HI_VARINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_GROUP
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_GROUP]
GO
CREATE TABLE [dbo].[ACT_ID_GROUP] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[NAME_] nvarchar(255) NULL ,
[TYPE_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of ACT_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_INFO
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_INFO]
GO
CREATE TABLE [dbo].[ACT_ID_INFO] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[USER_ID_] nvarchar(64) NULL ,
[TYPE_] nvarchar(64) NULL ,
[KEY_] nvarchar(255) NULL ,
[VALUE_] nvarchar(255) NULL ,
[PASSWORD_] varbinary(MAX) NULL ,
[PARENT_ID_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of ACT_ID_INFO
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_MEMBERSHIP
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_MEMBERSHIP]
GO
CREATE TABLE [dbo].[ACT_ID_MEMBERSHIP] (
[USER_ID_] nvarchar(64) NOT NULL ,
[GROUP_ID_] nvarchar(64) NOT NULL 
)


GO

-- ----------------------------
-- Records of ACT_ID_MEMBERSHIP
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_USER
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_USER]
GO
CREATE TABLE [dbo].[ACT_ID_USER] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[FIRST_] nvarchar(255) NULL ,
[LAST_] nvarchar(255) NULL ,
[EMAIL_] nvarchar(255) NULL ,
[PWD_] nvarchar(255) NULL ,
[PICTURE_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Records of ACT_ID_USER
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_PROCDEF_INFO
-- ----------------------------
DROP TABLE [dbo].[ACT_PROCDEF_INFO]
GO
CREATE TABLE [dbo].[ACT_PROCDEF_INFO] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[INFO_JSON_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Records of ACT_PROCDEF_INFO
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE [dbo].[ACT_RE_DEPLOYMENT]
GO
CREATE TABLE [dbo].[ACT_RE_DEPLOYMENT] (
[ID_] nvarchar(64) NOT NULL ,
[NAME_] nvarchar(255) NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[DEPLOY_TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Records of ACT_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
DROP TABLE [dbo].[ACT_RE_MODEL]
GO
CREATE TABLE [dbo].[ACT_RE_MODEL] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[NAME_] nvarchar(255) NULL ,
[KEY_] nvarchar(255) NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[CREATE_TIME_] datetime NULL ,
[LAST_UPDATE_TIME_] datetime NULL ,
[VERSION_] int NULL ,
[META_INFO_] nvarchar(4000) NULL ,
[DEPLOYMENT_ID_] nvarchar(64) NULL ,
[EDITOR_SOURCE_VALUE_ID_] nvarchar(64) NULL ,
[EDITOR_SOURCE_EXTRA_VALUE_ID_] nvarchar(64) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Records of ACT_RE_MODEL
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
DROP TABLE [dbo].[ACT_RE_PROCDEF]
GO
CREATE TABLE [dbo].[ACT_RE_PROCDEF] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[NAME_] nvarchar(255) NULL ,
[KEY_] nvarchar(255) NOT NULL ,
[VERSION_] int NOT NULL ,
[DEPLOYMENT_ID_] nvarchar(64) NULL ,
[RESOURCE_NAME_] nvarchar(4000) NULL ,
[DGRM_RESOURCE_NAME_] nvarchar(4000) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[HAS_START_FORM_KEY_] tinyint NULL ,
[HAS_GRAPHICAL_NOTATION_] tinyint NULL ,
[SUSPENSION_STATE_] tinyint NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Records of ACT_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_EVENT_SUBSCR]
GO
CREATE TABLE [dbo].[ACT_RU_EVENT_SUBSCR] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[EVENT_TYPE_] nvarchar(255) NOT NULL ,
[EVENT_NAME_] nvarchar(255) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[ACTIVITY_ID_] nvarchar(64) NULL ,
[CONFIGURATION_] nvarchar(255) NULL ,
[CREATED_] datetime NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Records of ACT_RU_EVENT_SUBSCR
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_EXECUTION]
GO
CREATE TABLE [dbo].[ACT_RU_EXECUTION] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[BUSINESS_KEY_] nvarchar(255) NULL ,
[PARENT_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[SUPER_EXEC_] nvarchar(64) NULL ,
[ACT_ID_] nvarchar(255) NULL ,
[IS_ACTIVE_] tinyint NULL ,
[IS_CONCURRENT_] tinyint NULL ,
[IS_SCOPE_] tinyint NULL ,
[IS_EVENT_SCOPE_] tinyint NULL ,
[SUSPENSION_STATE_] tinyint NULL ,
[CACHED_ENT_STATE_] int NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[NAME_] nvarchar(255) NULL ,
[LOCK_TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Records of ACT_RU_EXECUTION
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_IDENTITYLINK]
GO
CREATE TABLE [dbo].[ACT_RU_IDENTITYLINK] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[GROUP_ID_] nvarchar(255) NULL ,
[TYPE_] nvarchar(255) NULL ,
[USER_ID_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Records of ACT_RU_IDENTITYLINK
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_JOB]
GO
CREATE TABLE [dbo].[ACT_RU_JOB] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[TYPE_] nvarchar(255) NOT NULL ,
[LOCK_EXP_TIME_] datetime NULL ,
[LOCK_OWNER_] nvarchar(255) NULL ,
[EXCLUSIVE_] bit NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROCESS_INSTANCE_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[RETRIES_] int NULL ,
[EXCEPTION_STACK_ID_] nvarchar(64) NULL ,
[EXCEPTION_MSG_] nvarchar(4000) NULL ,
[DUEDATE_] datetime NULL ,
[REPEAT_] nvarchar(255) NULL ,
[HANDLER_TYPE_] nvarchar(255) NULL ,
[HANDLER_CFG_] nvarchar(4000) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Records of ACT_RU_JOB
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_TASK]
GO
CREATE TABLE [dbo].[ACT_RU_TASK] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NULL ,
[PARENT_TASK_ID_] nvarchar(64) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[TASK_DEF_KEY_] nvarchar(255) NULL ,
[OWNER_] nvarchar(255) NULL ,
[ASSIGNEE_] nvarchar(255) NULL ,
[DELEGATION_] nvarchar(64) NULL ,
[PRIORITY_] int NULL ,
[CREATE_TIME_] datetime NULL ,
[DUE_DATE_] datetime NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[SUSPENSION_STATE_] int NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[FORM_KEY_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of ACT_RU_TASK
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_VARIABLE]
GO
CREATE TABLE [dbo].[ACT_RU_VARIABLE] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[TYPE_] nvarchar(255) NOT NULL ,
[NAME_] nvarchar(255) NOT NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[BYTEARRAY_ID_] nvarchar(64) NULL ,
[DOUBLE_] float(53) NULL ,
[LONG_] numeric(19) NULL ,
[TEXT_] nvarchar(4000) NULL ,
[TEXT2_] nvarchar(4000) NULL 
)


GO

-- ----------------------------
-- Records of ACT_RU_VARIABLE
-- ----------------------------


-- ----------------------------
-- Table structure for RS_Dictionary
-- ----------------------------
DROP TABLE [dbo].[RS_Dictionary]
GO
CREATE TABLE [dbo].[RS_Dictionary] (
[id] varchar(36) NOT NULL ,
[kind] varchar(255) NULL ,
[kindName] varchar(255) NULL ,
[code] varchar(255) NULL ,
[parentCode] varchar(255) NULL ,
[detail] varchar(255) NULL ,
[firstSpell] varchar(255) NULL ,
[isDeleted] bit NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Records of RS_Dictionary
-- ----------------------------
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'01b466c8-22af-4198-b4a4-fa1e1fb0e61a', N'sss', N'1', N'12122', N'', N'2ss', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'03d67dc6-9330-4a9c-8d73-583be3dfaee9', N'sqlx', N'申请类型', N'05', N'', N'破格申请', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'043A0FE5-DF46-4670-9D95-0940E9F1368B', N'xb', N'性别', N'5', N'', N'女性改（变）为男性 ', N'n', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'050308DE-5C50-4BE2-B161-7C9E3BCD85AC', N'mz', N'民族', N'25', N'', N'水族', N'sz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'05F80FE5-B2F4-4AE6-89B9-4AB1F0709090', N'hyzk', N'婚姻状况', N'22', null, N'再婚', N'zh', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'0b597d51-02e6-4fbc-acbe-a5df5e8bd147', N'sbjb', N'申报级别', N'02', N'', N'2级', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'0C46BEB2-772A-48D4-B8D8-7C97733F5E7E', N'mz', N'民族', N'10', N'', N'朝鲜族', N'cxz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'0dce696e-c8ea-4bf6-bba2-6e443533f83e', N'sbxl', N'申报序列', N'02', N'', N'序列2', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'0E4D95CB-5492-4AAE-9C25-FB58B75BF79D', N'mz', N'民族', N'08', N'', N'壮族', N'zz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'104C1233-5578-4752-BBD8-F7E38ED37D15', N'mz', N'民族', N'52', N'', N'鄂伦春族', N'elcz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'141ECAD8-0273-4D3D-B109-D5ED843628C7', N'mz', N'民族', N'54', N'', N'门巴族', N'mbz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'1580A809-A7DF-408A-AF8E-4482664FC7DB', N'mz', N'民族', N'41', N'', N'塔吉克族', N'tjkz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'16C2438D-52B3-486D-91B8-459FC9C21A73', N'mz', N'民族', N'31', N'', N'达斡尔族', N'dwez', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'21b1824e-d4d9-4c81-b3f2-8f9e3f80a4d5', N'sqlx', N'申请类型', N'02', N'', N'高一级认证', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2463473F-2389-460C-B8AD-407DD4C2983F', N'mz', N'民族', N'04', N'', N'藏族', N'zz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'24BA47D9-8716-4697-91CF-A55DAA4474B5', N'mz', N'民族', N'36', N'', N'毛难族', N'mnz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2A7708FB-1582-49EB-B081-E8C761383D6C', N'xb', N'性别', N'0', null, N'未知的性别', N'wzdxb', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2B5718E1-97B3-4F9F-B3D8-A7836761D31E', N'mz', N'民族', N'48', N'', N'裕固族', N'ygz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2BC6F795-4D41-4A9F-B98E-22AC91EBE318', N'mz', N'民族', N'18', N'', N'傣族', N'dz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2C25D787-85AC-4284-95FE-7F01B5EDD439', N'mz', N'民族', N'43', N'', N'乌孜别克族', N'wzbkz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2cc6dc73-7d1e-4db5-a534-056fa564fa4d', N'sbjb', N'申报级别', N'01', N'', N'1级', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2f232dfe-01ee-4936-9b32-72baafa4fddb', N'sds', N'123sd', N'ss', N'', N'ss', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'2F9232C9-9619-4B5D-97FC-04D334F346F2', N'mz', N'民族', N'28', N'', N'景颇族', N'jpz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'3704DA27-522F-41AA-A161-7F049974C13E', N'mz', N'民族', N'42', N'', N'怒族', N'nz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'38176C41-1C64-4BBA-9577-C4FAB2508E3C', N'hyzk', N'婚姻状况', N'23', null, N'复婚', N'fh', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'3A7FED5E-06BA-42F2-8F31-8EBA4DF288F8', N'hyzk', N'婚姻状况', N'21', null, N'初婚', N'ch', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'3B420ADB-3EF9-40CB-B963-307F2C85CA04', N'mz', N'民族', N'35', N'', N'撒拉族', N'slz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'3DD40F74-345A-44DA-BBFC-6369AE8930ED', N'hyzk', N'婚姻状况', N'30', null, N'丧偶', N'so', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'440D7AFC-90A1-476F-A8E2-6004941B16FA', N'hyzk', N'婚姻状况', N'90', null, N'未说明的婚姻', N'wsmdhy', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'47CE9D20-4F2A-4D2C-9A80-ED4F10DC2542', N'mz', N'民族', N'12', N'', N'侗族', N'tz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'4A032038-A34E-43A3-8C08-06F182A74BEB', N'xb', N'性别', N'9', null, N'未说明的性别', N'wsmdxb', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'4CFE4BF3-B5C6-445A-9656-A9AD5AD01AFB', N'mz', N'民族', N'20', N'', N'傈僳族', N'lsz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'4EC316EE-9479-46FE-AE4D-72A01BA6D345', N'mz', N'民族', N'02', N'', N'蒙古族', N'mgz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'4fe5d4db-bc2b-431f-b8dc-b1ad543f3e04', N'sqlx', N'申请类型', N'04', N'', N'复核', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'50BC9462-BFDA-494F-A19C-F07C4CA1B632', N'mz', N'民族', N'05', N'', N'维吾尔族', N'wwez', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'514889f6-3c74-40f0-83c1-216fc88dcbdc', N'sbxl', N'申报序列', N'03', N'', N'序列3', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'51E6C889-F786-48CD-B83A-72633399A38E', N'mz', N'民族', N'21', N'', N'佤族', N'wz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'5CBED232-449E-4C0A-867A-3CE1EC2A085D', N'hyzk', N'婚姻状况', N'10', N'', N'未婚', N'wh', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'5d8ccaab-dc9c-446e-b402-b51492558f2d', N'22', N'2', N'22', N'', N'22', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'5fb7c5d0-7347-4e91-a177-36f265b6cb5d', N'222', N'222', N'22', N'', N'121', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'61B1B85E-2DA2-4BD1-964D-2AB6E1382666', N'mz', N'民族', N'39', N'', N'阿昌族', N'acz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'6b2cacc6-db86-42a3-9a58-b0ee5eb05cee', N'abilitykind', N'能力类别', N'10', N'', N'后端开发能力类别', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'6c954aad-8998-4c50-a02c-b811d4f339c0', N'zzmm', N'政治面貌', N'03', null, N'共青团员', N'gqty', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'6ceb52da-a26c-449e-b045-39ed46f2ab62', N'2', N'12', N'1', N'10', N'1', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'708cb3dc-e94b-4705-881e-6b060d7cc30e', N'1212', N'1212', N'222', N'121212', N'11s', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'70CADC0D-63EE-4E41-9EDF-7EA2A4FC6575', N'mz', N'民族', N'44', N'', N'俄罗斯族', N'elsz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'71e3b57f-0732-4ab0-a2cb-7061ec7e586b', N'formula', N'计算公式', N'gohighandlow', N'', N'去高低', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'73B3DECE-895E-4BE7-972B-A42070D5B17F', N'mz', N'民族', N'11', N'', N'满族', N'mz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'74AE40FF-DB83-4664-94BB-F1312CD5BF63', N'mz', N'民族', N'55', N'', N'珞巴族', N'lbz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'7AC2FA0F-7906-45A2-BBCA-2015F4D0C190', N'mz', N'民族', N'14', N'', N'白族', N'bz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'7DF14AB8-FDCA-42F0-A5CC-136DCAC27764', N'mz', N'民族', N'09', N'', N'布依族', N'byz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'7ed80291-4c0f-4cba-b591-64bda0c17b17', N'ss', N'cee', N'ss', N'', N'ss', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'80d7b8d9-9ade-465d-b67c-107ed8122015', N'1212', N'1', N'12sss', N'', N'saaa', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'81843EE2-B24A-4DC4-9DEF-E5F213B237BE', N'mz', N'民族', N'27', N'', N'纳西族', N'nxz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'88FA2B3F-014D-4CA2-B5C3-3BEE2776746B', N'mz', N'民族', N'50', N'', N'塔塔尔族', N'ttez', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'8AA90C5E-B57C-4F34-A23E-5547A668C09E', N'mz', N'民族', N'45', N'', N'鄂温克族', N'ewkz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'8B4EE804-54F3-4211-9AC2-5E0141D78F30', N'mz', N'民族', N'37', N'', N'仡佬族', N'glz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'8C849390-2D3E-427B-A0DA-4F59944A5251', N'mz', N'民族', N'56', N'', N'基诺族', N'jnz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'8ed6843f-ebfd-4055-909d-784dcc0f09b6', N'abilitykind', N'能力类别', N'11', N'', N'前端开发能力类别', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'91bdaae9-edb6-42e3-8bdc-278217a253f1', N'sqlx', N'申请类型', N'01', N'', N'平级认证', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'97FBF679-6F72-430D-9DA1-8824297E9F02', N'mz', N'民族', N'06', N'', N'苗族', N'mz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'995EFA56-CF5A-4AD4-8BC2-CBB8B881FB29', N'mz', N'民族', N'17', N'', N'哈萨克族', N'hskz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'9C6B8010-504C-406F-AFCB-DEECF900CF38', N'hyzk', N'婚姻状况', N'40', null, N'离婚', N'lh', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'9c7133c4-32fb-4f75-a950-e064b25770da', N'2', N'2', N'zz', N'10', N'zz', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'9DF4682D-7222-459E-827B-CBB0215DBBF8', N'mz', N'民族', N'19', N'', N'黎族', N'lz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'A0CC97A2-55D5-4ED8-B9BE-0CC60D5B9FAB', N'mz', N'民族', N'53', N'', N'赫哲族', N'hzz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'a12ba0e8-6ea7-43e0-8051-2a05435563e3', N'sqlx', N'申请类型', N'03', N'', N'跨序列认证', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'A29AC124-ACEE-4924-AE47-22938A7892A7', N'mz', N'民族', N'38', N'', N'锡伯族', N'xbz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'A3479513-C54A-49D6-875F-CE755CC63B0A', N'mz', N'民族', N'15', N'', N'土家族', N'tjz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'A3FB469B-D01C-4B13-8A2D-E0786DDEA048', N'mz', N'民族', N'32', N'', N'仫佬族', N'mlz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'A445D80F-9AEE-45E8-8E04-4CC0D6B63509', N'mz', N'民族', N'33', N'', N'羌族', N'qz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'a871c55f-83d7-4fdd-bb64-a475a47d8f3d', N'zzmm', N'政治面貌', N'01', N'', N'中共党员', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'A891B06C-42D3-4CDD-88E6-B92BA4E69CD1', N'mz', N'民族', N'46', N'', N'崩龙族', N'blz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'aa6c502c-bee7-4b7b-ac3e-78f95a88acac', N'12', N'11', N'1', N'', N'12', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'b03f02fa-409e-4dec-b07a-3d4fc9c23151', N'sbjb', N'申报级别', N'03', N'', N'3级', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'B0911F9D-4568-4B29-B101-057773D07F29', N'mz', N'民族', N'49', N'', N'京族', N'jz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'B09D5B12-C717-4427-8461-AC553A9051F3', N'mz', N'民族', N'13', N'', N'瑶族', N'yz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'b0f41d94-de62-436d-9e8c-00870aae42d4', N'formula', N'计算公式', N'average', N'', N'平均', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'B207F18C-342E-4D23-BD74-459C454A6681', N'xb', N'性别', N'2', N'', N'女', N'n', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'b94f39d2-13e4-4182-b737-cc501919f5f1', N'test', N'test', N'test', N'', N'test', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'ba0a237d-39b5-4ef1-b46c-9ff76562c0c0', N'1', N'1', N'1', N'', N'1', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'BA12151F-42DA-4C25-8ADF-21A6A53CDEAE', N'mz', N'民族', N'51', N'', N'独龙族', N'dlz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'BBB23B31-8E48-46F4-84DF-90A78461481E', N'mz', N'民族', N'34', N'', N'布朗族', N'blz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'BBBAF787-B07E-450D-88C4-F0D405F9E1A3', N'mz', N'民族', N'47', N'', N'保安族', N'baz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'BD67E723-7B27-477B-AFB9-CFE005C5119D', N'mz', N'民族', N'30', N'', N'土族', N'tz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'C1D3DBBD-FA30-4672-8997-F3551297A418', N'mz', N'民族', N'24', N'', N'拉祜族', N'lhz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'c3c6395a-2f40-4128-9a28-72eb60e6594d', N'sbxl', N'申报序列', N'01', N'', N'序列1', null, N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'C3F0F9CA-7B07-4AEB-BBC6-567A65D3A1D4', N'mz', N'民族', N'03', N'', N'回族', N'hz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'c7eab91b-4c60-437f-b663-fe249697d452', N'qw', N'qqw', N'qw', N'', N'qw', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'CA131916-4A58-44CD-B0E4-8A57BBD42786', N'mz', N'民族', N'16', N'', N'哈尼族', N'hnz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'ca85678f-6674-43ba-8c7e-44b934068a1d', N'12sas', N'222', N'sdd', N'', N'ddd', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'D1D75078-6B37-4A7F-98A6-AC950900CFCF', N'mz', N'民族', N'26', N'', N'东乡族', N'dxz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'D206A944-9227-41CC-9A0B-6A5F2D3358D9', N'mz', N'民族', N'23', N'', N'高山族', N'gsz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'D33E687D-9DF1-4240-9AC9-6EFC11A557C0', N'mz', N'民族', N'01', null, N'汉族', N'hz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'd9d76aeb-0819-46b1-abbf-b0b90a86e57e', null, null, null, N'', null, null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'DC5EA570-F188-470E-B4F9-D558B8F2F4D4', N'mz', N'民族', N'29', N'', N'柯尔克孜族', N'kekzz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'e1cabc75-d4d6-4d13-8886-12a31a1034cd', N'66', N'66', N'66', N'', N'66', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'e38d19f9-09be-4f1b-a46a-31fa3ceb14f0', N'66', N'66', N'66', N'66', N'66', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'E506D0D0-EB24-4164-9CEF-08D1074A679A', N'xb', N'性别', N'6', N'', N'男性改（变）为女性 ', N'n', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'EBA87C35-5740-48BA-8080-AA5F5B20F8C1', N'mz', N'民族', N'40', N'', N'普米族', N'pmz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'EDF88DDC-4AD6-4BF6-A586-8B2CB5D0E3CD', N'mz', N'民族', N'22', N'', N'畲族', N'sz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'EE4366BD-47C4-4FB5-8E08-077EA312C987', N'mz', N'民族', N'07', N'', N'彝族', N'yz', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'f9fe2c1f-bd94-4bfa-bf1b-e36f26e9d117', N'1212', N'131121', N'1212', N'', N'2112', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'FACBE032-FF49-4FB6-AEC0-09018B37E8CF', N'xb', N'性别', N'1', null, N'男', N'n', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'fe1bfa52-70f2-4732-8a19-4a32394b4902', N'zzmm', N'政治面貌', N'02', null, N'中共预备党员', N'zgybdy', N'0')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'fe29ae11-3da8-4a6b-a466-d43d27962241', N'12', N'12', N'121212', N'', N'1212', null, N'1')
GO
GO
INSERT INTO [dbo].[RS_Dictionary] ([id], [kind], [kindName], [code], [parentCode], [detail], [firstSpell], [isDeleted]) VALUES (N'FFDA0292-39B2-458C-B1F2-140AD91212E3', N'hyzk', N'婚姻状况', N'20', null, N'已婚', N'yh', N'0')
GO
GO

-- ----------------------------
-- Table structure for RS_Organization
-- ----------------------------
DROP TABLE [dbo].[RS_Organization]
GO
CREATE TABLE [dbo].[RS_Organization] (
[Id] uniqueidentifier NOT NULL ,
[DateTimeCreated] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[DateTimeModified] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[Depth] int NULL ,
[Description] nvarchar(1000) NULL ,
[DisplayName] nvarchar(255) NULL ,
[IsDeleted] bit NOT NULL DEFAULT ((0)) ,
[Name] nvarchar(255) NOT NULL ,
[Ordinal] int NOT NULL ,
[ParentId] uniqueidentifier NULL ,
[Path] nvarchar(1000) NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) ,
[TypeId] uniqueidentifier NOT NULL ,
[ExtensionData] nvarchar(2048) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_Organization]', RESEED, 1105)
GO

-- ----------------------------
-- Records of RS_Organization
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_Organization] ON
GO
INSERT INTO [dbo].[RS_Organization] ([Id], [DateTimeCreated], [DateTimeModified], [Depth], [Description], [DisplayName], [IsDeleted], [Name], [Ordinal], [ParentId], [Path], [Sn], [TypeId], [ExtensionData]) VALUES (N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'2017-09-19 14:48:41.2270000', N'2017-09-19 14:48:41.2270000', N'1', null, N'科技部', N'0', N'科技部', N'0', N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'ucpro.net/组织/1/科技部', N'1102', N'00000000-0000-0000-0000-000000000000', null)
GO
GO
INSERT INTO [dbo].[RS_Organization] ([Id], [DateTimeCreated], [DateTimeModified], [Depth], [Description], [DisplayName], [IsDeleted], [Name], [Ordinal], [ParentId], [Path], [Sn], [TypeId], [ExtensionData]) VALUES (N'62A33F67-6954-4FD3-AA79-89160213DF36', N'2017-09-25 16:45:28.9890000', N'2017-09-25 16:45:28.9890000', N'1', null, N'事业部', N'0', N'事业部', N'0', N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'ucpro.net/组织/事业部', N'1103', N'00000000-0000-0000-0000-000000000000', null)
GO
GO
INSERT INTO [dbo].[RS_Organization] ([Id], [DateTimeCreated], [DateTimeModified], [Depth], [Description], [DisplayName], [IsDeleted], [Name], [Ordinal], [ParentId], [Path], [Sn], [TypeId], [ExtensionData]) VALUES (N'4E55C098-6D96-4581-87D9-8FE7A5844ED3', N'2017-10-09 17:42:50.7460000', N'2017-10-09 17:42:50.7460000', N'1', null, N'测试部', N'1', N'测试部', N'0', N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'ucpro.net/组织/测试部', N'1105', N'00000000-0000-0000-0000-000000000000', null)
GO
GO
INSERT INTO [dbo].[RS_Organization] ([Id], [DateTimeCreated], [DateTimeModified], [Depth], [Description], [DisplayName], [IsDeleted], [Name], [Ordinal], [ParentId], [Path], [Sn], [TypeId], [ExtensionData]) VALUES (N'1EF5C113-44D8-4C69-846C-99C8EB129937', N'2017-09-27 11:26:37.7810000', N'2017-09-27 11:26:37.7810000', N'1', null, N'序列小组', N'0', N'序列小组', N'0', N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'ucpro.net/组织/序列小组', N'1104', N'00000000-0000-0000-0000-000000000000', null)
GO
GO
INSERT INTO [dbo].[RS_Organization] ([Id], [DateTimeCreated], [DateTimeModified], [Depth], [Description], [DisplayName], [IsDeleted], [Name], [Ordinal], [ParentId], [Path], [Sn], [TypeId], [ExtensionData]) VALUES (N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'2017-09-19 14:45:47.0000000', N'2017-09-19 14:45:49.0000000', N'0', null, N'组织', N'0', N'组织', N'0', null, N'ucpro.net/组织', N'1101', N'00000000-0000-0000-0000-000000000000', null)
GO
GO
SET IDENTITY_INSERT [dbo].[RS_Organization] OFF
GO

-- ----------------------------
-- Table structure for RS_OrganizationDepth
-- ----------------------------
DROP TABLE [dbo].[RS_OrganizationDepth]
GO
CREATE TABLE [dbo].[RS_OrganizationDepth] (
[ParentId] uniqueidentifier NOT NULL ,
[ChildId] uniqueidentifier NOT NULL ,
[ParentDepth] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) ,
[ParentTypeId] uniqueidentifier NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000') ,
[ChildDepth] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_OrganizationDepth]', RESEED, 1011)
GO

-- ----------------------------
-- Records of RS_OrganizationDepth
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_OrganizationDepth] ON
GO
INSERT INTO [dbo].[RS_OrganizationDepth] ([ParentId], [ChildId], [ParentDepth], [Sn], [ParentTypeId], [ChildDepth]) VALUES (N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'1', N'1005', N'00000000-0000-0000-0000-000000000000', N'1')
GO
GO
INSERT INTO [dbo].[RS_OrganizationDepth] ([ParentId], [ChildId], [ParentDepth], [Sn], [ParentTypeId], [ChildDepth]) VALUES (N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'0', N'1004', N'00000000-0000-0000-0000-000000000000', N'1')
GO
GO
INSERT INTO [dbo].[RS_OrganizationDepth] ([ParentId], [ChildId], [ParentDepth], [Sn], [ParentTypeId], [ChildDepth]) VALUES (N'62A33F67-6954-4FD3-AA79-89160213DF36', N'62A33F67-6954-4FD3-AA79-89160213DF36', N'1', N'1007', N'00000000-0000-0000-0000-000000000000', N'1')
GO
GO
INSERT INTO [dbo].[RS_OrganizationDepth] ([ParentId], [ChildId], [ParentDepth], [Sn], [ParentTypeId], [ChildDepth]) VALUES (N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'62A33F67-6954-4FD3-AA79-89160213DF36', N'0', N'1006', N'00000000-0000-0000-0000-000000000000', N'1')
GO
GO
INSERT INTO [dbo].[RS_OrganizationDepth] ([ParentId], [ChildId], [ParentDepth], [Sn], [ParentTypeId], [ChildDepth]) VALUES (N'1EF5C113-44D8-4C69-846C-99C8EB129937', N'1EF5C113-44D8-4C69-846C-99C8EB129937', N'1', N'1009', N'00000000-0000-0000-0000-000000000000', N'1')
GO
GO
INSERT INTO [dbo].[RS_OrganizationDepth] ([ParentId], [ChildId], [ParentDepth], [Sn], [ParentTypeId], [ChildDepth]) VALUES (N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'1EF5C113-44D8-4C69-846C-99C8EB129937', N'0', N'1008', N'00000000-0000-0000-0000-000000000000', N'1')
GO
GO
INSERT INTO [dbo].[RS_OrganizationDepth] ([ParentId], [ChildId], [ParentDepth], [Sn], [ParentTypeId], [ChildDepth]) VALUES (N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'F24FB3B0-CE54-4E87-B524-CEF637F7C2A9', N'0', N'285', N'00000000-0000-0000-0000-000000000000', N'0')
GO
GO
SET IDENTITY_INSERT [dbo].[RS_OrganizationDepth] OFF
GO

-- ----------------------------
-- Table structure for RS_OrganizationType
-- ----------------------------
DROP TABLE [dbo].[RS_OrganizationType]
GO
CREATE TABLE [dbo].[RS_OrganizationType] (
[Id] uniqueidentifier NOT NULL ,
[DateTimeCreated] datetime2(7) NOT NULL ,
[DateTimeModified] datetime2(7) NOT NULL ,
[DisplayName] nvarchar(255) NULL ,
[IsDeleted] bit NOT NULL ,
[Name] nvarchar(255) NULL ,
[Ordinal] int NOT NULL 
)


GO

-- ----------------------------
-- Records of RS_OrganizationType
-- ----------------------------
INSERT INTO [dbo].[RS_OrganizationType] ([Id], [DateTimeCreated], [DateTimeModified], [DisplayName], [IsDeleted], [Name], [Ordinal]) VALUES (N'00000000-0000-0000-0000-000000000000', N'2017-06-07 15:41:25.2770000', N'2017-06-07 15:41:25.2770000', N'默认', N'0', N'Default', N'0')
GO
GO
INSERT INTO [dbo].[RS_OrganizationType] ([Id], [DateTimeCreated], [DateTimeModified], [DisplayName], [IsDeleted], [Name], [Ordinal]) VALUES (N'00000000-0000-0000-0000-000000000001', N'2017-06-07 15:41:25.2800000', N'2017-06-07 15:41:25.2800000', N'公司', N'0', N'Company', N'0')
GO
GO
INSERT INTO [dbo].[RS_OrganizationType] ([Id], [DateTimeCreated], [DateTimeModified], [DisplayName], [IsDeleted], [Name], [Ordinal]) VALUES (N'00000000-0000-0000-0000-000000000002', N'2017-06-07 15:41:25.2800000', N'2017-06-07 15:41:25.2800000', N'部门', N'0', N'Department', N'0')
GO
GO

-- ----------------------------
-- Table structure for RS_OrganizationUser
-- ----------------------------
DROP TABLE [dbo].[RS_OrganizationUser]
GO
CREATE TABLE [dbo].[RS_OrganizationUser] (
[OrganizationId] uniqueidentifier NOT NULL ,
[UserId] uniqueidentifier NOT NULL ,
[ExtensionData] nvarchar(MAX) NULL ,
[IsPrincipal] bit NOT NULL DEFAULT ((1)) ,
[Ordinal] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_OrganizationUser]', RESEED, 3778)
GO

-- ----------------------------
-- Records of RS_OrganizationUser
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_OrganizationUser] ON
GO
INSERT INTO [dbo].[RS_OrganizationUser] ([OrganizationId], [UserId], [ExtensionData], [IsPrincipal], [Ordinal], [Sn]) VALUES (N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'6DBB3F15-85A8-4367-88F0-0614A6037663', null, N'1', N'0', N'3777')
GO
GO
INSERT INTO [dbo].[RS_OrganizationUser] ([OrganizationId], [UserId], [ExtensionData], [IsPrincipal], [Ordinal], [Sn]) VALUES (N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'2EBDB863-BA95-439A-A1D1-07F9A8D06AF6', null, N'1', N'0', N'3778')
GO
GO
INSERT INTO [dbo].[RS_OrganizationUser] ([OrganizationId], [UserId], [ExtensionData], [IsPrincipal], [Ordinal], [Sn]) VALUES (N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'D6C587E5-D527-4750-874B-66049BE16730', null, N'1', N'0', N'3774')
GO
GO
INSERT INTO [dbo].[RS_OrganizationUser] ([OrganizationId], [UserId], [ExtensionData], [IsPrincipal], [Ordinal], [Sn]) VALUES (N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', null, N'1', N'0', N'3766')
GO
GO
INSERT INTO [dbo].[RS_OrganizationUser] ([OrganizationId], [UserId], [ExtensionData], [IsPrincipal], [Ordinal], [Sn]) VALUES (N'62A33F67-6954-4FD3-AA79-89160213DF36', N'9F384FA6-4727-4BC6-B611-DAE615D90051', null, N'1', N'0', N'3775')
GO
GO
INSERT INTO [dbo].[RS_OrganizationUser] ([OrganizationId], [UserId], [ExtensionData], [IsPrincipal], [Ordinal], [Sn]) VALUES (N'1EF5C113-44D8-4C69-846C-99C8EB129937', N'1350273F-749D-46FE-A136-BAB89E49C33D', null, N'1', N'0', N'3776')
GO
GO
SET IDENTITY_INSERT [dbo].[RS_OrganizationUser] OFF
GO

-- ----------------------------
-- Table structure for RS_Permission
-- ----------------------------
DROP TABLE [dbo].[RS_Permission]
GO
CREATE TABLE [dbo].[RS_Permission] (
[Id] uniqueidentifier NOT NULL ,
[DateTimeCreated] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[DateTimeModified] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[Description] nvarchar(1000) NULL ,
[IsDeleted] bit NOT NULL DEFAULT ((0)) ,
[IsInheritEnabled] bit NOT NULL DEFAULT ((0)) ,
[ItemGuid] uniqueidentifier NULL ,
[ItemID] int NULL ,
[PermissionLevelId] uniqueidentifier NULL ,
[PermissionRefID] int NOT NULL ,
[PermissionResourceId] uniqueidentifier NOT NULL ,
[PrincipalId] uniqueidentifier NULL ,
[PrincipalRefID] int NULL ,
[PrincipalType] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) 
)


GO

-- ----------------------------
-- Records of RS_Permission
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_Permission] ON
GO
SET IDENTITY_INSERT [dbo].[RS_Permission] OFF
GO

-- ----------------------------
-- Table structure for RS_PermissionLevel
-- ----------------------------
DROP TABLE [dbo].[RS_PermissionLevel]
GO
CREATE TABLE [dbo].[RS_PermissionLevel] (
[Id] uniqueidentifier NOT NULL ,
[Code] nvarchar(255) NULL ,
[DateTimeCreated] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[DateTimeModified] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[Description] nvarchar(255) NULL ,
[IsDeleted] bit NOT NULL DEFAULT ((0)) ,
[IsHidden] bit NOT NULL DEFAULT ((0)) ,
[MaskCode] bigint NOT NULL ,
[Name] nvarchar(255) NULL ,
[RefID] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) ,
[Source] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of RS_PermissionLevel
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_PermissionLevel] ON
GO
SET IDENTITY_INSERT [dbo].[RS_PermissionLevel] OFF
GO

-- ----------------------------
-- Table structure for RS_PermissionResource
-- ----------------------------
DROP TABLE [dbo].[RS_PermissionResource]
GO
CREATE TABLE [dbo].[RS_PermissionResource] (
[Id] uniqueidentifier NOT NULL ,
[DateTimeCreated] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[DateTimeModified] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[IsDeleted] bit NOT NULL DEFAULT ((0)) ,
[KeyType] int NOT NULL ,
[Name] nvarchar(255) NULL ,
[PermissionTable] nvarchar(255) NULL ,
[Sn] int NOT NULL IDENTITY(1,1) ,
[Type] int NOT NULL 
)


GO

-- ----------------------------
-- Records of RS_PermissionResource
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_PermissionResource] ON
GO
SET IDENTITY_INSERT [dbo].[RS_PermissionResource] OFF
GO

-- ----------------------------
-- Table structure for RS_resource
-- ----------------------------
DROP TABLE [dbo].[RS_resource]
GO
CREATE TABLE [dbo].[RS_resource] (
[id] varchar(36) NOT NULL ,
[name] varchar(100) NULL ,
[type] varchar(50) NULL ,
[url] varchar(200) NULL ,
[parent_id] varchar(36) NULL ,
[parent_ids] varchar(2000) NULL ,
[permission] varchar(100) NULL ,
[isdeleted] bit NULL DEFAULT ((0)) ,
[className] varchar(255) NULL ,
[orderNo] int NULL DEFAULT ((0)) 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'RS_resource', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'资源名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'资源名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'RS_resource', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型（菜单或按钮）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型（菜单或按钮）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'RS_resource', 
'COLUMN', N'url')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'url'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'url'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'RS_resource', 
'COLUMN', N'permission')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'permission'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'permission'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'RS_resource', 
'COLUMN', N'className')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单图标样式'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'className'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单图标样式'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'className'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'RS_resource', 
'COLUMN', N'orderNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'orderNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'RS_resource'
, @level2type = 'COLUMN', @level2name = N'orderNo'
GO

-- ----------------------------
-- Records of RS_resource
-- ----------------------------
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'0', N'根目录', N'root', null, null, null, null, N'0', null, null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'0727587C-5BBD-41E6-83DC-9A549C588E2A', N'申请删除', N'button', N'', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C', N'/0/1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5/FF123285-6FA7-4AE6-9251-68B2BB9EFA1C/', N'apply:delete', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'0B82C6A8-7410-4652-B8F9-85D14EDED3CC', N'申请新增', N'button', N'', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C', N'/0/1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5/FF123285-6FA7-4AE6-9251-68B2BB9EFA1C/', N'apply:add', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'0BE61246-D29C-4EF6-8087-CFA686EF3F3D', N'待我测评', N'menu', N'/model/efcheck/index?type=2', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06', N'/0/C8289E1A-394B-40E5-B88D-8F1AD55AAF06/', N'efcheck:view', N'0', N'fa fa-check-square', N'3')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'0E00CB97-9A5E-4B99-8CA8-8D1D992FA826', N'字典查看', N'button', N'', N'A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4/', N'dic:view', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'0F51AABE-9384-4BA2-9074-865445E89A45', N'字典修改', N'button', N'', N'A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4/', N'dic:update', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'0FCD859E-F865-467D-A8F0-42A89091FAEF', N'主页', N'menu', N'', N'0', N'/0FCD859E-F865-467D-A8F0-42A89091FAEF/', N'home:view', N'0', N'fa fa-home', N'1')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'170A8DB8-258F-4B6D-9F4E-637EFFF48D27', N'组织机构-新增', N'button', N'', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'org:add', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'174A28D2-E4D2-4425-9E31-8DA01D54CAF2', N'申请修改', N'button', N'', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C', N'/0/1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5/FF123285-6FA7-4AE6-9251-68B2BB9EFA1C/', N'apply:edit', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'179C4C7D-D04D-4F7D-92F1-6EFD5886BACD', N'人员管理-查看', N'button', N'', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'userManager:view', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'1C1B00F3-877F-4354-AA5A-07E0BBAE435E', N'我的能力', N'menu', N'/system/personal-settings/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'ps:add', N'1', N'fa fa-home', N'6')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5', N'申请与审核', N'menu', N'', N'0', N'/0/', N'apply:view', N'0', N'fa fa-paper-plane-o', N'3')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'24328A29-0719-4C08-8195-A51CD52D89BC', N'字典删除', N'button', N'', N'A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4/', N'dic:delete', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'27D2F7E5-9937-48CE-8D3C-619C56FDEAED', N'资源管理-查看', N'button', N'', N'45EA4F04-D23D-41AE-B147-1A5C81FDAB6A', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/45EA4F04-D23D-41AE-B147-1A5C81FDAB6A/', N'resource:view', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'32919A01-FB21-4E7F-BF4A-B4C571342325', N'待我审核', N'menu', N'/model/check/index', N'1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5', N'/0/1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5/', N'check:view', N'0', N'fa fa-check-square', N'2')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'3706E3B1-3AA1-404E-A0D5-23D2BF88C73B', N'角色-查看', N'button', N'', N'61D98765-B56C-4195-8804-3C633840A572', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/61D98765-B56C-4195-8804-3C633840A572/', N'role:view', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'3DA50EAA-CA46-4F50-8445-07AEA5E1E8A2', N'计划管理', N'menu', N'/system/plan/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'plan:view', N'0', N'fa fa-houzz', N'8')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'41CD901B-CADF-4DAA-8CF5-629524DD5A4E', N'人员-新增', N'button', N'', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'userManager:add', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'45EA4F04-D23D-41AE-B147-1A5C81FDAB6A', N'资源管理', N'menu', N'/system/resourceManager/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/45EA4F04-D23D-41AE-B147-1A5C81FDAB6A/', N'resource:index', N'0', N'fa fa-link', N'1')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'4806BCE2-F51D-49B7-BCB7-92D34815FBC1', N'成绩查询', N'button', N'', N'FFBAC66A-997A-4894-8FEA-D4E8367F13CA', N'/0/F306910C-56F0-42B5-BBF3-5058A265176A/FFBAC66A-997A-4894-8FEA-D4E8367F13CA/', N'exam:view', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'人员管理', N'menu', N'/system/orgManager/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'org:index', N'0', N'fa fa-user', N'3')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'4BD5805D-8BA5-4687-933C-6FD7CB91086D', N'测评表管理', N'menu', N'/system/base-evaluation/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'form:view', N'0', N'fa fa-table', N'6')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'562BEDE6-27D3-42A1-AACE-71EB4270FB36', N'流程管理', N'menu', N'/system/process/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'process:view', N'0', N'fa fa-houzz', N'9')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'61D98765-B56C-4195-8804-3C633840A572', N'角色管理', N'menu', N'/system/roleManager/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/61D98765-B56C-4195-8804-3C633840A572/', N'role:index', N'0', N'fa fa-user-secret', N'2')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'62E95C5E-F65C-414E-A585-361DE297C9D3', N'字典新增', N'button', N'', N'A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4/', N'dic:add', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'63E731F6-865D-4144-B287-DB811E993091', N'我的附件', N'menu', N'/model/myability/index', N'B1D0EACE-A323-47D3-B48B-66657540AB24', N'/0/B1D0EACE-A323-47D3-B48B-66657540AB24/', N'myability:view', N'0', N'fa fa-file', N'1')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'7B82E406-6871-46DB-B543-2096790B95FC', N'资源管理-删除', N'button', N'', N'45EA4F04-D23D-41AE-B147-1A5C81FDAB6A', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/45EA4F04-D23D-41AE-B147-1A5C81FDAB6A/', N'resource:delete', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'80121E0F-C13E-4CDC-88C5-7932603A61A9', N'组织机构-修改', N'button', N'', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'org:update', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'802CD610-79B1-4AC8-A0CA-4D56E6C2E850', N'系统日志', N'menu', N'/system/syslog/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'syslog:view', N'0', N'fa fa-home', N'5')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'8AEECF65-1A3F-4E22-959E-BC51B4083E77', N'能力管理', N'menu', N'/system/ability/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'ability:view', N'0', N'fa fa-thumbs-o-up', N'7')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'90A6E358-1E14-42C4-A8E7-CE9A515C6148', N'成绩新增', N'button', N'', N'FFBAC66A-997A-4894-8FEA-D4E8367F13CA', N'/0/F306910C-56F0-42B5-BBF3-5058A265176A/FFBAC66A-997A-4894-8FEA-D4E8367F13CA/', N'exam:add', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'925128DF-3C6D-48F6-B90E-5C458013F965', N'我的测评', N'menu', N'/model/evaluation/index', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06', N'/0/C8289E1A-394B-40E5-B88D-8F1AD55AAF06/', N'evaluationform:view', N'0', N'fa fa-list', N'1')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'98C7AEB1-0E41-4FDD-BACB-608B9DDF5C16', N'培训、考试', N'menu', N'', N'0', N'/0/', N'exam:view', N'1', N'fa fa-edit', N'4')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4', N'字典管理', N'menu', N'/system/dictionary/index', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'/0/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'dic:view', N'0', N'fa fa-book', N'4')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'A5503375-825E-44B0-ACCD-C2B29DBC44E9', N'成绩修改', N'button', N'', N'FFBAC66A-997A-4894-8FEA-D4E8367F13CA', N'/0/F306910C-56F0-42B5-BBF3-5058A265176A/FFBAC66A-997A-4894-8FEA-D4E8367F13CA/', N'exam:update', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'A78722B3-4046-4515-9C2C-D74FAD166CC7', N'角色-删除', N'button', N'', N'61D98765-B56C-4195-8804-3C633840A572', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/61D98765-B56C-4195-8804-3C633840A572/', N'role:delete', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'A9E28A3B-9412-4726-A8C6-43D0266400D1', N'资源管理-新增', N'button', N'', N'45EA4F04-D23D-41AE-B147-1A5C81FDAB6A', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/45EA4F04-D23D-41AE-B147-1A5C81FDAB6A/A9E28A3B-9412-4726-A8C6-43D0266400D1/', N'resource:add', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'AA5ECECB-4DB2-4806-A494-450AEFB65E2B', N'申请提交', N'button', N'', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C', N'/0/1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5/FF123285-6FA7-4AE6-9251-68B2BB9EFA1C/', N'apply:commit', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'AA8A7762-80E1-4A2C-8362-7A8787542435', N'待我审核', N'menu', N'/model/efcheck/index', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06', N'/0/C8289E1A-394B-40E5-B88D-8F1AD55AAF06/', N'efcheck:view', N'0', N'fa fa-check-square', N'2')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'ADA6EE1D-9E37-48CA-B071-DEB58E2F7BEF', N'home1', N'menu', N'/home', N'0FCD859E-F865-467D-A8F0-42A89091FAEF', N'/0FCD859E-F865-467D-A8F0-42A89091FAEF/ADA6EE1D-9E37-48CA-B071-DEB58E2F7BEF/', N'home:view', N'0', N'icon-bar-chart', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'B1D0EACE-A323-47D3-B48B-66657540AB24', N'个人设置', N'menu', N'', N'0', N'/0/', N'myability:view', N'0', N'fa fa-user', N'6')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'BB5331FB-E3BC-422D-A0CA-9498AA0D0768', N'组织机构-删除', N'button', N'', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'org:delete', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'C0639C22-DAA3-4F6C-AA6D-E92ADA2444DA', N'人员-修改', N'button', N'', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'userManager:update', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'C2220BDB-F54F-4424-993D-A532FC036A8B', N'角色-修改', N'button', N'', N'61D98765-B56C-4195-8804-3C633840A572', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/61D98765-B56C-4195-8804-3C633840A572/', N'role:update', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06', N'评测、复审', N'menu', N'', N'0', N'/0/', N'evaluationform：view', N'0', N'fa fa-pencil', N'5')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'DAC11104-D788-4609-BB1D-7115C4252393', N'成绩删除', N'menu', N'', N'FFBAC66A-997A-4894-8FEA-D4E8367F13CA', N'/0/F306910C-56F0-42B5-BBF3-5058A265176A/FFBAC66A-997A-4894-8FEA-D4E8367F13CA/', N'exam:delete', N'0', N'', N'0')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'DD7C0BB4-D508-42A4-89D2-663892FD8A02', N'角色-新增', N'button', N'', N'61D98765-B56C-4195-8804-3C633840A572', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/61D98765-B56C-4195-8804-3C633840A572/', N'role:add', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'E0231949-793B-4E1B-A50B-B3D53357F57B', N'资源管理-修改', N'button', N'', N'45EA4F04-D23D-41AE-B147-1A5C81FDAB6A', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/45EA4F04-D23D-41AE-B147-1A5C81FDAB6A/', N'resource:update', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B', N'系统管理', N'menu', N'', N'0', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/', N'org:view', N'0', N'fa fa-gears', N'2')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'F306910C-56F0-42B5-BBF3-5058A265176A', N'培训、考试', N'menu', N'', N'0', N'/0/', N'exam:view', N'0', N'fa fa-edit', N'4')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'F4F1E429-CC68-43CE-99E4-75ED29A85CB4', N'人员-删除', N'button', N'', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44', N'/EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B/4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44/', N'userManager:delete', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C', N'我的申请', N'menu', N'/model/apply/index', N'1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5', N'/0/1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5/', N'apply:view', N'0', N'fa fa-paper-plane-o', N'1')
GO
GO
INSERT INTO [dbo].[RS_resource] ([id], [name], [type], [url], [parent_id], [parent_ids], [permission], [isdeleted], [className], [orderNo]) VALUES (N'FFBAC66A-997A-4894-8FEA-D4E8367F13CA', N'成绩上报', N'menu', N'/system/exam/index', N'F306910C-56F0-42B5-BBF3-5058A265176A', N'/0/F306910C-56F0-42B5-BBF3-5058A265176A/', N'exam:view', N'0', N'fa fa-upload', N'1')
GO
GO

-- ----------------------------
-- Table structure for RS_Role
-- ----------------------------
DROP TABLE [dbo].[RS_Role]
GO
CREATE TABLE [dbo].[RS_Role] (
[Id] uniqueidentifier NOT NULL ,
[DateTimeCreated] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[DateTimeModified] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[Description] nvarchar(1000) NULL ,
[DisplayName] nvarchar(255) NULL ,
[IsBuiltin] bit NOT NULL DEFAULT ((0)) ,
[IsDeleted] bit NOT NULL DEFAULT ((0)) ,
[IsEnabled] bit NOT NULL DEFAULT ((1)) ,
[Name] nvarchar(255) NULL ,
[Ordinal] int NOT NULL ,
[OrganizationId] uniqueidentifier NULL ,
[Sn] int NOT NULL IDENTITY(1,1) ,
[TypeId] uniqueidentifier NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_Role]', RESEED, 35)
GO

-- ----------------------------
-- Records of RS_Role
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_Role] ON
GO
INSERT INTO [dbo].[RS_Role] ([Id], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [IsBuiltin], [IsDeleted], [IsEnabled], [Name], [Ordinal], [OrganizationId], [Sn], [TypeId]) VALUES (N'84DF9078-04CF-47C6-B112-377C3BCFA57B', N'2017-10-09 17:45:06.5230000', N'2017-10-09 17:45:06.5230000', N'', N'评分人', N'0', N'0', N'1', N'评分人', N'0', N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'35', N'00000000-0000-0000-0000-000000000001')
GO
GO
INSERT INTO [dbo].[RS_Role] ([Id], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [IsBuiltin], [IsDeleted], [IsEnabled], [Name], [Ordinal], [OrganizationId], [Sn], [TypeId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'2017-09-25 16:47:04.4830000', N'2017-09-25 16:47:04.4830000', N'', N'部门领导', N'0', N'0', N'1', N'部门领导', N'0', N'62A33F67-6954-4FD3-AA79-89160213DF36', N'33', N'00000000-0000-0000-0000-000000000001')
GO
GO
INSERT INTO [dbo].[RS_Role] ([Id], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [IsBuiltin], [IsDeleted], [IsEnabled], [Name], [Ordinal], [OrganizationId], [Sn], [TypeId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'2017-09-19 14:56:13.3770000', N'2017-09-19 14:56:13.3770000', N'部门领导角色', N'部门领导', N'0', N'0', N'1', N'部门领导', N'0', N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'32', N'00000000-0000-0000-0000-000000000001')
GO
GO
INSERT INTO [dbo].[RS_Role] ([Id], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [IsBuiltin], [IsDeleted], [IsEnabled], [Name], [Ordinal], [OrganizationId], [Sn], [TypeId]) VALUES (N'E8AFA54F-6ED6-4FC0-B446-C02493EB6CF9', N'2017-08-16 09:46:11.4300000', N'2017-08-16 09:46:11.4300000', N'主页权限', N'主页权限', N'0', N'0', N'1', N'主页权限', N'0', N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'30', N'00000000-0000-0000-0000-000000000000')
GO
GO
INSERT INTO [dbo].[RS_Role] ([Id], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [IsBuiltin], [IsDeleted], [IsEnabled], [Name], [Ordinal], [OrganizationId], [Sn], [TypeId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'2017-09-27 11:29:08.2070000', N'2017-09-27 11:29:08.2070000', N'', N'领导', N'0', N'0', N'1', N'领导', N'0', N'1EF5C113-44D8-4C69-846C-99C8EB129937', N'34', N'00000000-0000-0000-0000-000000000001')
GO
GO
INSERT INTO [dbo].[RS_Role] ([Id], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [IsBuiltin], [IsDeleted], [IsEnabled], [Name], [Ordinal], [OrganizationId], [Sn], [TypeId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'2017-08-14 17:29:26.5600000', N'2017-08-14 17:29:26.5600000', N'人员组织管理', N'超级管理员', N'0', N'0', N'1', N'超级管理员', N'0', N'F206A0BD-304A-4C2D-87D5-5E5ECD018853', N'28', N'00000000-0000-0000-0000-000000000000')
GO
GO
SET IDENTITY_INSERT [dbo].[RS_Role] OFF
GO

-- ----------------------------
-- Table structure for RS_RoleDepth
-- ----------------------------
DROP TABLE [dbo].[RS_RoleDepth]
GO
CREATE TABLE [dbo].[RS_RoleDepth] (
[ParentId] uniqueidentifier NOT NULL ,
[ChildId] uniqueidentifier NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_RoleDepth]', RESEED, 1001)
GO

-- ----------------------------
-- Records of RS_RoleDepth
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_RoleDepth] ON
GO
SET IDENTITY_INSERT [dbo].[RS_RoleDepth] OFF
GO

-- ----------------------------
-- Table structure for RS_RoleResource
-- ----------------------------
DROP TABLE [dbo].[RS_RoleResource]
GO
CREATE TABLE [dbo].[RS_RoleResource] (
[roleId] uniqueidentifier NOT NULL ,
[resourceId] uniqueidentifier NOT NULL 
)


GO

-- ----------------------------
-- Records of RS_RoleResource
-- ----------------------------
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'84DF9078-04CF-47C6-B112-377C3BCFA57B', N'925128DF-3C6D-48F6-B90E-5C458013F965')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'84DF9078-04CF-47C6-B112-377C3BCFA57B', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'84DF9078-04CF-47C6-B112-377C3BCFA57B', N'0BE61246-D29C-4EF6-8087-CFA686EF3F3D')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'0FCD859E-F865-467D-A8F0-42A89091FAEF')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'AA5ECECB-4DB2-4806-A494-450AEFB65E2B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'925128DF-3C6D-48F6-B90E-5C458013F965')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'AA8A7762-80E1-4A2C-8362-7A8787542435')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'0B82C6A8-7410-4652-B8F9-85D14EDED3CC')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'174A28D2-E4D2-4425-9E31-8DA01D54CAF2')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'0727587C-5BBD-41E6-83DC-9A549C588E2A')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'32919A01-FB21-4E7F-BF4A-B4C571342325')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'ADA6EE1D-9E37-48CA-B071-DEB58E2F7BEF')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'AA5ECECB-4DB2-4806-A494-450AEFB65E2B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'925128DF-3C6D-48F6-B90E-5C458013F965')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'AA8A7762-80E1-4A2C-8362-7A8787542435')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'0B82C6A8-7410-4652-B8F9-85D14EDED3CC')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'174A28D2-E4D2-4425-9E31-8DA01D54CAF2')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'0727587C-5BBD-41E6-83DC-9A549C588E2A')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'32919A01-FB21-4E7F-BF4A-B4C571342325')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'E8AFA54F-6ED6-4FC0-B446-C02493EB6CF9', N'0FCD859E-F865-467D-A8F0-42A89091FAEF')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'E8AFA54F-6ED6-4FC0-B446-C02493EB6CF9', N'ADA6EE1D-9E37-48CA-B071-DEB58E2F7BEF')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'0FCD859E-F865-467D-A8F0-42A89091FAEF')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'AA5ECECB-4DB2-4806-A494-450AEFB65E2B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'925128DF-3C6D-48F6-B90E-5C458013F965')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'AA8A7762-80E1-4A2C-8362-7A8787542435')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'0B82C6A8-7410-4652-B8F9-85D14EDED3CC')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'174A28D2-E4D2-4425-9E31-8DA01D54CAF2')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'0727587C-5BBD-41E6-83DC-9A549C588E2A')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'32919A01-FB21-4E7F-BF4A-B4C571342325')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'ADA6EE1D-9E37-48CA-B071-DEB58E2F7BEF')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'3DA50EAA-CA46-4F50-8445-07AEA5E1E8A2')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'45EA4F04-D23D-41AE-B147-1A5C81FDAB6A')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'7B82E406-6871-46DB-B543-2096790B95FC')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'3706E3B1-3AA1-404E-A0D5-23D2BF88C73B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'EEE1AE9C-DE24-4986-84E9-2ADCA2342C9B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'62E95C5E-F65C-414E-A585-361DE297C9D3')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'61D98765-B56C-4195-8804-3C633840A572')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'1DEB7C43-1F50-42FF-8EC3-420F6B40FEF5')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'A9E28A3B-9412-4726-A8C6-43D0266400D1')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'AA5ECECB-4DB2-4806-A494-450AEFB65E2B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'802CD610-79B1-4AC8-A0CA-4D56E6C2E850')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'F306910C-56F0-42B5-BBF3-5058A265176A')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'925128DF-3C6D-48F6-B90E-5C458013F965')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'27D2F7E5-9937-48CE-8D3C-619C56FDEAED')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'41CD901B-CADF-4DAA-8CF5-629524DD5A4E')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'170A8DB8-258F-4B6D-9F4E-637EFFF48D27')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'DD7C0BB4-D508-42A4-89D2-663892FD8A02')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'B1D0EACE-A323-47D3-B48B-66657540AB24')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'FF123285-6FA7-4AE6-9251-68B2BB9EFA1C')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'179C4C7D-D04D-4F7D-92F1-6EFD5886BACD')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'4BD5805D-8BA5-4687-933C-6FD7CB91086D')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'562BEDE6-27D3-42A1-AACE-71EB4270FB36')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'F4F1E429-CC68-43CE-99E4-75ED29A85CB4')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'80121E0F-C13E-4CDC-88C5-7932603A61A9')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'0B82C6A8-7410-4652-B8F9-85D14EDED3CC')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'0F51AABE-9384-4BA2-9074-865445E89A45')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'0E00CB97-9A5E-4B99-8CA8-8D1D992FA826')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'174A28D2-E4D2-4425-9E31-8DA01D54CAF2')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'C8289E1A-394B-40E5-B88D-8F1AD55AAF06')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'BB5331FB-E3BC-422D-A0CA-9498AA0D0768')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'0727587C-5BBD-41E6-83DC-9A549C588E2A')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'24328A29-0719-4C08-8195-A51CD52D89BC')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'C2220BDB-F54F-4424-993D-A532FC036A8B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'A09B67A1-9DA7-45CC-81B7-AC4A8DCF0CA4')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'4A5BCAE9-432C-4C46-ADE1-B3A5532CAC44')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'E0231949-793B-4E1B-A50B-B3D53357F57B')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'32919A01-FB21-4E7F-BF4A-B4C571342325')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'8AEECF65-1A3F-4E22-959E-BC51B4083E77')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'FFBAC66A-997A-4894-8FEA-D4E8367F13CA')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'A78722B3-4046-4515-9C2C-D74FAD166CC7')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'63E731F6-865D-4144-B287-DB811E993091')
GO
GO
INSERT INTO [dbo].[RS_RoleResource] ([roleId], [resourceId]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'C0639C22-DAA3-4F6C-AA6D-E92ADA2444DA')
GO
GO

-- ----------------------------
-- Table structure for RS_RoleRole
-- ----------------------------
DROP TABLE [dbo].[RS_RoleRole]
GO
CREATE TABLE [dbo].[RS_RoleRole] (
[ParentId] uniqueidentifier NOT NULL ,
[ChildId] uniqueidentifier NOT NULL ,
[Ordinal] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_RoleRole]', RESEED, 2006)
GO

-- ----------------------------
-- Records of RS_RoleRole
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_RoleRole] ON
GO
SET IDENTITY_INSERT [dbo].[RS_RoleRole] OFF
GO

-- ----------------------------
-- Table structure for RS_RoleType
-- ----------------------------
DROP TABLE [dbo].[RS_RoleType]
GO
CREATE TABLE [dbo].[RS_RoleType] (
[Id] uniqueidentifier NOT NULL ,
[DateTimeCreated] datetime2(7) NOT NULL ,
[DateTimeModified] datetime2(7) NOT NULL ,
[DisplayName] nvarchar(255) NULL ,
[IsDeleted] bit NOT NULL ,
[Name] nvarchar(255) NULL ,
[Ordinal] int NOT NULL ,
[Level] int NULL 
)


GO

-- ----------------------------
-- Records of RS_RoleType
-- ----------------------------
INSERT INTO [dbo].[RS_RoleType] ([Id], [DateTimeCreated], [DateTimeModified], [DisplayName], [IsDeleted], [Name], [Ordinal], [Level]) VALUES (N'00000000-0000-0000-0000-000000000000', N'2017-06-07 15:41:25.2800000', N'2017-06-07 15:41:25.2800000', N'默认', N'0', N'Default', N'0', null)
GO
GO
INSERT INTO [dbo].[RS_RoleType] ([Id], [DateTimeCreated], [DateTimeModified], [DisplayName], [IsDeleted], [Name], [Ordinal], [Level]) VALUES (N'00000000-0000-0000-0000-000000000001', N'2017-09-27 10:17:17.0000000', N'2017-09-27 10:17:19.0000000', N'领导', N'0', N'leader', N'0', null)
GO
GO

-- ----------------------------
-- Table structure for RS_RoleUser
-- ----------------------------
DROP TABLE [dbo].[RS_RoleUser]
GO
CREATE TABLE [dbo].[RS_RoleUser] (
[RoleId] uniqueidentifier NOT NULL ,
[UserId] uniqueidentifier NOT NULL ,
[Ordinal] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_RoleUser]', RESEED, 2127)
GO

-- ----------------------------
-- Records of RS_RoleUser
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_RoleUser] ON
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'84DF9078-04CF-47C6-B112-377C3BCFA57B', N'6DBB3F15-85A8-4367-88F0-0614A6037663', N'0', N'2126')
GO
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'84DF9078-04CF-47C6-B112-377C3BCFA57B', N'2EBDB863-BA95-439A-A1D1-07F9A8D06AF6', N'0', N'2127')
GO
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'9B785F63-55D3-4403-A019-5F216B1D75D1', N'9F384FA6-4727-4BC6-B611-DAE615D90051', N'0', N'2124')
GO
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'1FB7B45C-561C-4F9A-A8C1-7B1E08EC106D', N'D6C587E5-D527-4750-874B-66049BE16730', N'0', N'2123')
GO
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'E8AFA54F-6ED6-4FC0-B446-C02493EB6CF9', N'D6C587E5-D527-4750-874B-66049BE16730', N'0', N'2122')
GO
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'E8AFA54F-6ED6-4FC0-B446-C02493EB6CF9', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'0', N'2114')
GO
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'8970EE2C-0E6E-4388-950D-D395AA6C9810', N'1350273F-749D-46FE-A136-BAB89E49C33D', N'0', N'2125')
GO
GO
INSERT INTO [dbo].[RS_RoleUser] ([RoleId], [UserId], [Ordinal], [Sn]) VALUES (N'07E3CEC9-9EBB-42D8-B074-EBAAADA93A43', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'0', N'2113')
GO
GO
SET IDENTITY_INSERT [dbo].[RS_RoleUser] OFF
GO

-- ----------------------------
-- Table structure for RS_User
-- ----------------------------
DROP TABLE [dbo].[RS_User]
GO
CREATE TABLE [dbo].[RS_User] (
[Id] uniqueidentifier NOT NULL ,
[AccountName] nvarchar(255) NULL ,
[Birthday] datetime2(7) NULL ,
[DateTimeCreated] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[DateTimeModified] datetime2(7) NOT NULL DEFAULT (getdate()) ,
[Description] nvarchar(255) NULL ,
[DisplayName] nvarchar(255) NULL ,
[ExtensionData] nvarchar(255) NULL ,
[FirstName] nvarchar(255) NULL ,
[IdNumber] nvarchar(255) NULL ,
[IsDeleted] bit NOT NULL DEFAULT ((0)) ,
[IsEnabled] bit NOT NULL DEFAULT ((1)) ,
[LastName] nvarchar(255) NULL ,
[MiddleName] nvarchar(255) NULL ,
[Name] nvarchar(255) NULL ,
[Sex] int NULL ,
[Sn] int NOT NULL IDENTITY(1,1) ,
[Type] nvarchar(255) NULL ,
[WorkNumber] nvarchar(255) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_User]', RESEED, 1395)
GO

-- ----------------------------
-- Records of RS_User
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_User] ON
GO
INSERT INTO [dbo].[RS_User] ([Id], [AccountName], [Birthday], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [ExtensionData], [FirstName], [IdNumber], [IsDeleted], [IsEnabled], [LastName], [MiddleName], [Name], [Sex], [Sn], [Type], [WorkNumber]) VALUES (N'6DBB3F15-85A8-4367-88F0-0614A6037663', N'cpr1', null, N'2017-10-09 17:45:28.2300000', N'2017-10-09 17:45:28.2300000', null, N'cpr1', null, null, null, N'0', N'1', null, null, N'cpr1', null, N'1394', null, null)
GO
GO
INSERT INTO [dbo].[RS_User] ([Id], [AccountName], [Birthday], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [ExtensionData], [FirstName], [IdNumber], [IsDeleted], [IsEnabled], [LastName], [MiddleName], [Name], [Sex], [Sn], [Type], [WorkNumber]) VALUES (N'2EBDB863-BA95-439A-A1D1-07F9A8D06AF6', N'cpr2', null, N'2017-10-09 17:45:38.6800000', N'2017-10-09 17:45:38.6800000', null, N'cpr2', null, null, null, N'0', N'1', null, null, N'cpr2', null, N'1395', null, null)
GO
GO
INSERT INTO [dbo].[RS_User] ([Id], [AccountName], [Birthday], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [ExtensionData], [FirstName], [IdNumber], [IsDeleted], [IsEnabled], [LastName], [MiddleName], [Name], [Sex], [Sn], [Type], [WorkNumber]) VALUES (N'D6C587E5-D527-4750-874B-66049BE16730', N'test2', null, N'2017-08-21 11:11:02.1130000', N'2017-08-21 11:11:02.1130000', null, N'test2', null, null, null, N'0', N'1', null, null, N'test2', null, N'1386', null, null)
GO
GO
INSERT INTO [dbo].[RS_User] ([Id], [AccountName], [Birthday], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [ExtensionData], [FirstName], [IdNumber], [IsDeleted], [IsEnabled], [LastName], [MiddleName], [Name], [Sex], [Sn], [Type], [WorkNumber]) VALUES (N'1350273F-749D-46FE-A136-BAB89E49C33D', N'xlxz', null, N'2017-09-27 11:30:35.6770000', N'2017-09-27 11:30:35.6770000', null, N'xlxz', null, null, null, N'0', N'1', null, null, N'xlxz', null, N'1393', null, null)
GO
GO
INSERT INTO [dbo].[RS_User] ([Id], [AccountName], [Birthday], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [ExtensionData], [FirstName], [IdNumber], [IsDeleted], [IsEnabled], [LastName], [MiddleName], [Name], [Sex], [Sn], [Type], [WorkNumber]) VALUES (N'9F384FA6-4727-4BC6-B611-DAE615D90051', N'syb', null, N'2017-09-25 16:47:30.5000000', N'2017-09-25 16:47:30.5000000', null, N'syb', null, null, null, N'0', N'1', null, null, N'syb', null, N'1392', null, null)
GO
GO
INSERT INTO [dbo].[RS_User] ([Id], [AccountName], [Birthday], [DateTimeCreated], [DateTimeModified], [Description], [DisplayName], [ExtensionData], [FirstName], [IdNumber], [IsDeleted], [IsEnabled], [LastName], [MiddleName], [Name], [Sex], [Sn], [Type], [WorkNumber]) VALUES (N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', null, N'2017-08-16 17:37:42.2300000', N'2017-08-16 17:37:42.2300000', null, N'test', null, null, null, N'0', N'1', null, null, N'test', null, N'1382', null, null)
GO
GO
SET IDENTITY_INSERT [dbo].[RS_User] OFF
GO

-- ----------------------------
-- Table structure for RS_UserAvatar
-- ----------------------------
DROP TABLE [dbo].[RS_UserAvatar]
GO
CREATE TABLE [dbo].[RS_UserAvatar] (
[Id] uniqueidentifier NOT NULL ,
[AvatarData] varbinary(4000) NULL ,
[AvatarType] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) ,
[UserId] uniqueidentifier NOT NULL 
)


GO

-- ----------------------------
-- Records of RS_UserAvatar
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_UserAvatar] ON
GO
SET IDENTITY_INSERT [dbo].[RS_UserAvatar] OFF
GO

-- ----------------------------
-- Table structure for RS_UserPrincipal
-- ----------------------------
DROP TABLE [dbo].[RS_UserPrincipal]
GO
CREATE TABLE [dbo].[RS_UserPrincipal] (
[UserId] uniqueidentifier NOT NULL ,
[PrincipalId] uniqueidentifier NOT NULL ,
[Type] int NOT NULL ,
[Sn] int NOT NULL IDENTITY(1,1) 
)


GO
DBCC CHECKIDENT(N'[dbo].[RS_UserPrincipal]', RESEED, 1001)
GO

-- ----------------------------
-- Records of RS_UserPrincipal
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RS_UserPrincipal] ON
GO
SET IDENTITY_INSERT [dbo].[RS_UserPrincipal] OFF
GO

-- ----------------------------
-- Table structure for RS_userProfile
-- ----------------------------
DROP TABLE [dbo].[RS_userProfile]
GO
CREATE TABLE [dbo].[RS_userProfile] (
[ID] uniqueidentifier NOT NULL ,
[IDNO] varchar(18) NULL ,
[type] varchar(36) NULL ,
[name] varchar(100) NULL ,
[sex] varchar(36) NULL ,
[birthday] varchar(12) NULL ,
[phoneNo] varchar(50) NULL ,
[maritalStatus] varchar(36) NULL ,
[nation] varchar(36) NULL ,
[nativePlace] varchar(36) NULL ,
[education] varchar(36) NULL ,
[school] varchar(36) NULL ,
[special] varchar(36) NULL ,
[currenteducation] varchar(36) NULL ,
[currentschool] varchar(36) NULL ,
[currentspecial] varchar(36) NULL ,
[title] varchar(36) NULL ,
[duty] varchar(36) NULL ,
[address] varchar(200) NULL ,
[TimeToWork] varchar(12) NULL ,
[portrait] varchar(200) NULL ,
[workContent] varchar(4000) NULL ,
[politicalStatus] varchar(36) NULL ,
[joinPartyTime] varchar(12) NULL ,
[note] varchar(500) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[deleteflag] varchar(2) NULL 
)


GO

-- ----------------------------
-- Records of RS_userProfile
-- ----------------------------
INSERT INTO [dbo].[RS_userProfile] ([ID], [IDNO], [type], [name], [sex], [birthday], [phoneNo], [maritalStatus], [nation], [nativePlace], [education], [school], [special], [currenteducation], [currentschool], [currentspecial], [title], [duty], [address], [TimeToWork], [portrait], [workContent], [politicalStatus], [joinPartyTime], [note], [DateTimeCreated], [DateTimeModified], [deleteflag]) VALUES (N'D6C587E5-D527-4750-874B-66049BE16730', N'12', N'0', N'test2', N'1', N'2017-08-02', N'13578945612', N'', N'', N'', N'0', N'0', N'0', null, null, null, N'0', N'0', N'', null, N'Portrait/bd468f14-e44d-429d-8fd3-9894ff49a1bd.jpg', N'', N'0', N'2017-08-25', N'', N'2017-08-25 15:02:45.540', N'2017-08-24 14:47:06.270', null)
GO
GO
INSERT INTO [dbo].[RS_userProfile] ([ID], [IDNO], [type], [name], [sex], [birthday], [phoneNo], [maritalStatus], [nation], [nativePlace], [education], [school], [special], [currenteducation], [currentschool], [currentspecial], [title], [duty], [address], [TimeToWork], [portrait], [workContent], [politicalStatus], [joinPartyTime], [note], [DateTimeCreated], [DateTimeModified], [deleteflag]) VALUES (N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'511324', N'0', N'test', N'0', N'2017-08-04', N'13578945612', N'20', N'01', N'', N'0', N'0', N'0', null, null, null, N'0', N'', N'居住地址', null, N'group1/M00/00/00/wKgUFVm4_zSAT8QaAABTaXFMRho714.jpg', N'从事工作', N'0', N'2017-09-07', N'备注 2', N'2017-09-13 17:49:33.180', N'2017-08-25 11:04:33.010', null)
GO
GO

-- ----------------------------
-- Table structure for RS_UserResume
-- ----------------------------
DROP TABLE [dbo].[RS_UserResume]
GO
CREATE TABLE [dbo].[RS_UserResume] (
[ID] uniqueidentifier NOT NULL ,
[education] varchar(MAX) NULL ,
[WorkResume] varchar(MAX) NULL ,
[speciality] varchar(MAX) NULL ,
[honor] varchar(MAX) NULL ,
[programme] varchar(MAX) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL 
)


GO

-- ----------------------------
-- Records of RS_UserResume
-- ----------------------------

-- ----------------------------
-- Table structure for sys_ability
-- ----------------------------
DROP TABLE [dbo].[sys_ability]
GO
CREATE TABLE [dbo].[sys_ability] (
[ID] varchar(36) NOT NULL ,
[name] varchar(200) NULL ,
[typeId] varchar(36) NULL ,
[Serial] varchar(100) NULL ,
[TheLevel] varchar(100) NULL ,
[evidence] varchar(2000) NULL ,
[Score] float(53) NULL ,
[formula] varchar(36) NULL ,
[passmark] float(53) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL 
)


GO

-- ----------------------------
-- Records of sys_ability
-- ----------------------------
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'081baf78-0a93-4397-8429-19199bd5ae7d', N'技术能力', N'10', N'01', N'01', N'技术能力测评1', N'50', N'gohighandlow', N'50', N'2017-09-25 15:50:51.890', N'2017-09-26 17:59:43.103', N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'086f4779-450e-4452-9f90-878248d5c9af', N'jsp 开发能力', N'11', N'03', N'03', N'测评()xg', N'30', N'average', N'30', N'2017-09-25 16:39:11.160', N'2017-09-25 16:39:11.160', N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'299fb4a8-109e-46de-b3a9-580666ac13d8', N'java能力', N'11', N'02', N'02', N'12346789', N'95', null, N'95', N'2017-09-26 17:38:49.243', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'3273b87c-2d7b-4e0e-9e16-382f73e9ced9', N'jsp 开发能力', N'11', N'03', N'03', N'eeeee', N'3', N'average', N'31', N'2017-09-25 16:40:52.313', N'2017-09-29 09:12:09.220', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'35fba3a9-8b46-48fd-8c9f-acc9a20c9e7a', N'JAVA编程能力项', N'10', N'03', N'03', N'JAVA编程能力项测评', N'40', N'average', N'40', N'2017-09-25 18:23:55.133', N'2017-09-25 18:23:55.133', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'38fadcda-efa5-47dd-a654-714c39b6e386', N'23', N'11', N'02', N'01', N'23', N'23', N'average', N'23', N'2017-09-25 15:37:22.803', N'2017-09-25 15:37:22.803', N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'3a35486c-aaa5-49b1-b818-50f478d9164d', N'系统架构能力', N'10', N'03', N'03', N'项目测评', N'10', N'average', N'10', N'2017-09-25 18:23:55.163', N'2017-09-25 18:23:55.163', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'3f6d0fbb-64b1-4682-854d-3eced4ab654f', N'asp.net mvc ', N'10', N'01', N'02', N'项目测评', N'40', N'average', N'40', N'2017-09-25 14:58:41.020', N'2017-09-25 14:58:41.020', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'4a2a4df1-b2bc-44dd-ab38-3ef5592f5f58', N'系统架构能力', N'10', N'03', N'03', N'项目测评', N'10', N'average', N'10', N'2017-09-29 08:57:38.810', N'2017-09-29 08:57:38.810', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'4b40c416-f426-4b04-95ef-2589772bb1e7', N'2343', N'10', N'02', N'01', N'23', N'23', N'gohighandlow', N'23', N'2017-09-25 15:37:22.780', N'2017-09-25 15:37:22.780', N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'4d3f63b9-6068-457b-be07-c281e4bf60cf', N'vue能力', N'11', N'01', N'01', N'vue能力', N'20', N'average', N'20', N'2017-09-25 15:50:51.873', N'2017-09-27 15:16:25.327', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'4db3b1c4-b745-4984-abad-92d5a715de86', N'net', N'11', N'03', N'02', N'123456', N'65', null, N'20', N'2017-09-26 17:10:11.317', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'4fc961f9-bb7a-4e79-bb93-3c907773afcf', N'数据库能力', N'10', N'01', N'02', N'考试试卷', N'20', N'average', N'20', N'2017-09-25 14:58:41.037', N'2017-09-25 14:58:41.037', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'50ac4845-e114-405d-a6e1-7e4564529eb4', N'spring mvc ', N'10', N'01', N'02', N'spring mvc 测评', N'50', N'average', N'50', N'2017-09-25 15:18:27.150', N'2017-09-25 15:18:27.150', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'518aa72c-2e65-4259-b9c9-d42f2fac05ce', N'面向对象编程', N'10', N'03', N'03', N'面向对象编程 测评', N'20', N'average', N'20', N'2017-09-25 18:23:55.110', N'2017-09-25 18:23:55.110', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'532f5bc2-de84-4df3-94ec-3076f66ddc2c', N'jsp 开发能力', N'', N'03', N'03', N'测评1', N'30', N'', N'30', N'2017-09-25 16:13:35.127', N'2017-09-27 15:17:33.673', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'597b3710-73d6-4e3c-ace4-b669fcfeff44', N'c# 高级编程能力', N'10', N'01', N'02', N'c#测评试卷', N'30', N'average', N'30', N'2017-09-25 14:58:41.003', N'2017-09-25 14:58:41.003', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'60160fa1-1724-426c-88d3-989f52f50719', N'面向对象编程', N'10', N'03', N'03', N'面向对象编程 测评', N'20', N'average', N'20', N'2017-09-29 08:57:38.823', N'2017-09-29 08:57:38.823', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'654a1629-0679-4067-997b-7c1ca6f20aa4', N'', N'', N'03', N'03', N'', null, N'', null, N'2017-09-25 16:40:52.343', N'2017-09-25 16:40:52.343', N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'6a0f009d-1e79-4774-9e33-21f536ac7636', N'HTML能力', N'11', N'01', N'02', N'项目测评', N'10', N'average', N'10', N'2017-09-25 14:58:41.057', N'2017-09-25 14:58:41.057', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'7428a4f3-7fb5-45fa-b0b4-eaa0c8aab355', N'Spring cloud', N'10', N'03', N'03', N'架构能力测评', N'20', N'average', N'20', N'2017-09-29 08:57:38.850', N'2017-09-29 08:57:38.850', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'7d5962ff-1a31-49b1-932e-62604a5d4d9c', N'1234', N'11', N'02', N'03', N'456', null, null, null, N'2017-09-26 14:53:23.633', null, N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'81420fd3-a7a5-40d6-8fee-7f1b85126f9e', N'asp.net mvc', N'10', N'01', N'01', N'asp.net mvc测试', N'70', N'average', N'70', N'2017-09-28 14:18:34.273', N'2017-09-28 14:18:34.273', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'90fd4df6-37b1-4f7c-a699-1f836892755b', N'测试1', N'10', N'01', N'01', N'234', N'23', N'average', N'324', N'2017-09-25 15:48:56.417', N'2017-09-25 15:48:56.417', N'1')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'91b11532-a62c-4ff8-969b-2df7bf56d033', N'Spring cloud', N'10', N'03', N'03', N'架构能力测评', N'20', N'average', N'20', N'2017-09-25 16:39:11.173', N'2017-09-25 16:39:11.173', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'9936aea7-9b72-427e-8b86-7babb4f5344c', N'JAVA编程能力项', N'10', N'03', N'03', N'JAVA编程能力项测评', N'40', N'average', N'40', N'2017-09-25 16:40:52.333', N'2017-09-25 16:40:52.333', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'b077e185-f80d-46c3-9a7e-37d237b128a3', N'net1', N'11', N'03', N'02', N'987', N'89', null, N'50', N'2017-09-26 17:11:40.100', null, N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'b091fea6-a629-4315-bf8d-3af8382f9df8', N'1234567', N'11', N'03', N'03', N'0000', N'66', N'gohighandlow', N'66', N'2017-09-26 17:40:58.143', null, N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'b099129d-1849-4249-9dbb-aa3b85b6ce29', N'asp.net mvc', N'10', N'01', N'01', N'asp.net mvc测试', N'70', N'average', N'70', N'2017-09-25 15:16:42.447', N'2017-09-25 15:16:42.447', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'b58d7244-0f8f-4480-b3d0-dc9dbacf0ee3', N'JAVA编程能力项', N'10', N'03', N'03', N'JAVA编程能力项测评', N'40', N'average', N'40', N'2017-09-29 08:57:38.797', N'2017-09-29 08:57:38.797', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'b9f92e25-de8a-4b13-9004-53e4e7544d45', N'JAVA编程能力', N'10', N'01', N'02', N'JAVA编程能力测试', N'50', N'average', N'50', N'2017-09-25 15:18:27.130', N'2017-09-25 15:18:27.130', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'bb0c85ae-0da0-4080-bcd1-0c73ef0f6c38', N'JAVA编程能力项', N'10', N'03', N'03', N'JAVA编程能力项测评', N'40', N'average', N'40', N'2017-09-25 16:39:11.183', N'2017-09-25 16:39:11.183', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'be1b6b2f-b51d-4a5d-a4c0-a5ba4e29c4d9', N'js能力', N'11', N'01', N'01', N'js 测评', N'20', N'average', N'20', N'2017-09-25 15:50:51.860', N'2017-09-25 15:50:51.860', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'be7ee72c-ed01-4100-81e4-395cae028f62', N'', N'', N'', null, N'', null, N'', null, N'2017-09-29 09:15:35.807', null, N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'c487b788-0e86-4e61-9c16-e8ee65c13136', N'2344', N'10', N'01', N'01', N'234', N'234', N'average', N'234', N'2017-09-25 15:58:13.447', N'2017-09-25 15:58:13.447', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'cc1d3455-b517-44f7-8127-4bbd9d8fb2eb', N'jsp 开发能力', N'11', N'03', N'03', N'测评()xg', N'30', N'average', N'30', N'2017-09-29 08:57:38.837', N'2017-09-29 08:57:38.837', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'd1999556-9950-4037-94c4-89efcce01038', N'234', N'10', N'01', N'01', N'234', N'234', N'average', N'234', N'2017-09-25 15:48:56.433', N'2017-09-25 15:48:56.433', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'd225db95-1dfc-4a09-9d4e-9d0596ae2647', N'jsp 开发能力', N'11', N'03', N'03', N'测评()xg', N'30', N'average', N'30', N'2017-09-25 18:23:55.097', N'2017-09-25 18:23:55.097', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'd2fac44c-13f3-4572-82a0-5725c9b9872f', N'223', N'10', N'01', N'01', N'23', N'23', N'average', N'23', N'2017-09-25 15:57:14.310', N'2017-09-25 15:57:14.310', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'e5dfcaff-e7f4-4f8a-93cc-469fea381e05', N'Spring cloud', N'10', N'03', N'03', N'架构能力测评', N'20', N'average', N'20', N'2017-09-25 16:40:52.323', N'2017-09-25 16:40:52.323', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'e6281d5c-6f0f-40d9-aed7-8885b373aa53', N'Spring cloud', N'10', N'03', N'03', N'架构能力测评', N'20', N'average', N'20', N'2017-09-25 18:23:55.153', N'2017-09-25 18:23:55.153', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'f58fcb60-1acf-414f-92b5-c42750a7ce12', N'Spring cloud', N'10', N'03', N'03', N'架构能力测评', N'20', N'average', N'20', N'2017-09-25 16:05:36.343', N'2017-09-25 16:05:36.343', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'f7ac7fce-782e-4ea3-a840-3e8f81ad8ec5', N'JAVA编程能力项', N'10', N'03', N'03', N'JAVA编程能力项测评', N'40', N'average', N'40', N'2017-09-25 16:05:36.327', N'2017-09-25 16:05:36.327', N'0')
GO
GO
INSERT INTO [dbo].[sys_ability] ([ID], [name], [typeId], [Serial], [TheLevel], [evidence], [Score], [formula], [passmark], [DateTimeCreated], [DateTimeModified], [isDeleted]) VALUES (N'fb132e59-58ff-4080-8799-8d4fc7cd6e70', N'23', N'10', N'01', N'01', N'23', N'23', N'average', N'23', N'2017-09-25 15:32:29.077', N'2017-09-25 15:32:29.077', N'0')
GO
GO

-- ----------------------------
-- Table structure for sys_evaluationform
-- ----------------------------
DROP TABLE [dbo].[sys_evaluationform]
GO
CREATE TABLE [dbo].[sys_evaluationform] (
[ID] varchar(36) NOT NULL ,
[name] varchar(200) NULL ,
[Serial] varchar(100) NULL ,
[level] varchar(100) NULL ,
[version] varchar(100) NULL ,
[status] varchar(200) NULL ,
[total] float(53) NULL ,
[passmark] float(53) NULL ,
[judgesNumber] int NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL ,
[standardFile] varchar(200) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_evaluationform', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态 ：草稿、已发布、作废'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_evaluationform'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态 ：草稿、已发布、作废'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_evaluationform'
, @level2type = 'COLUMN', @level2name = N'status'
GO

-- ----------------------------
-- Records of sys_evaluationform
-- ----------------------------
INSERT INTO [dbo].[sys_evaluationform] ([ID], [name], [Serial], [level], [version], [status], [total], [passmark], [judgesNumber], [DateTimeCreated], [DateTimeModified], [isDeleted], [standardFile]) VALUES (N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'Java架构师（初稿）', N'03', N'03', N'2018版本', N'已发布', null, N'100', N'5', N'2017-09-25 16:05:36.297', N'2017-09-29 08:57:38.703', N'0', N'28c40ebd-62db-45ae-80e1-a3f6612343bd')
GO
GO
INSERT INTO [dbo].[sys_evaluationform] ([ID], [name], [Serial], [level], [version], [status], [total], [passmark], [judgesNumber], [DateTimeCreated], [DateTimeModified], [isDeleted], [standardFile]) VALUES (N'3d82d793-84d1-4569-87ee-8b795f7fde10', N'Net初级程序员', N'01', N'01', N'2018版本', N'已发布', null, N'60', N'2', N'2017-09-25 15:16:39.520', N'2017-09-28 14:18:34.240', N'0', N'eb156dae-155f-4ca9-824f-6dc1f5f4fdcf')
GO
GO
INSERT INTO [dbo].[sys_evaluationform] ([ID], [name], [Serial], [level], [version], [status], [total], [passmark], [judgesNumber], [DateTimeCreated], [DateTimeModified], [isDeleted], [standardFile]) VALUES (N'5edee146-5099-4b38-9652-a6d49fd369e9', N'前端工程师（高级）', N'01', N'01', N'第二版本', N'已发布', null, N'50', N'3', N'2017-09-25 15:50:50.873', null, N'0', N'5499b66b-3385-492c-8c7c-d34187a7a958')
GO
GO

-- ----------------------------
-- Table structure for sys_evaluationform_ability
-- ----------------------------
DROP TABLE [dbo].[sys_evaluationform_ability]
GO
CREATE TABLE [dbo].[sys_evaluationform_ability] (
[ID] varchar(36) NOT NULL ,
[evaluationformId] varchar(36) NULL ,
[abilityId] varchar(36) NULL 
)


GO

-- ----------------------------
-- Records of sys_evaluationform_ability
-- ----------------------------
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'1e3abf78-47f1-4898-9cbd-13c19166615c', N'5edee146-5099-4b38-9652-a6d49fd369e9', N'4d3f63b9-6068-457b-be07-c281e4bf60cf')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'438805b5-2cc2-4a6d-b676-3143d0913269', N'5edee146-5099-4b38-9652-a6d49fd369e9', N'be1b6b2f-b51d-4a5d-a4c0-a5ba4e29c4d9')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'485a872f-54be-45ef-97e9-7755d77d3be8', N'3d82d793-84d1-4569-87ee-8b795f7fde10', N'81420fd3-a7a5-40d6-8fee-7f1b85126f9e')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'75e8a057-8927-424d-badb-b735ad918ca1', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'7428a4f3-7fb5-45fa-b0b4-eaa0c8aab355')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'8248f025-bdf3-412c-bb73-fab7cc177b7d', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'cc1d3455-b517-44f7-8127-4bbd9d8fb2eb')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'b178d1ab-8760-43b2-bab6-852afa96ef1d', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'60160fa1-1724-426c-88d3-989f52f50719')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'de4de2dd-91fc-4413-b677-b12ba5b9191d', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'4a2a4df1-b2bc-44dd-ab38-3ef5592f5f58')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'e150491d-cb95-4083-ae75-599b5094439f', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'b58d7244-0f8f-4480-b3d0-dc9dbacf0ee3')
GO
GO
INSERT INTO [dbo].[sys_evaluationform_ability] ([ID], [evaluationformId], [abilityId]) VALUES (N'e4d5644e-bb5e-464a-9e8c-68dbf51e512a', N'5edee146-5099-4b38-9652-a6d49fd369e9', N'081baf78-0a93-4397-8429-19199bd5ae7d')
GO
GO

-- ----------------------------
-- Table structure for SYS_LOG
-- ----------------------------
DROP TABLE [dbo].[SYS_LOG]
GO
CREATE TABLE [dbo].[SYS_LOG] (
[ID] varchar(36) NOT NULL ,
[userId] varchar(36) NULL ,
[userName] varchar(255) NULL ,
[type] varchar(255) NULL ,
[level] varchar(10) NULL ,
[msg] varchar(4000) NULL ,
[createdTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SYS_LOG', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类别名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SYS_LOG'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类别名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SYS_LOG'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SYS_LOG', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SYS_LOG'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SYS_LOG'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SYS_LOG', 
'COLUMN', N'msg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志信息（对应业务数据id之类的信息）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SYS_LOG'
, @level2type = 'COLUMN', @level2name = N'msg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志信息（对应业务数据id之类的信息）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SYS_LOG'
, @level2type = 'COLUMN', @level2name = N'msg'
GO

-- ----------------------------
-- Records of SYS_LOG
-- ----------------------------
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'', N'', N'', N'', N'INFO', N'', N'2017-09-15 16:45:38.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'01055a90-86e4-4fb8-9a4a-7791e7558971', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:05:36.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'02ebd391-3a57-4a5a-80b5-a216ed5f7739', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'9e1baadc-b410-4f1b-86d8-60caadb1b643', N'2017-09-25 16:03:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'039e0f9e-105a-4d97-828c-d6df8b1bc3cd', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'ef93258b-c046-4283-8035-9caaaf5f7878', N'2017-10-12 09:50:43.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'03ea8218-9f25-4148-9596-a7d3ecbbee58', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'20d26b5a-c715-4096-b2a0-11f0983bff26', N'2017-10-10 14:01:39.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'087d5d2d-dfd7-45f4-a793-3a5b1b5b0a53', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'1be456e8-b1b3-476c-899b-20c25b25fdb3', N'2017-09-27 17:01:48.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0881a2e2-3196-481c-b4bd-91416e0998b5', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'eb5bf411-e8f8-48a1-938c-73cda4790edf', N'2017-09-27 16:00:58.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0a78532e-258f-4bfb-b165-3cfc4b17d34c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'478d7ede-0521-4d51-97e9-0c9ee8749771', N'2017-10-11 13:53:12.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0aabe387-a6af-4fc1-a980-7255bdd8f6ed', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'46b56d9c-15ca-4666-8f4b-d8f0ce840428', N'2017-09-25 15:32:29.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0c7e068e-7842-4dec-9cdf-2defb6c60f86', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'e4fee62b-aeae-4d7d-af31-8537f0214689', N'2017-10-12 15:20:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0ca957b9-81aa-44dd-ae69-561d01968332', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'372ff633-7cc9-4c2c-9d15-b4afd65b610e', N'2017-09-19 16:46:09.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0db3421d-ab42-4d3a-b7ac-ffe81c2d228c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'95750645-3955-4173-8726-407ecebae315', N'2017-10-12 10:08:45.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0e5b208e-bdaf-481d-8267-dd75e744b251', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'09178e07-fc51-4d28-b885-b95f44e60028', N'2017-09-26 11:09:11.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'0fd0815d-d0b9-42ca-a962-1b11de2434d7', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'2a28bdbd-781c-4316-9f1d-843cc43d84f3', N'2017-09-26 10:57:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'11e666ae-54e3-4d76-9e9c-b973909394f7', N'9F384FA6-4727-4BC6-B611-DAE615D90051', N'syb', N'申请新增', N'db', N'06a04a1f-638f-47bc-969c-46a0b443fe31', N'2017-09-27 16:28:54.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'131b423a-39bf-475f-98c0-71fca062d643', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'f43473b2-8b4e-4513-8275-b83abdc8cfec', N'2017-09-26 14:23:53.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'13ff3129-b235-40bb-b736-af17d984c0ac', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'57b295a6-90ef-4ac7-9d26-fb1e3c35780f', N'2017-09-26 17:42:43.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'1428f4af-096e-4073-91c7-3f64ba920f15', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'b0f41d94-de62-436d-9e8c-00870aae42d4', N'2017-09-25 10:23:02.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'167ac9db-be59-43ed-86c9-ee51d943eb6e', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'2f9f06c9-af19-433c-a3c2-b4b36fa18745', N'2017-09-19 15:58:56.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'19384540-9233-4f35-9414-feee96d079ac', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'aa467a79-ade9-4be8-8e70-0a979cd54f87', N'2017-10-09 09:54:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'1a911d43-817b-4f08-8eaa-c05eb363c781', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'2599a41f-1a97-4b8e-93f4-1f874466f4bb', N'2017-09-26 14:44:37.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'1c4daaac-e225-4614-bab6-a70e66f018bc', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:20:00.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'1df82e9f-7b3f-49b1-9689-2f459a917cab', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'86a11cc5-008c-4fed-81cc-39aea578dda7', N'2017-09-25 13:49:31.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'1ed2c455-4362-4845-8f9c-7492e3657aae', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'0dce696e-c8ea-4bf6-bba2-6e443533f83e', N'2017-09-25 14:54:49.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'1f8cb847-fe48-49a1-b2af-d08f96b5452b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'd4c7f79b-d343-41ca-9480-35af002caf97', N'2017-09-26 14:39:55.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'1f948e31-1265-494c-8514-59c44d444ebb', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'868ba116-deb2-47a8-92df-5ba547856158', N'2017-10-11 18:04:15.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'2110c9d8-e684-4fd3-b6b3-fc1d39a51271', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'61f9db05-4a2e-467b-a9d4-fb59b4adac14', N'2017-09-26 17:07:31.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'21431f55-57a3-41f3-9487-91e480a63479', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'e419923d-1926-4201-b909-7204fb716171', N'2017-09-25 13:53:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'22043c37-bfbf-46b1-9109-33943d351889', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'ae575b0b-2369-4d4e-9283-2862b46a5d90', N'2017-09-27 14:31:35.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'233871a2-ed98-4906-b727-ecc8fb026608', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'ae575b0b-2369-4d4e-9283-2862b46a5d90', N'2017-09-27 14:31:32.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'24bf2ded-b7d0-4ba0-8bcc-a5125faeaae2', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'6b2cacc6-db86-42a3-9a58-b0ee5eb05cee', N'2017-09-25 13:42:15.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'24e92695-e5ee-4eb9-8701-7fd3665f7090', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'fbe73e29-dbff-4ed5-a5f1-b3205434cf00', N'2017-09-25 16:03:43.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'252b06e8-e4c5-4db6-bdd6-07cbc3ff85d4', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'678bee69-8960-4e05-99ec-38c4ce783951', N'2017-09-27 11:03:51.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'25475dbc-fb7c-4997-916c-429836d0461a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'09e643bb-18ea-4482-b3ba-07d9a42d669d', N'2017-09-19 15:21:00.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'25c17e38-4eb0-4b58-b264-f4df08235c76', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'514889f6-3c74-40f0-83c1-216fc88dcbdc', N'2017-09-25 14:56:00.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'26eefc63-548d-4b75-90cd-cc2e915bd0bf', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'e6e42bd3-2260-4a4d-9e9a-221d7a2fcefd', N'2017-09-25 15:10:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'29b898fa-b4d1-4133-bff4-2fd80dc81e1a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'1e45595f-53a1-4adb-8335-ec66f021d372', N'2017-09-26 13:57:06.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'2add014d-8384-4fd3-8f27-d8d2bc3efadd', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'2eb2215c-badb-4f42-bafb-e02c79fdd48e', N'2017-10-12 10:06:56.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'2bdc5ad3-d1c4-4ecc-99e8-eb5bb072933c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'b563dfb8-1392-4e55-a5e8-05e213c8d7ac', N'2017-10-11 15:47:51.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'2c8926b3-7693-4bd1-aa12-64d43609e5e9', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'56996971-63a8-4703-9934-94c95e2a1a1f', N'2017-09-26 16:02:56.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'2cdf547f-0a27-42dd-915e-203ca0078ea7', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'4db3b1c4-b745-4984-abad-92d5a715de86', N'2017-09-26 17:10:11.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'2ea7c38f-1c01-4dab-adf4-002f6abfd272', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'03d67dc6-9330-4a9c-8d73-583be3dfaee9', N'2017-09-19 11:30:41.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'30548e73-e60a-4c03-93e0-d90b996dc8ef', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'1dc11785-f7e8-4be2-a829-cebb53ffe81f', N'2017-09-26 16:58:16.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'312bfb44-505b-4271-ab82-43fbe0854ace', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'34547423-93ca-4f8a-9324-42cdaab70551', N'2017-09-19 11:08:39.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'3313e85e-df3d-47eb-ae2d-3e7d39510f80', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'3edac4a6-859c-4ab5-93ff-439ce0fe8fa1', N'2017-10-11 18:02:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'3355314f-dfff-4b93-ad5f-9f4c28f8614b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'81ea80c9-bad1-45f4-aa0e-354832a54b8c', N'2017-10-10 13:33:24.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'37279f99-f1bd-4fe5-83ee-587663ef4512', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'74179273-4a85-4371-b4cb-c3235bf72864', N'2017-09-19 15:48:41.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'38a133b0-10b3-4427-9d9d-887f3294a9c0', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'a0fb6053-5713-45d0-afdc-b2b69bcdb521', N'2017-09-22 16:47:15.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'3b3bc6e9-c892-4fee-ac84-b88f998694d9', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:10:27.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'3bec5047-e8be-4bfc-b12d-da06139bec22', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'0afa3d68-33e3-4a26-b474-0e13c9009b48', N'2017-09-27 14:46:39.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'41f48edc-0bef-4c3b-9e36-6c52cbf436f8', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'ec390eab-d188-44ee-9967-b0281087ef11', N'2017-09-28 09:19:10.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'431baef9-6033-4427-950e-11c116d881cc', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'8c84e3a1-6a6a-4f83-93e5-3f56004a1846', N'2017-09-22 17:21:30.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'4376253d-728f-485e-8283-b124b0b96249', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'9e1baadc-b410-4f1b-86d8-60caadb1b643', N'2017-09-25 15:57:14.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'43cb64e9-7dae-4daa-8b99-46a6eeaf31db', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'719386aa-1983-4a76-8f49-aa71241c7d31', N'2017-09-19 15:10:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'44ac9396-f292-4c42-ac7a-bcf8b7312473', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'7aa89103-d353-401f-98f5-cbe4b766ea56', N'2017-09-19 11:29:49.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'45193c23-b23a-4173-adeb-d87978f6e34c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'678bee69-8960-4e05-99ec-38c4ce783951', N'2017-09-27 10:59:51.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'451e8b91-0100-4b8e-9708-c81f9b96e9ee', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'735b708c-d28b-4231-89f8-60bf6d7bc2e3', N'2017-10-11 13:59:25.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'45dfae31-ebb5-40d4-8a91-3f29041ca148', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'b1977375-52e5-4e4f-8a14-df18663f0ab3', N'2017-09-26 14:26:49.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'4852c267-7076-4fde-b21c-7b4267c9d0b8', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'7bf172e1-4523-4025-b76f-475c7b77884a', N'2017-09-26 14:06:47.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'4993ca17-d2a0-47fe-aa09-c3a16582480c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'40041643-fa83-46b1-ba6e-d815fce16327', N'2017-09-19 11:06:50.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'4ba406ee-9efb-48a1-a0d6-76e797af60ca', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'4daeb320-dd54-4c40-8206-dc897b9b27e0', N'2017-09-19 18:22:22.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'4e071bec-50cd-474b-af36-f0d7bb5f86de', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'f23c9ca5-d9a8-49cf-9d5f-23ab80478292', N'2017-09-26 17:48:22.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'504a6d17-9e24-4678-bd42-de964d8b3907', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'7fa0c2ce-d812-43f1-a3bd-4a0c7524a5a6', N'2017-09-19 15:14:23.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'5073f20e-aa0d-4de2-b2e3-c08cb2e20cf1', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'eb8cd6c9-0256-4495-9960-5252099f3265', N'2017-10-12 16:27:41.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'5893e4d4-2bf2-4abe-ab4c-c906b42c7553', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'0126dcc7-64ad-4200-938d-60a6d38d6244', N'2017-09-19 18:06:45.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'596edda9-d372-450a-9fec-0414090eaffd', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'bcd3ed66-6493-41ed-8a01-643c9288740e', N'2017-10-11 15:50:23.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'597c00a9-f18c-4c73-a092-f52826d882a9', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'ef93258b-c046-4283-8035-9caaaf5f7878', N'2017-10-12 09:39:24.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'5a60ae0e-bf4a-4d96-83ba-9164c181555d', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'f43473b2-8b4e-4513-8275-b83abdc8cfec', N'2017-09-26 14:23:57.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'5defa8fd-9557-4434-b52a-dcc0a6a3e098', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'a12ba0e8-6ea7-43e0-8051-2a05435563e3', N'2017-09-19 11:29:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6018b779-0de8-49e4-b217-41cfafd325d7', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'99b70490-971a-4dfe-822e-9db597e1c130', N'2017-09-26 15:45:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6116f4e1-f102-4f30-8cee-3feeb0f28b3c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'e0d4b42e-0ca9-458b-98ee-8b3367ca69ad', N'2017-09-19 16:06:11.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'611d6ffd-0cb1-4be5-8e2c-805511795dc4', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'0b597d51-02e6-4fbc-acbe-a5df5e8bd147', N'2017-09-25 14:53:54.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6151a23d-0999-4f70-8e6e-2034e33353c7', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'4ce5ff11-1520-44bb-8346-743de343cf70', N'2017-09-26 16:29:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'62ba3bf1-4dc4-4bf2-b375-69b3d71efe44', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'627f7c29-82ed-45e3-b5d3-dbb483c4395d', N'2017-09-25 15:37:22.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'638a5531-e4a0-4263-99fe-6c5c1d7f165d', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'91bdaae9-edb6-42e3-8bdc-278217a253f1', N'2017-09-19 11:27:26.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'676e08cf-55b5-4386-b6ca-8c27152c7782', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'4bd087aa-b414-49cd-b82d-d16ddd2f8eee', N'2017-09-20 10:58:04.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'689b839e-d91c-4e9d-875c-59c02760c11c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'95514ceb-6645-4bc9-9c11-b7abf105c44f', N'2017-09-25 14:28:05.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'698402ab-cab7-482f-8758-e26c989fd152', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'd38854e8-1f0e-4670-8029-7635b32b3fa6', N'2017-09-25 09:24:11.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'69a82e3b-f5cf-4d33-b268-4cd1ddcc58bc', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'ef3a1ae9-89a6-42f5-a4ce-4d3d970e2a40', N'2017-09-26 14:20:10.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'69b50375-a850-4850-9146-fc007ae974d9', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'e419923d-1926-4201-b909-7204fb716171', N'2017-09-25 14:48:21.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'69c40d4a-f7da-4ed6-8068-317cee5ed739', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'3aee64ee-63b3-45fe-988b-4cf315299cc9', N'2017-10-09 17:25:48.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6af35cab-0dc5-41a8-a9ab-6e01cc64a5a1', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'4fe5d4db-bc2b-431f-b8dc-b1ad543f3e04', N'2017-09-19 11:30:10.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6bc396ca-f414-4dd3-8141-e8a0b473c0de', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'12cbbe81-f752-4138-8344-056bcf350461', N'2017-09-19 15:55:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6c3b4dd4-a8e7-46f1-9105-b900a9f25215', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'90d0232d-bfae-4de1-8a6a-149cfc740bef', N'2017-09-26 14:28:03.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6cb654f6-075a-4795-84ca-dac9fb0a0f9a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'7d5962ff-1a31-49b1-932e-62604a5d4d9c', N'2017-09-26 14:53:23.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6cfc3a04-aa1b-4b13-956d-ae51ef64159a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'4cb5e85a-0f79-4e99-bdb4-6e83004b1d6f', N'2017-09-29 11:17:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'6d5ed909-fa77-414e-9f8f-639bbfd1557a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'c3c6395a-2f40-4128-9a28-72eb60e6594d', N'2017-09-19 11:31:42.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'71311503-0442-4eee-b964-86def28f4df0', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'1be456e8-b1b3-476c-899b-20c25b25fdb3', N'2017-09-27 17:01:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'71563c32-4fa2-48ae-ab6b-fba868f861fe', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'2eb2215c-badb-4f42-bafb-e02c79fdd48e', N'2017-10-12 10:06:59.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'728e31c9-dc57-40ed-8094-fe89868a0e83', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'28b6b69f-f308-4336-b853-9d5061dccdb5', N'2017-09-19 11:22:38.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'72f1b7b4-dddc-4421-ab71-133fa2c49708', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'832b4750-e5d2-4cf0-87c4-595fa21ff727', N'2017-09-22 16:33:43.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'7362700f-75b3-4934-98bf-f8139bed186a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'3465df1a-a0ae-4160-bf76-5244247194e9', N'2017-09-19 18:25:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'738bfe45-12e7-4e9d-a571-537aea126424', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'e818c66e-cfa8-4787-8400-4043b7376a36', N'2017-10-09 09:01:33.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'77765742-dfba-4b87-b4bf-1822a06052da', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'1397726b-eb1a-40d5-ad01-5388fec20cad', N'2017-09-25 15:44:24.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'781a4275-06f2-474c-b10b-bd34240ac193', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'2a28bdbd-781c-4316-9f1d-843cc43d84f3', N'2017-09-26 10:57:40.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'7a65c11b-ce6a-4a67-860e-189ef6135b79', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'2599a41f-1a97-4b8e-93f4-1f874466f4bb', N'2017-09-26 14:44:34.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'7a98100d-6fb5-4719-ab81-a2757987f73c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'2cc6dc73-7d1e-4db5-a534-056fa564fa4d', N'2017-09-19 11:32:28.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'7abbbbf5-27a5-4579-9acd-3bba0da0bbe6', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'b3347c7e-d0df-4a19-9294-8fd7abe0b187', N'2017-09-25 11:21:48.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'7ae4df93-2f5f-426b-9dfd-7d8847f816a3', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'4cb5e85a-0f79-4e99-bdb4-6e83004b1d6f', N'2017-09-29 11:17:58.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'7decf19e-72c7-43d8-a37c-3268daa7802c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'b1977375-52e5-4e4f-8a14-df18663f0ab3', N'2017-09-26 14:26:47.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'81d9ded7-a1a8-4462-9e68-fed82b53fe3f', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'356b42ca-a2f4-4e17-88fc-c6903a4f5ce8', N'2017-09-25 15:48:56.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'829646d8-840c-47c0-ad9a-2edd6152a6d3', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'c253e4de-8067-4385-b42d-493b7e40f47a', N'2017-09-28 09:16:39.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'82a40043-2e34-4d95-9634-563eeeb5cc3b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'299fb4a8-109e-46de-b3a9-580666ac13d8', N'2017-09-26 17:38:49.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'82bcb1d9-c345-417a-8647-2283640c5a08', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'e818c66e-cfa8-4787-8400-4043b7376a36', N'2017-10-09 09:02:23.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'85d932e5-a46d-4be6-97eb-b6e479966a50', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'5edee146-5099-4b38-9652-a6d49fd369e9', N'2017-09-25 15:50:51.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'86cee2d2-2c9d-4129-9b1e-b14dc6ba135d', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'37dca497-5ec3-42c1-89dc-3e9f8dc2a4b3', N'2017-09-22 16:53:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'87e45d88-7480-4986-93ce-99afde3cdbbf', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'ef93258b-c046-4283-8035-9caaaf5f7878', N'2017-10-12 09:27:27.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'899f85c6-9afd-4916-be34-09f743be489b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'9b7aa3aa-5e8d-4b11-ab51-49ddd3955d21', N'2017-09-26 11:36:33.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8c39e631-d997-4bdc-96e3-f2410d2c053a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'b091fea6-a629-4315-bf8d-3af8382f9df8', N'2017-09-26 17:40:58.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8ccc4987-1fe2-4d39-9636-7ef23dfa29a3', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'8097e2c1-f92b-43ad-b830-0f76dd7c6737', N'2017-09-19 16:42:53.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8dee535e-e113-4934-a3c1-48b32affbd5b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'e38d19f9-09be-4f1b-a46a-31fa3ceb14f0', N'2017-09-15 15:44:50.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8e21ebe6-dd5f-4c47-a45d-8b123b8fa893', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'1001', N'2017-09-25 14:48:12.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8e5e7fe9-0031-4e82-bb84-c039654179fa', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'86f95230-b1ff-4c0e-8889-42d92f5954d1', N'2017-09-29 17:28:42.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8e9547bf-b343-4b34-9cff-d36cd686fb6d', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'b03f02fa-409e-4dec-b07a-3d4fc9c23151', N'2017-09-25 14:54:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8ece8c75-3c53-437f-a230-10af7cc0e080', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-29 08:57:38.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8f50a523-31a6-4a9e-86a4-dd147c4bfca3', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'96ffc585-078e-4b2f-8574-e2a0dc50fef8', N'2017-09-26 10:47:42.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'8fffff71-7f7a-4b71-8e07-10603e3eab18', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'e4fee62b-aeae-4d7d-af31-8537f0214689', N'2017-10-12 15:20:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'908c742d-0044-4f40-b20a-746cbef2006c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'066f6868-5fd0-4bd8-ab6e-4c0af590bd76', N'2017-09-20 10:54:57.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'90c385d1-9ac7-44ad-93d8-7b81a0f06f04', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'71e3b57f-0732-4ab0-a2cb-7061ec7e586b', N'2017-09-25 10:23:47.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'912a18a0-283c-4295-86da-41887836de5f', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'fca59b6c-c12c-4958-b2b1-17d22056deeb', N'2017-10-09 10:26:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'919945df-dfff-40c2-88cd-ffe180f21f78', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'8ed6843f-ebfd-4055-909d-784dcc0f09b6', N'2017-09-25 13:42:33.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'938f9efb-864a-43a5-8ef0-11ec88291912', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'e6e42bd3-2260-4a4d-9e9a-221d7a2fcefd', N'2017-09-25 14:58:41.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9506bf53-727c-4041-9c4d-085d74b45bcc', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'e6314d75-fe11-4372-a4b1-abe98d6a2414', N'2017-10-11 16:43:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9594eb1e-e3e3-42af-b1a8-6504d60d178e', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'6af6378d-c5d6-49f7-8f5e-5c9e95a31c7d', N'2017-09-20 10:57:15.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9621d221-ab20-4f36-b14e-887687970f42', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'fbe73e29-dbff-4ed5-a5f1-b3205434cf00', N'2017-09-25 15:18:27.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9ab37c12-556d-49dc-b865-51ee8c4b0036', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'4ce5ff11-1520-44bb-8346-743de343cf70', N'2017-09-26 16:29:05.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9b47711e-b1a6-4e8a-b01b-817bc3f8b644', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'eb5bf411-e8f8-48a1-938c-73cda4790edf', N'2017-09-27 16:14:16.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9c241d0b-07b5-4055-8e94-ff4af87619c2', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'76947438-f6c8-4377-875e-ad3040e7bdb1', N'2017-09-19 15:53:51.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9d5b3289-2889-4329-b6f7-4fa80de03545', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'478d7ede-0521-4d51-97e9-0c9ee8749771', N'2017-10-11 13:53:10.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9de41d6e-0071-46a6-aacb-a0387720f583', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'aa467a79-ade9-4be8-8e70-0a979cd54f87', N'2017-10-09 09:54:05.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9e292a54-6e2d-4903-8584-5d3a594c1064', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'bfc5aa0a-bb01-432a-b06d-e6c6cc67491c', N'2017-10-12 09:22:00.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'9e92da2e-c634-4bef-a47a-a59b6ce7a132', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'f23c9ca5-d9a8-49cf-9d5f-23ab80478292', N'2017-09-26 17:48:12.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'a26a465b-49f1-4cd7-99c4-5b12790acfa0', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'338321eb-2ca9-4007-a095-112270729cde', N'2017-09-29 13:56:15.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'a40b4264-0390-48ee-ac73-4aa6fd5708d3', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'9b7aa3aa-5e8d-4b11-ab51-49ddd3955d21', N'2017-09-26 11:36:29.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'a8847912-1f68-4c11-afdd-1f1bb96a8ce0', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'1397726b-eb1a-40d5-ad01-5388fec20cad', N'2017-09-25 16:03:48.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'a8fdf84b-724c-4cde-882c-ced873729bb6', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'57b295a6-90ef-4ac7-9d26-fb1e3c35780f', N'2017-09-26 17:42:41.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ab9f0372-7618-40a2-befe-2db15547e667', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'7bf172e1-4523-4025-b76f-475c7b77884a', N'2017-09-26 14:06:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ac076e23-6dcc-45b2-a7ab-85ad957d3eb6', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'b3347c7e-d0df-4a19-9294-8fd7abe0b187', N'2017-09-25 14:50:18.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ac47934c-c935-46f0-9f34-105cfbb1000b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'2fd9ecc3-305b-472b-ad11-89ec82342302', N'2017-09-26 10:29:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ae6a5548-1007-4e39-b03a-de7f9ee97819', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'859c7267-c143-4b69-b639-a6de96f7ba73', N'2017-09-25 17:39:16.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'aedde01a-dc70-4bb2-8558-a965bd199116', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:40:52.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'af95bf5d-c82d-4d89-a9c7-daf318841eae', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'4d59d261-15a9-4d1d-b8a7-3012b4287fb5', N'2017-09-25 11:03:34.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'b0deec00-7b77-4cd3-82a2-17afdfffb0e7', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'6739e137-78be-4cff-9d0a-d2896a6620cd', N'2017-10-12 15:32:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'b151c362-8037-4b60-82dd-e8030d4962bd', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'f217394f-074f-408e-8c15-8a7ef2ccefc2', N'2017-09-20 11:03:25.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'b1917db1-9e79-4994-a220-8e0ead1eca9b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'09178e07-fc51-4d28-b885-b95f44e60028', N'2017-09-26 11:09:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'b19ca206-55e4-4433-bc92-aa2a41b4c13c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:39:11.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'b6ed26c9-2774-4ded-ac7c-babbba11b4e2', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'8d240da2-7211-44fb-bb00-c83fab1fa95a', N'2017-09-20 10:32:15.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'b7a65e8c-b4f8-4882-b248-f508bcbc3264', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'ec390eab-d188-44ee-9967-b0281087ef11', N'2017-09-28 09:19:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'b81b1af1-5f7f-4e9a-aad9-f17c31437a97', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'535f4e4d-9db2-4738-b3c4-9cd96821206e', N'2017-09-25 15:58:13.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'bb74e396-0433-4313-88b8-6328c19c4f24', N'D6C587E5-D527-4750-874B-66049BE16730', N'test2', N'申请新增', N'db', N'781d7402-728b-4c6b-871a-fccabbf29d68', N'2017-09-21 15:00:32.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'bc144351-eb3d-403d-8c40-4f3f9c8ef9f9', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'4d04e3b1-9827-4ab1-9942-09074498feb2', N'2017-09-19 16:43:09.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'bc988285-4e9c-4768-a34f-9c6f337cdedf', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'96ffc585-078e-4b2f-8574-e2a0dc50fef8', N'2017-09-26 10:47:46.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'be7fce68-dc46-403e-b254-8a110975d1a4', N'9F384FA6-4727-4BC6-B611-DAE615D90051', N'syb', N'申请提交', N'db', N'06a04a1f-638f-47bc-969c-46a0b443fe31', N'2017-09-27 16:28:56.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'bf34c7f8-6e12-47b9-bb08-970ffc6b8695', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'fcbe200d-6aa3-469f-9786-fc99a882a18e', N'2017-09-20 11:39:51.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'c1a438ad-27fa-4f14-9886-af45225b81c6', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'e818c66e-cfa8-4787-8400-4043b7376a36', N'2017-09-30 15:28:53.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'c5be2306-e054-4e0b-aa4d-ecd87e0a0e27', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'74c598b3-cc6d-4915-8b87-520ff6db111e', N'2017-09-26 17:19:10.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'c701e9c2-e9b8-433e-b25e-c7a0ae2b2e24', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'9155e776-11c3-48a1-91f6-311b5632bcfa', N'2017-10-09 17:23:22.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'c791ab13-fb99-42c8-a318-02dc2141e325', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'99b70490-971a-4dfe-822e-9db597e1c130', N'2017-09-26 15:46:32.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'c8732690-c865-4779-9d46-0dc536ed6458', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'e419923d-1926-4201-b909-7204fb716171', N'2017-09-25 14:48:28.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'c8af6c6e-6c4c-4dfe-b293-c4ad37ff2743', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'627f7c29-82ed-45e3-b5d3-dbb483c4395d', N'2017-09-25 15:37:32.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'c96b68e5-cee4-4ae2-8e60-bae19ed66095', N'D6C587E5-D527-4750-874B-66049BE16730', N'test2', N'申请新增', N'db', N'660760c1-9caf-4f19-b5ee-035b9c751983', N'2017-09-21 15:02:06.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'cb32b33d-4297-499b-9c51-dd24ba590435', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'1dc11785-f7e8-4be2-a829-cebb53ffe81f', N'2017-09-26 16:57:27.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'cb730859-ffba-4e61-949e-63d10898bd01', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'86a11cc5-008c-4fed-81cc-39aea578dda7', N'2017-09-25 14:49:47.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'cb94af09-5f64-48a3-8f85-7d60f39e72e0', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'c253e4de-8067-4385-b42d-493b7e40f47a', N'2017-09-28 09:16:42.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'cbe0b67e-81df-494f-9429-7242b050bbf1', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'6ef8818a-82d6-46a8-abdb-c541e54d5a6f', N'2017-09-19 11:07:23.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'cc8e5cb5-ecf4-4ae1-a42d-a00760c82dcd', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'0da8e4df-3f08-4874-b126-ba5fa27c986d', N'2017-10-11 16:25:43.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'cd98648e-bb04-4b70-ac89-b09410056f9c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'2fd9ecc3-305b-472b-ad11-89ec82342302', N'2017-09-26 10:29:58.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'cdf3e976-ca4b-4b00-8ab6-ada1310f23f2', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'372ff633-7cc9-4c2c-9d15-b4afd65b610e', N'2017-09-19 13:58:06.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ce40dac3-9fb4-42f5-88fa-3844f9487638', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'4d59d261-15a9-4d1d-b8a7-3012b4287fb5', N'2017-09-25 14:50:03.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd03e46ae-de61-4c17-890b-dd093dc7631c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'eb8cd6c9-0256-4495-9960-5252099f3265', N'2017-10-13 09:02:08.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd04ba90f-afbb-4bad-8cb4-a973a38953b5', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 18:23:55.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd14d5cb3-1106-4bb6-aa55-8ed06e944150', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'21b1824e-d4d9-4c81-b3f2-8f9e3f80a4d5', N'2017-09-19 11:28:37.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd19076af-b3e3-4da5-a4d6-50a19c3e429a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:15:05.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd1f254bd-1c26-406c-a420-06cb5eb6a53b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'bdd404db-f819-4075-a89c-9257e3105901', N'2017-09-26 14:16:56.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd1fefe0b-7223-4551-9cc1-2a03770f7fb6', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'0fc0a8a7-83bd-4fc1-9375-aa87697bab23', N'2017-09-26 15:04:47.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd3e89eb7-66e6-4f06-969a-0aaf153d93bf', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'701c0311-1943-412c-8f3e-cc5c63faa630', N'2017-09-26 14:00:16.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd4daf3d2-a1aa-421a-a78c-0b31d2905f96', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'9155e776-11c3-48a1-91f6-311b5632bcfa', N'2017-10-09 17:23:20.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd68f5228-0ab2-4082-a59e-548ecabc67c8', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'859c7267-c143-4b69-b639-a6de96f7ba73', N'2017-09-25 17:39:22.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd6adf9f7-d1bf-4e42-b202-4c5b942d5aac', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'1e45595f-53a1-4adb-8335-ec66f021d372', N'2017-09-26 13:57:02.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd6d171c6-3ddd-47e5-bf31-b374facd7db4', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'56996971-63a8-4703-9934-94c95e2a1a1f', N'2017-09-26 16:02:53.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd7c715dd-b780-40e0-a266-7454dc971f3f', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'66ae170c-eaa5-4b96-890f-d45c27a7cf9d', N'2017-09-20 10:39:30.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd929244f-2aef-4d6c-9ac8-9d0fa634b1c4', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:07:32.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'd98f0ac6-d3e3-4754-8b24-e804e7d53955', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'6c592670-18e9-445d-9215-d59c1428f144', N'2017-09-25 13:55:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'dc0c2e57-69f4-434b-8624-1ff8582c3215', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'3d82d793-84d1-4569-87ee-8b795f7fde10', N'2017-09-28 14:18:34.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'de5821e3-7b2d-4028-9c06-819d0e73cde5', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'5ded55c9-2368-4d34-bfe4-de9152d7241e', N'2017-09-20 10:40:52.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'de5f9864-8ccf-4b58-8a4d-9e3fadab8be7', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'be7ee72c-ed01-4100-81e4-395cae028f62', N'2017-09-29 09:15:35.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'df595639-61bd-4a27-8d94-91da01824fc0', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:13:35.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'dfcf6626-c0a6-4991-ac38-561d579ec274', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'3bb5e681-8e71-452a-be45-9c9aa08d729e', N'2017-09-20 10:57:40.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e0dac17c-d2d9-47c2-892f-9ac06e312f88', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'5fb7c5d0-7347-4e91-a177-36f265b6cb5d', N'2017-09-15 17:06:56.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e1492e04-44f7-42d2-84f5-bd9bbde99f76', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'0fc0a8a7-83bd-4fc1-9375-aa87697bab23', N'2017-09-26 15:04:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e157abfd-3f0a-4b7a-b303-393a5ba5159b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'356b42ca-a2f4-4e17-88fc-c6903a4f5ce8', N'2017-09-25 16:03:38.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e29a9cb0-25d2-4022-aac2-054f5c5015c1', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'535f4e4d-9db2-4738-b3c4-9cd96821206e', N'2017-09-25 16:03:41.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e2f07505-1030-4d03-a81d-0e8c2925c62a', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'b7386298-158d-4a3c-9bc8-b1920b2ecce5', N'2017-09-29 14:28:26.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e62606a3-de28-42d2-bcf3-a96c6474792d', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'46b56d9c-15ca-4666-8f4b-d8f0ce840428', N'2017-09-25 15:32:37.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e7ed4c7b-decc-425f-85f7-c9b2f40b9fed', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'338321eb-2ca9-4007-a095-112270729cde', N'2017-09-29 13:56:12.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e8a95501-9191-4b57-bc8d-a6c80a77d453', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'3edac4a6-859c-4ab5-93ff-439ce0fe8fa1', N'2017-10-11 18:02:44.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'e9009995-6d27-40e9-90f7-1acb8687a729', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'bfc5aa0a-bb01-432a-b06d-e6c6cc67491c', N'2017-10-12 09:22:02.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ea5ba374-d5d1-40ae-98bb-492b5687999c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'3c64362a-645a-49ac-8679-3ea94d04282c', N'2017-09-19 16:27:52.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'eb00c150-0d31-4c13-a040-d70671a35ce5', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'8c5efc5b-a176-41f3-8119-fa4f1fe0f8c4', N'2017-09-22 16:48:31.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'eb53d431-ca02-434b-8ed5-56910e3a5f77', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'fb5232aa-5382-4862-9f94-ea37e79ddc3c', N'2017-09-25 10:57:48.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'eb61bb81-4b4a-4a9c-b4cb-209f37a10e3e', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'e818c66e-cfa8-4787-8400-4043b7376a36', N'2017-10-09 09:02:48.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ebaa578b-5bf6-4fb9-8153-23fc30230c63', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'74c598b3-cc6d-4915-8b87-520ff6db111e', N'2017-09-26 17:19:12.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'eca46060-d71d-4688-8abe-6013ac6c5b7c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'23c42b7f-7c2c-489a-8f1f-db088dc7db28', N'2017-09-25 16:17:27.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'eca7e01b-8a42-4689-b061-5108febaabf4', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'ef3a1ae9-89a6-42f5-a4ce-4d3d970e2a40', N'2017-09-26 14:20:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ee92cffb-478b-49a0-a8ae-8cf8b6aa7439', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'95514ceb-6645-4bc9-9c11-b7abf105c44f', N'2017-09-25 13:57:49.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'efca29eb-ae3d-47bd-9021-0e362c9bc5ad', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'b7386298-158d-4a3c-9bc8-b1920b2ecce5', N'2017-09-29 14:28:28.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'f2fe8b12-fbb5-431b-8e62-c6337482fe6b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'b563dfb8-1392-4e55-a5e8-05e213c8d7ac', N'2017-10-11 15:47:49.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'f325c1d0-a9fa-40ef-b49d-5d11cb3b217b', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'485f6e16-5f3b-45d2-a82e-d841fdb71ca6', N'2017-10-13 09:09:02.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'f33b3769-f7fa-4fc4-82c9-0affd5b15024', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'2efccc0c-a509-4f86-b1fd-8283306bbeb0', N'2017-09-19 11:08:07.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'f494f24a-b25d-428c-89eb-1c5ceb8b2c05', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'3d82d793-84d1-4569-87ee-8b795f7fde10', N'2017-09-25 15:16:42.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'f4a17900-b265-4629-b5fe-465a9f5fdee1', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'0da8e4df-3f08-4874-b126-ba5fa27c986d', N'2017-10-11 16:26:10.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'f69c976d-7aeb-41f3-afc9-ae2f41a98eb9', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'a6246518-5d2a-48eb-abb5-b28a2fee1082', N'2017-09-25 11:33:50.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'f9d32fa2-e7e2-417e-9e6d-55afc59e8c62', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表新增', N'db', N'e6e42bd3-2260-4a4d-9e9a-221d7a2fcefd', N'2017-09-25 15:01:12.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'fa5af81e-6200-4276-bb84-528a8b407c94', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'评测表删除', N'db', N'a6246518-5d2a-48eb-abb5-b28a2fee1082', N'2017-09-25 14:50:12.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'fac67375-d096-4c00-af20-3d66433e7e3c', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'6c592670-18e9-445d-9215-d59c1428f144', N'2017-09-25 13:57:34.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'fd925f06-7892-4095-8d1d-4b78a4b30d47', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'字典新增', N'db', N'b077e185-f80d-46c3-9a7e-37d237b128a3', N'2017-09-26 17:11:40.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'fe57a156-24e7-4449-8634-2e0cd65383f3', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请提交', N'db', N'81ea80c9-bad1-45f4-aa0e-354832a54b8c', N'2017-10-10 13:33:28.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ffd9151e-9d30-43ca-99a5-84646e3b6584', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'86f95230-b1ff-4c0e-8889-42d92f5954d1', N'2017-09-29 17:28:34.000')
GO
GO
INSERT INTO [dbo].[SYS_LOG] ([ID], [userId], [userName], [type], [level], [msg], [createdTime]) VALUES (N'ffe5163b-687d-4ec7-b82a-d0ba9eb57bac', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', N'申请新增', N'db', N'0afa3d68-33e3-4a26-b474-0e13c9009b48', N'2017-09-27 14:46:36.000')
GO
GO

-- ----------------------------
-- Table structure for t_ability
-- ----------------------------
DROP TABLE [dbo].[t_ability]
GO
CREATE TABLE [dbo].[t_ability] (
[ID] varchar(36) NOT NULL ,
[userId] varchar(36) NULL ,
[sys_abilityId] varchar(36) NULL ,
[name] varchar(200) NULL ,
[typeId] varchar(36) NULL ,
[Serial] varchar(100) NULL ,
[TheLevel] varchar(100) NULL ,
[evidence] varchar(2000) NULL ,
[description] varchar(4000) NULL ,
[Score] float(53) NULL ,
[formula] varchar(36) NULL ,
[scoring] float(53) NULL ,
[passmark] float(53) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL 
)


GO

-- ----------------------------
-- Records of t_ability
-- ----------------------------

-- ----------------------------
-- Table structure for t_ability_evaluate
-- ----------------------------
DROP TABLE [dbo].[t_ability_evaluate]
GO
CREATE TABLE [dbo].[t_ability_evaluate] (
[ID] varchar(36) NOT NULL ,
[abilityId] varchar(36) NULL ,
[evaluationformId] varchar(36) NULL ,
[assessorId] varchar(36) NULL ,
[assessor] varchar(36) NULL ,
[scoring] float(53) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL 
)


GO

-- ----------------------------
-- Records of t_ability_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for T_Apply
-- ----------------------------
DROP TABLE [dbo].[T_Apply]
GO
CREATE TABLE [dbo].[T_Apply] (
[id] nvarchar(50) NOT NULL ,
[No] nvarchar(50) NULL ,
[Type] nvarchar(20) NULL ,
[Seq] nvarchar(50) NULL ,
[Grade] nvarchar(50) NULL ,
[UserId] nvarchar(50) NULL ,
[UserName] nvarchar(50) NULL ,
[DeptCode] nvarchar(50) NULL ,
[DeptName] nvarchar(50) NULL ,
[Status] nvarchar(8) NULL ,
[FlowStatus] nvarchar(8) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL ,
[UnqualifiedQualifications] nvarchar(500) NULL ,
[AbnormalityReasons] nvarchar(500) NULL ,
[QualificationMatching] nvarchar(1000) NULL ,
[GraduateSchool] nvarchar(50) NULL ,
[majors] nvarchar(50) NULL ,
[Educational] nvarchar(50) NULL ,
[degree] nvarchar(50) NULL ,
[Experience] nvarchar(1000) NULL ,
[StandardsMatching] nvarchar(1000) NULL ,
[JobsType] nvarchar(50) NULL ,
[JobsGrade] nvarchar(20) NULL ,
[HaveQualificationSeq] nvarchar(50) NULL ,
[HaveQualificationGrade] nvarchar(50) NULL ,
[HaveQualificationGrade_Time] nvarchar(50) NULL ,
[WorkConditionsSeq] nvarchar(50) NULL ,
[WorkConditionsGrade] nvarchar(50) NULL ,
[WorkConditionsGrade_annual] nvarchar(20) NULL ,
[NuclearResultsFront] nvarchar(8) NULL ,
[NuclearResultsFront_annual] nvarchar(20) NULL ,
[ImprovementPlanClosedloop] bit NULL ,
[processId] varchar(36) NULL ,
[submitTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'No')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请单号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'No'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请单号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'No'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'Type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'Seq')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'序列'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Seq'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'序列'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Seq'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'Grade')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Grade'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Grade'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'UserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请人Guid'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'UserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请人Guid'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'UserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'UserName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请人姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'UserName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请人姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'UserName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'DeptCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'部门编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'DeptCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'DeptCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'DeptName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'部门名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'DeptName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'DeptName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'Status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态： 0： 草稿    1：已提交  2：审批完成   X：删除  T：退回'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态： 0： 草稿    1：已提交  2：审批完成   X：删除  T：退回'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'FlowStatus')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作流状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'FlowStatus'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作流状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'FlowStatus'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'UnqualifiedQualifications')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'不满足的任职资格申请条件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'UnqualifiedQualifications'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'不满足的任职资格申请条件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'UnqualifiedQualifications'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'AbnormalityReasons')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'破格原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'AbnormalityReasons'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'破格原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'AbnormalityReasons'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'QualificationMatching')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申报任职资格级别典型能力满足情况'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'QualificationMatching'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申报任职资格级别典型能力满足情况'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'QualificationMatching'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'GraduateSchool')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'毕业学校'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'GraduateSchool'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'毕业学校'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'GraduateSchool'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'majors')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'专业'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'majors'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'专业'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'majors'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'Educational')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'学历'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Educational'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'学历'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Educational'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'degree')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'学位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'degree'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'学位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'degree'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'Experience')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经历简诉'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Experience'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经历简诉'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'Experience'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'StandardsMatching')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'社会标准满足情况'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'StandardsMatching'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'社会标准满足情况'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'StandardsMatching'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'JobsType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'岗位职种'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'JobsType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'岗位职种'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'JobsType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'JobsGrade')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'岗位层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'JobsGrade'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'岗位层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'JobsGrade'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'HaveQualificationSeq')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'任职资格序列'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'HaveQualificationSeq'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'任职资格序列'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'HaveQualificationSeq'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'HaveQualificationGrade')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'任职资格级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'HaveQualificationGrade'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'任职资格级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'HaveQualificationGrade'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'HaveQualificationGrade_Time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'取得资格时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'HaveQualificationGrade_Time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'取得资格时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'HaveQualificationGrade_Time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'WorkConditionsSeq')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上岗条件序列'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'WorkConditionsSeq'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上岗条件序列'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'WorkConditionsSeq'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'WorkConditionsGrade')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上岗条件层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'WorkConditionsGrade'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上岗条件层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'WorkConditionsGrade'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'WorkConditionsGrade_annual')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上岗条件年度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'WorkConditionsGrade_annual'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上岗条件年度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'WorkConditionsGrade_annual'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'NuclearResultsFront')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'取得资格时间后年度考核结果是否有优秀或排序靠前   0:否 1：是'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'NuclearResultsFront'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'取得资格时间后年度考核结果是否有优秀或排序靠前   0:否 1：是'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'NuclearResultsFront'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'NuclearResultsFront_annual')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'取得资格时间后年度考核结果是否有优秀或排序靠前的年度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'NuclearResultsFront_annual'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'取得资格时间后年度考核结果是否有优秀或排序靠前的年度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'NuclearResultsFront_annual'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'ImprovementPlanClosedloop')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'改进计划是否闭环  0：否 1：是'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'ImprovementPlanClosedloop'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'改进计划是否闭环  0：否 1：是'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'ImprovementPlanClosedloop'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'processId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'流程id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'processId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'流程id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'processId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply', 
'COLUMN', N'submitTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'提交时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'submitTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'提交时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply'
, @level2type = 'COLUMN', @level2name = N'submitTime'
GO

-- ----------------------------
-- Records of T_Apply
-- ----------------------------
INSERT INTO [dbo].[T_Apply] ([id], [No], [Type], [Seq], [Grade], [UserId], [UserName], [DeptCode], [DeptName], [Status], [FlowStatus], [DateTimeCreated], [DateTimeModified], [isDeleted], [UnqualifiedQualifications], [AbnormalityReasons], [QualificationMatching], [GraduateSchool], [majors], [Educational], [degree], [Experience], [StandardsMatching], [JobsType], [JobsGrade], [HaveQualificationSeq], [HaveQualificationGrade], [HaveQualificationGrade_Time], [WorkConditionsSeq], [WorkConditionsGrade], [WorkConditionsGrade_annual], [NuclearResultsFront], [NuclearResultsFront_annual], [ImprovementPlanClosedloop], [processId], [submitTime]) VALUES (N'e4fee62b-aeae-4d7d-af31-8537f0214689', null, N'04', N'01', N'01', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', null, null, N'已通过', null, N'2017-10-12 15:20:43.997', N'2017-10-12 15:20:43.997', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'132', N'12', N'', N'', N'2017-10-28', N'', N'', N'', N'on', N'', N'1', N'9', N'2017-10-12 15:20:46.007')
GO
GO
INSERT INTO [dbo].[T_Apply] ([id], [No], [Type], [Seq], [Grade], [UserId], [UserName], [DeptCode], [DeptName], [Status], [FlowStatus], [DateTimeCreated], [DateTimeModified], [isDeleted], [UnqualifiedQualifications], [AbnormalityReasons], [QualificationMatching], [GraduateSchool], [majors], [Educational], [degree], [Experience], [StandardsMatching], [JobsType], [JobsGrade], [HaveQualificationSeq], [HaveQualificationGrade], [HaveQualificationGrade_Time], [WorkConditionsSeq], [WorkConditionsGrade], [WorkConditionsGrade_annual], [NuclearResultsFront], [NuclearResultsFront_annual], [ImprovementPlanClosedloop], [processId], [submitTime]) VALUES (N'eb8cd6c9-0256-4495-9960-5252099f3265', null, N'01', N'01', N'01', N'4F772301-F3AB-4165-94BE-F10FAB0E7B60', N'test', null, null, N'已通过', null, N'2017-10-12 16:27:41.570', N'2017-10-12 16:27:41.570', N'0', N'', N'', N'', N'', N'', N'', N'', N'12', N'12', N'21', N'12', N'', N'', N'2017-10-28', N'', N'', N'2014', N'on', N'', N'1', N'2501', N'2017-10-13 09:02:08.097')
GO
GO

-- ----------------------------
-- Table structure for T_Apply_CheckDetail
-- ----------------------------
DROP TABLE [dbo].[T_Apply_CheckDetail]
GO
CREATE TABLE [dbo].[T_Apply_CheckDetail] (
[id] nvarchar(50) NOT NULL ,
[applyId] nvarchar(50) NULL ,
[nodeName] nvarchar(50) NULL ,
[result] bit NULL ,
[opinion] nvarchar(500) NULL ,
[createdTime] varchar(36) NULL ,
[userId] nvarchar(50) NULL ,
[userName] nvarchar(50) NULL ,
[taskId] nvarchar(50) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply_CheckDetail', 
'COLUMN', N'applyId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请id或测评表Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply_CheckDetail'
, @level2type = 'COLUMN', @level2name = N'applyId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请id或测评表Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply_CheckDetail'
, @level2type = 'COLUMN', @level2name = N'applyId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply_CheckDetail', 
'COLUMN', N'result')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审批结果 agree: 同意    disagree：不同意'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply_CheckDetail'
, @level2type = 'COLUMN', @level2name = N'result'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审批结果 agree: 同意    disagree：不同意'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply_CheckDetail'
, @level2type = 'COLUMN', @level2name = N'result'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Apply_CheckDetail', 
'COLUMN', N'opinion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审批意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply_CheckDetail'
, @level2type = 'COLUMN', @level2name = N'opinion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审批意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Apply_CheckDetail'
, @level2type = 'COLUMN', @level2name = N'opinion'
GO

-- ----------------------------
-- Records of T_Apply_CheckDetail
-- ----------------------------

-- ----------------------------
-- Table structure for T_Attachment_File
-- ----------------------------
DROP TABLE [dbo].[T_Attachment_File]
GO
CREATE TABLE [dbo].[T_Attachment_File] (
[Guid] nvarchar(50) NOT NULL ,
[UserGuid] nvarchar(50) NULL ,
[IsFolder] int NULL ,
[PId] nvarchar(50) NULL ,
[FileName] nvarchar(50) NULL ,
[FriendlyFileName] nvarchar(80) NULL ,
[FileContentType] nvarchar(80) NULL ,
[FileSize] int NULL ,
[FileAccessPath] nvarchar(300) NULL ,
[FilePhysicalPath] nvarchar(300) NULL ,
[CreateTime] datetime NULL ,
[CreateUserId] nvarchar(50) NULL ,
[IsDeleted] int NULL ,
[description] nvarchar(2000) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'UserGuid')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户Guid'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'UserGuid'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户Guid'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'UserGuid'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'IsFolder')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否文件夹  0：否  1：是'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'IsFolder'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否文件夹  0：否  1：是'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'IsFolder'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'PId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父节点  根节点为null'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'PId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父节点  根节点为null'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'PId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'FileName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'唯一文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'唯一文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'FriendlyFileName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'真实文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FriendlyFileName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'真实文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FriendlyFileName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'FileContentType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileContentType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileContentType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'FileSize')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件大小'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileSize'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件大小'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileSize'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'FileAccessPath')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件访问路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileAccessPath'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件访问路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FileAccessPath'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'FilePhysicalPath')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件物理路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FilePhysicalPath'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件物理路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'FilePhysicalPath'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_Attachment_File', 
'COLUMN', N'IsDeleted')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'0: 正常  1：删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'IsDeleted'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'0: 正常  1：删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_Attachment_File'
, @level2type = 'COLUMN', @level2name = N'IsDeleted'
GO

-- ----------------------------
-- Records of T_Attachment_File
-- ----------------------------

-- ----------------------------
-- Table structure for t_Attachment_File_relation
-- ----------------------------
DROP TABLE [dbo].[t_Attachment_File_relation]
GO
CREATE TABLE [dbo].[t_Attachment_File_relation] (
[id] varchar(36) NOT NULL ,
[ywId] varchar(36) NOT NULL ,
[fileId] varchar(36) NOT NULL 
)


GO

-- ----------------------------
-- Records of t_Attachment_File_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_evaluateform_opinion
-- ----------------------------
DROP TABLE [dbo].[t_evaluateform_opinion]
GO
CREATE TABLE [dbo].[t_evaluateform_opinion] (
[ID] varchar(36) NOT NULL ,
[evaluationformId] varchar(36) NULL ,
[assessorId] varchar(36) NULL ,
[assessor] varchar(36) NULL ,
[opinion] varchar(2000) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL 
)


GO

-- ----------------------------
-- Records of t_evaluateform_opinion
-- ----------------------------

-- ----------------------------
-- Table structure for t_evaluationform
-- ----------------------------
DROP TABLE [dbo].[t_evaluationform]
GO
CREATE TABLE [dbo].[t_evaluationform] (
[ID] varchar(36) NOT NULL ,
[userId] varchar(36) NULL ,
[sysFormId] varchar(36) NOT NULL ,
[name] varchar(200) NULL ,
[Serial] varchar(100) NULL ,
[level] varchar(100) NULL ,
[version] varchar(100) NULL ,
[status] nvarchar(10) NULL ,
[total] float(53) NULL ,
[scoring] float(53) NULL ,
[passmark] float(53) NULL ,
[assessorNumber] int NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL ,
[standardFile] varchar(200) NULL ,
[applyId] varchar(36) NULL ,
[submitTime] datetime NULL ,
[processId] varchar(36) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_evaluationform', 
'COLUMN', N'applyId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申报ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_evaluationform'
, @level2type = 'COLUMN', @level2name = N'applyId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申报ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_evaluationform'
, @level2type = 'COLUMN', @level2name = N'applyId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_evaluationform', 
'COLUMN', N'processId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'流程id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_evaluationform'
, @level2type = 'COLUMN', @level2name = N'processId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'流程id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_evaluationform'
, @level2type = 'COLUMN', @level2name = N'processId'
GO

-- ----------------------------
-- Records of t_evaluationform
-- ----------------------------

-- ----------------------------
-- Table structure for t_evaluationform_ability
-- ----------------------------
DROP TABLE [dbo].[t_evaluationform_ability]
GO
CREATE TABLE [dbo].[t_evaluationform_ability] (
[ID] varchar(36) NOT NULL ,
[evaluationformId] varchar(36) NULL ,
[abilityId] varchar(36) NULL 
)


GO

-- ----------------------------
-- Records of t_evaluationform_ability
-- ----------------------------

-- ----------------------------
-- Table structure for t_exam
-- ----------------------------
DROP TABLE [dbo].[t_exam]
GO
CREATE TABLE [dbo].[t_exam] (
[id] nvarchar(50) NOT NULL ,
[name] nvarchar(20) NULL ,
[kind] nvarchar(50) NULL ,
[date] nvarchar(50) NULL ,
[score] nvarchar(50) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL ,
[seq] nvarchar(50) NULL ,
[level] nvarchar(50) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_exam', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考试人姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考试人姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_exam', 
'COLUMN', N'kind')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考试类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'kind'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考试类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'kind'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_exam', 
'COLUMN', N'date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考试时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考试时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'date'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_exam', 
'COLUMN', N'score')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考试成绩'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'score'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考试成绩'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_exam'
, @level2type = 'COLUMN', @level2name = N'score'
GO

-- ----------------------------
-- Records of t_exam
-- ----------------------------
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'12cbbe81-f752-4138-8344-056bcf350461', N'李四', N'政治', N'2017-09-15', N'100', null, N'2017-09-25 10:24:46.727', N'1', null, null)
GO
GO
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'2f9f06c9-af19-433c-a3c2-b4b36fa18745', N'王五', N'xxx', N'2017-09-19', N'99', null, N'2017-09-25 09:25:44.470', null, null, null)
GO
GO
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'3bb5e681-8e71-452a-be45-9c9aa08d729e', N'1234', N'124', N'2017-09-19', N'124', N'2017-09-20 10:57:40.907', null, N'1', null, null)
GO
GO
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'76947438-f6c8-4377-875e-ad3040e7bdb1', N'张三', N'xxx', N'2017-09-19', N'100', null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'90d0232d-bfae-4de1-8a6a-149cfc740bef', N'xxxxx', null, N'2017-09-16', N'66', N'2017-09-26 14:28:03.770', null, null, N'02', null)
GO
GO
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'e0d4b42e-0ca9-458b-98ee-8b3367ca69ad', N'老二', N'xxx', N'2017-09-19', N'98', null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'f217394f-074f-408e-8c15-8a7ef2ccefc2', N'1324', N'1235', N'2017-09-19', N'1235', N'2017-09-20 11:03:25.740', N'2017-09-20 11:40:48.293', N'1', null, null)
GO
GO
INSERT INTO [dbo].[t_exam] ([id], [name], [kind], [date], [score], [DateTimeCreated], [DateTimeModified], [isDeleted], [seq], [level]) VALUES (N'fcbe200d-6aa3-469f-9786-fc99a882a18e', N'123', null, N'', N'123', N'2017-09-20 11:39:51.227', null, N'1', null, null)
GO
GO

-- ----------------------------
-- Table structure for t_plan_manager
-- ----------------------------
DROP TABLE [dbo].[t_plan_manager]
GO
CREATE TABLE [dbo].[t_plan_manager] (
[id] nvarchar(50) NOT NULL ,
[name] nvarchar(50) NULL ,
[type] nvarchar(50) NULL ,
[serial] nvarchar(50) NULL ,
[level] nvarchar(50) NULL ,
[status] nvarchar(50) NULL ,
[starttime] nvarchar(50) NULL ,
[endtime] nvarchar(50) NULL ,
[DateTimeCreated] datetime NULL ,
[DateTimeModified] datetime NULL ,
[isDeleted] bit NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_plan_manager', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'计划名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_plan_manager'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'计划名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_plan_manager'
, @level2type = 'COLUMN', @level2name = N'name'
GO

-- ----------------------------
-- Records of t_plan_manager
-- ----------------------------

-- ----------------------------
-- Function structure for DicDecode
-- ----------------------------
DROP FUNCTION [dbo].[DicDecode]
GO
CREATE FUNCTION [dbo].[DicDecode]
( @kind AS varchar(100) ,
  @code AS varchar(100) 
)
RETURNS NVARCHAR(100)
WITH RETURNS NULL ON NULL INPUT 
AS
BEGIN
	Declare @detail NVARCHAR(100)

	Select @detail=detail from RS_Dictionary where kind=@kind and code=@code

  RETURN @detail
END
GO

-- ----------------------------
-- Indexes structure for table ACT_EVT_LOG
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_EVT_LOG
-- ----------------------------
ALTER TABLE [dbo].[ACT_EVT_LOG] ADD PRIMARY KEY ([LOG_NR_])
GO

-- ----------------------------
-- Indexes structure for table ACT_GE_BYTEARRAY
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE [dbo].[ACT_GE_BYTEARRAY] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_GE_PROPERTY
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_GE_PROPERTY
-- ----------------------------
ALTER TABLE [dbo].[ACT_GE_PROPERTY] ADD PRIMARY KEY ([NAME_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_ACTINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_ACT_INST_START] ON [dbo].[ACT_HI_ACTINST]
([START_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_ACT_INST_END] ON [dbo].[ACT_HI_ACTINST]
([END_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_ACT_INST_PROCINST] ON [dbo].[ACT_HI_ACTINST]
([PROC_INST_ID_] ASC, [ACT_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_ACT_INST_EXEC] ON [dbo].[ACT_HI_ACTINST]
([EXECUTION_ID_] ASC, [ACT_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_ACTINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_ACTINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_ATTACHMENT] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_HI_COMMENT
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_COMMENT] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_DETAIL
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_DETAIL_PROC_INST] ON [dbo].[ACT_HI_DETAIL]
([PROC_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_ACT_INST] ON [dbo].[ACT_HI_DETAIL]
([ACT_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_TIME] ON [dbo].[ACT_HI_DETAIL]
([TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_NAME] ON [dbo].[ACT_HI_DETAIL]
([NAME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_TASK_ID] ON [dbo].[ACT_HI_DETAIL]
([TASK_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_DETAIL
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_DETAIL] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_IDENTITYLINK
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_IDENT_LNK_USER] ON [dbo].[ACT_HI_IDENTITYLINK]
([USER_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_IDENT_LNK_TASK] ON [dbo].[ACT_HI_IDENTITYLINK]
([TASK_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_IDENT_LNK_PROCINST] ON [dbo].[ACT_HI_IDENTITYLINK]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_IDENTITYLINK
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_IDENTITYLINK] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_PROCINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_PRO_INST_END] ON [dbo].[ACT_HI_PROCINST]
([END_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_PRO_I_BUSKEY] ON [dbo].[ACT_HI_PROCINST]
([BUSINESS_KEY_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_PROCINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_PROCINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Uniques structure for table ACT_HI_PROCINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_PROCINST] ADD UNIQUE ([PROC_INST_ID_] ASC)
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_TASKINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_TASK_INST_PROCINST] ON [dbo].[ACT_HI_TASKINST]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_TASKINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_TASKINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_VARINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_PROCVAR_PROC_INST] ON [dbo].[ACT_HI_VARINST]
([PROC_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_PROCVAR_NAME_TYPE] ON [dbo].[ACT_HI_VARINST]
([NAME_] ASC, [VAR_TYPE_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_PROCVAR_TASK_ID] ON [dbo].[ACT_HI_VARINST]
([TASK_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_VARINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_VARINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_GROUP
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_GROUP] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_INFO
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_INFO
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_INFO] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_MEMBERSHIP
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_MEMBERSHIP
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] ADD PRIMARY KEY ([USER_ID_], [GROUP_ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_USER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_USER
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_USER] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_PROCDEF_INFO
-- ----------------------------
CREATE INDEX [ACT_IDX_INFO_PROCDEF] ON [dbo].[ACT_PROCDEF_INFO]
([PROC_DEF_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_PROCDEF_INFO
-- ----------------------------
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Uniques structure for table ACT_PROCDEF_INFO
-- ----------------------------
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD UNIQUE ([PROC_DEF_ID_] ASC)
GO

-- ----------------------------
-- Indexes structure for table ACT_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_RE_DEPLOYMENT
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_DEPLOYMENT] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RE_MODEL
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_RE_MODEL
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_RE_PROCDEF
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_PROCDEF] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Uniques structure for table ACT_RE_PROCDEF
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_PROCDEF] ADD UNIQUE ([KEY_] ASC, [VERSION_] ASC, [TENANT_ID_] ASC)
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_EVENT_SUBSCR
-- ----------------------------
CREATE INDEX [ACT_IDX_EVENT_SUBSCR_CONFIG_] ON [dbo].[ACT_RU_EVENT_SUBSCR]
([CONFIGURATION_] ASC) 
GO
CREATE INDEX [ACT_IDX_EVENT_SUBSCR_EXEC_ID] ON [dbo].[ACT_RU_EVENT_SUBSCR]
([EXECUTION_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EVENT_SUBSCR] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_EXECUTION
-- ----------------------------
CREATE INDEX [ACT_IDX_EXEC_BUSKEY] ON [dbo].[ACT_RU_EXECUTION]
([BUSINESS_KEY_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_PROC] ON [dbo].[ACT_RU_EXECUTION]
([PROC_DEF_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_PARENT] ON [dbo].[ACT_RU_EXECUTION]
([PARENT_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_SUPER] ON [dbo].[ACT_RU_EXECUTION]
([SUPER_EXEC_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_IDANDREV] ON [dbo].[ACT_RU_EXECUTION]
([ID_] ASC, [REV_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXEC_PROC_INST_ID] ON [dbo].[ACT_RU_EXECUTION]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_EXECUTION
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_IDENTITYLINK
-- ----------------------------
CREATE INDEX [ACT_IDX_IDENT_LNK_USER] ON [dbo].[ACT_RU_IDENTITYLINK]
([USER_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_IDENT_LNK_GROUP] ON [dbo].[ACT_RU_IDENTITYLINK]
([GROUP_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_ATHRZ_PROCEDEF] ON [dbo].[ACT_RU_IDENTITYLINK]
([PROC_DEF_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_IDENT_LNK_TASK] ON [dbo].[ACT_RU_IDENTITYLINK]
([TASK_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_IDENT_LNK_PROCINST] ON [dbo].[ACT_RU_IDENTITYLINK]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_IDENTITYLINK
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_JOB
-- ----------------------------
CREATE INDEX [ACT_IDX_JOB_EXCEPTION_STACK_ID] ON [dbo].[ACT_RU_JOB]
([EXCEPTION_STACK_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_JOB
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_JOB] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_TASK
-- ----------------------------
CREATE INDEX [ACT_IDX_TASK_CREATE] ON [dbo].[ACT_RU_TASK]
([CREATE_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_TASK_EXEC] ON [dbo].[ACT_RU_TASK]
([EXECUTION_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_TASK_PROCINST] ON [dbo].[ACT_RU_TASK]
([PROC_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_TASK_PROC_DEF_ID] ON [dbo].[ACT_RU_TASK]
([PROC_DEF_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_TASK
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_TASK] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_VARIABLE
-- ----------------------------
CREATE INDEX [ACT_IDX_VARIABLE_TASK_ID] ON [dbo].[ACT_RU_VARIABLE]
([TASK_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_VARIABLE_BA] ON [dbo].[ACT_RU_VARIABLE]
([BYTEARRAY_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_VARIABLE_EXEC] ON [dbo].[ACT_RU_VARIABLE]
([EXECUTION_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_VARIABLE_PROCINST] ON [dbo].[ACT_RU_VARIABLE]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_VARIABLE
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table AD_Group
-- ----------------------------
CREATE INDEX [NCL_AD_Group_dn] ON [dbo].[AD_Group]
([distinguishedName] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_Group_name] ON [dbo].[AD_Group]
([name] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_Group_ParentId] ON [dbo].[AD_Group]
([ParentId] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_Group_Path] ON [dbo].[AD_Group]
([path] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_Group_Sid] ON [dbo].[AD_Group]
([objectSid] ASC) 
WITH (FILLFACTOR = 70)
GO

-- ----------------------------
-- Primary Key structure for table AD_Group
-- ----------------------------
ALTER TABLE [dbo].[AD_Group] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table AD_GroupMember
-- ----------------------------
CREATE INDEX [NCL_AD_GroupMember_dn] ON [dbo].[AD_GroupMember]
([MemberDn] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_GroupMember_GroupId] ON [dbo].[AD_GroupMember]
([GroupId] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_GroupMember_MemberId] ON [dbo].[AD_GroupMember]
([MemberId] ASC) 
WITH (FILLFACTOR = 70)
GO

-- ----------------------------
-- Primary Key structure for table AD_GroupMember
-- ----------------------------
ALTER TABLE [dbo].[AD_GroupMember] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table AD_Object
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AD_Object
-- ----------------------------
ALTER TABLE [dbo].[AD_Object] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table AD_OrganizationalUnit
-- ----------------------------
CREATE INDEX [NCL_AD_OU_ParentId] ON [dbo].[AD_OrganizationalUnit]
([ParentId] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_OU_name] ON [dbo].[AD_OrganizationalUnit]
([name] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_OU_path] ON [dbo].[AD_OrganizationalUnit]
([path] ASC) 
WITH (FILLFACTOR = 70)
GO

-- ----------------------------
-- Primary Key structure for table AD_OrganizationalUnit
-- ----------------------------
ALTER TABLE [dbo].[AD_OrganizationalUnit] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table AD_SyncRuleout
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AD_SyncRuleout
-- ----------------------------
ALTER TABLE [dbo].[AD_SyncRuleout] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table AD_User
-- ----------------------------
CREATE INDEX [NCL_AD_User_ParentId] ON [dbo].[AD_User]
([ParentId] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_User_dn] ON [dbo].[AD_User]
([distinguishedName] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_User_account] ON [dbo].[AD_User]
([sAMAccountName] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_User_pname] ON [dbo].[AD_User]
([userPrincipalName] ASC) 
WITH (FILLFACTOR = 70)
GO
CREATE INDEX [NCL_AD_User_path] ON [dbo].[AD_User]
([path] ASC) 
WITH (FILLFACTOR = 70)
GO

-- ----------------------------
-- Primary Key structure for table AD_User
-- ----------------------------
ALTER TABLE [dbo].[AD_User] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_Dictionary
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_Dictionary
-- ----------------------------
ALTER TABLE [dbo].[RS_Dictionary] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table RS_Organization
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_Organization
-- ----------------------------
ALTER TABLE [dbo].[RS_Organization] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_OrganizationDepth
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_OrganizationDepth
-- ----------------------------
ALTER TABLE [dbo].[RS_OrganizationDepth] ADD PRIMARY KEY ([ChildId], [ParentId])
GO

-- ----------------------------
-- Indexes structure for table RS_OrganizationType
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_OrganizationType
-- ----------------------------
ALTER TABLE [dbo].[RS_OrganizationType] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_OrganizationUser
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_OrganizationUser
-- ----------------------------
ALTER TABLE [dbo].[RS_OrganizationUser] ADD PRIMARY KEY ([OrganizationId], [UserId])
GO

-- ----------------------------
-- Indexes structure for table RS_Permission
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_Permission
-- ----------------------------
ALTER TABLE [dbo].[RS_Permission] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_PermissionLevel
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_PermissionLevel
-- ----------------------------
ALTER TABLE [dbo].[RS_PermissionLevel] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_PermissionResource
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_PermissionResource
-- ----------------------------
ALTER TABLE [dbo].[RS_PermissionResource] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_resource
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_resource
-- ----------------------------
ALTER TABLE [dbo].[RS_resource] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table RS_Role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_Role
-- ----------------------------
ALTER TABLE [dbo].[RS_Role] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_RoleDepth
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_RoleDepth
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleDepth] ADD PRIMARY KEY ([ChildId], [ParentId])
GO

-- ----------------------------
-- Indexes structure for table RS_RoleResource
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_RoleResource
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleResource] ADD PRIMARY KEY ([roleId], [resourceId])
GO

-- ----------------------------
-- Indexes structure for table RS_RoleRole
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_RoleRole
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleRole] ADD PRIMARY KEY ([ParentId], [ChildId])
GO

-- ----------------------------
-- Indexes structure for table RS_RoleType
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_RoleType
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleType] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_RoleUser
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_RoleUser
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleUser] ADD PRIMARY KEY ([RoleId], [UserId])
GO

-- ----------------------------
-- Indexes structure for table RS_User
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_User
-- ----------------------------
ALTER TABLE [dbo].[RS_User] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_UserAvatar
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_UserAvatar
-- ----------------------------
ALTER TABLE [dbo].[RS_UserAvatar] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table RS_UserPrincipal
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_UserPrincipal
-- ----------------------------
ALTER TABLE [dbo].[RS_UserPrincipal] ADD PRIMARY KEY ([UserId], [PrincipalId])
GO

-- ----------------------------
-- Indexes structure for table RS_userProfile
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_userProfile
-- ----------------------------
ALTER TABLE [dbo].[RS_userProfile] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table RS_UserResume
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table RS_UserResume
-- ----------------------------
ALTER TABLE [dbo].[RS_UserResume] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_ability
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_ability
-- ----------------------------
ALTER TABLE [dbo].[sys_ability] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_evaluationform
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_evaluationform
-- ----------------------------
ALTER TABLE [dbo].[sys_evaluationform] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_evaluationform_ability
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_evaluationform_ability
-- ----------------------------
ALTER TABLE [dbo].[sys_evaluationform_ability] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table SYS_LOG
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table SYS_LOG
-- ----------------------------
ALTER TABLE [dbo].[SYS_LOG] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table t_ability
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_ability
-- ----------------------------
ALTER TABLE [dbo].[t_ability] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table t_ability_evaluate
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_ability_evaluate
-- ----------------------------
ALTER TABLE [dbo].[t_ability_evaluate] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table T_Apply
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_Apply
-- ----------------------------
ALTER TABLE [dbo].[T_Apply] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table T_Attachment_File
-- ----------------------------
CREATE INDEX [NonClusteredIndex-20170918-085903] ON [dbo].[T_Attachment_File]
([UserGuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table T_Attachment_File
-- ----------------------------
ALTER TABLE [dbo].[T_Attachment_File] ADD PRIMARY KEY ([Guid])
GO

-- ----------------------------
-- Indexes structure for table t_Attachment_File_relation
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_Attachment_File_relation
-- ----------------------------
ALTER TABLE [dbo].[t_Attachment_File_relation] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_evaluateform_opinion
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_evaluateform_opinion
-- ----------------------------
ALTER TABLE [dbo].[t_evaluateform_opinion] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table t_evaluationform
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_evaluationform
-- ----------------------------
ALTER TABLE [dbo].[t_evaluationform] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table t_evaluationform_ability
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_evaluationform_ability
-- ----------------------------
ALTER TABLE [dbo].[t_evaluationform_ability] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table t_exam
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_exam
-- ----------------------------
ALTER TABLE [dbo].[t_exam] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_plan_manager
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_plan_manager
-- ----------------------------
ALTER TABLE [dbo].[t_plan_manager] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_GE_BYTEARRAY]
-- ----------------------------
ALTER TABLE [dbo].[ACT_GE_BYTEARRAY] ADD FOREIGN KEY ([DEPLOYMENT_ID_]) REFERENCES [dbo].[ACT_RE_DEPLOYMENT] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_ID_MEMBERSHIP]
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] ADD FOREIGN KEY ([GROUP_ID_]) REFERENCES [dbo].[ACT_ID_GROUP] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] ADD FOREIGN KEY ([USER_ID_]) REFERENCES [dbo].[ACT_ID_USER] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_PROCDEF_INFO]
-- ----------------------------
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD FOREIGN KEY ([INFO_JSON_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RE_MODEL]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD FOREIGN KEY ([DEPLOYMENT_ID_]) REFERENCES [dbo].[ACT_RE_DEPLOYMENT] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD FOREIGN KEY ([EDITOR_SOURCE_VALUE_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD FOREIGN KEY ([EDITOR_SOURCE_EXTRA_VALUE_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_EVENT_SUBSCR]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EVENT_SUBSCR] ADD FOREIGN KEY ([EXECUTION_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_EXECUTION]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD FOREIGN KEY ([PARENT_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD FOREIGN KEY ([SUPER_EXEC_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_IDENTITYLINK]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD FOREIGN KEY ([PROC_INST_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD FOREIGN KEY ([TASK_ID_]) REFERENCES [dbo].[ACT_RU_TASK] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_JOB]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_JOB] ADD FOREIGN KEY ([EXCEPTION_STACK_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_TASK]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_TASK] ADD FOREIGN KEY ([EXECUTION_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_TASK] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_TASK] ADD FOREIGN KEY ([PROC_INST_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_VARIABLE]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD FOREIGN KEY ([BYTEARRAY_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD FOREIGN KEY ([EXECUTION_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD FOREIGN KEY ([PROC_INST_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_Organization]
-- ----------------------------
ALTER TABLE [dbo].[RS_Organization] ADD FOREIGN KEY ([ParentId]) REFERENCES [dbo].[RS_Organization] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_Organization] ADD FOREIGN KEY ([TypeId]) REFERENCES [dbo].[RS_OrganizationType] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_OrganizationDepth]
-- ----------------------------
ALTER TABLE [dbo].[RS_OrganizationDepth] ADD FOREIGN KEY ([ChildId]) REFERENCES [dbo].[RS_Organization] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_OrganizationDepth] ADD FOREIGN KEY ([ParentId]) REFERENCES [dbo].[RS_Organization] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_OrganizationDepth] ADD FOREIGN KEY ([ParentTypeId]) REFERENCES [dbo].[RS_OrganizationType] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_OrganizationUser]
-- ----------------------------
ALTER TABLE [dbo].[RS_OrganizationUser] ADD FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[RS_Organization] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_OrganizationUser] ADD FOREIGN KEY ([UserId]) REFERENCES [dbo].[RS_User] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_Permission]
-- ----------------------------
ALTER TABLE [dbo].[RS_Permission] ADD FOREIGN KEY ([PermissionLevelId]) REFERENCES [dbo].[RS_PermissionLevel] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_Permission] ADD FOREIGN KEY ([PermissionResourceId]) REFERENCES [dbo].[RS_PermissionResource] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_Role]
-- ----------------------------
ALTER TABLE [dbo].[RS_Role] ADD FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[RS_Organization] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_Role] ADD FOREIGN KEY ([TypeId]) REFERENCES [dbo].[RS_RoleType] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_RoleDepth]
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleDepth] ADD FOREIGN KEY ([ChildId]) REFERENCES [dbo].[RS_Role] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_RoleDepth] ADD FOREIGN KEY ([ParentId]) REFERENCES [dbo].[RS_Role] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_RoleResource]
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleResource] ADD FOREIGN KEY ([roleId]) REFERENCES [dbo].[RS_Role] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_RoleRole]
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleRole] ADD FOREIGN KEY ([ChildId]) REFERENCES [dbo].[RS_Role] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_RoleRole] ADD FOREIGN KEY ([ParentId]) REFERENCES [dbo].[RS_Role] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_RoleUser]
-- ----------------------------
ALTER TABLE [dbo].[RS_RoleUser] ADD FOREIGN KEY ([RoleId]) REFERENCES [dbo].[RS_Role] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[RS_RoleUser] ADD FOREIGN KEY ([UserId]) REFERENCES [dbo].[RS_User] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_UserAvatar]
-- ----------------------------
ALTER TABLE [dbo].[RS_UserAvatar] ADD FOREIGN KEY ([UserId]) REFERENCES [dbo].[RS_User] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_UserPrincipal]
-- ----------------------------
ALTER TABLE [dbo].[RS_UserPrincipal] ADD FOREIGN KEY ([UserId]) REFERENCES [dbo].[RS_User] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[RS_UserResume]
-- ----------------------------
ALTER TABLE [dbo].[RS_UserResume] ADD FOREIGN KEY ([ID]) REFERENCES [dbo].[RS_User] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[sys_evaluationform_ability]
-- ----------------------------
ALTER TABLE [dbo].[sys_evaluationform_ability] ADD FOREIGN KEY ([abilityId]) REFERENCES [dbo].[sys_ability] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[sys_evaluationform_ability] ADD FOREIGN KEY ([evaluationformId]) REFERENCES [dbo].[sys_evaluationform] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[t_evaluationform_ability]
-- ----------------------------
ALTER TABLE [dbo].[t_evaluationform_ability] ADD FOREIGN KEY ([abilityId]) REFERENCES [dbo].[t_ability] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[t_evaluationform_ability] ADD FOREIGN KEY ([evaluationformId]) REFERENCES [dbo].[t_evaluationform] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
