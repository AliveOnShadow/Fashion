
--ָ����ĳһ�����ݿ���в���
USE [Fashion]


--���������ֶ���Ҫ��ɾ�������
alter table [user] drop column userid
alter table [user] add userId int identity(1,1)  not null




--ɾ��Լ��
alter table [user] drop constraint pk_user
alter table [user] drop constraint ck_user
--��������
alter table [user] add constraint PKUser_userId   primary key(userid)
alter table [user] drop constraint PKUser_userId
--�½�Լ��
alter table [user] add constraint ck_user_sex check (sex='��' or sex='Ů')
alter table [user] drop constraint ck_user
--����Ĭ��ֵ
alter table [user] add constraint DFUser_starcount default 0 for starcount
alter table [user] drop constraint DFUser_starcount

alter table [user] alter column userName nvarchar(25) not null





--����user���Լ�������� ����PK ΨһUQ Ĭ��DF ���CK ���FK
alter table [user] add constraint PKUser_userId primary key(userId)
alter table [user] add constraint CKUser_sex check (sex='��' or sex='Ů')
alter table [user] add constraint UQUser_userName unique (username)
alter table [user] add constraint CKUser_rank check([rank]>0 and [rank]<5)

alter table [user] add constraint CKUser_isMessageRemind check (isMessageRemind=1 or isMessageRemind=0)
alter table [user] add constraint DFUser_isMessageRemind default 1 for isMessageRemind

--�ȼ���Rank
create table [Rank]
(
rankId char(1)  not null,
rankName nchar(4) not null,
constraint PKRank_rankId primary key(rankId)
)
alter table [rank] add constraint UQRank_rankName unique (rankname)
--drop table [rank]
insert into [rank] values(1,'��ͨ�û�')
insert into [rank] values(2,'ʱ�д���')
insert into [rank] values(3,'ר��')
Insert into [rank] values(4,'����Ա')


--��Ϣ��Message
create table [Message]
(
messageId int not null identity(1,1),
content nvarchar(200) null,
msgSender nvarchar(25) not null,
msgReceiver nvarchar(25) not null,
msgDate datetime,
constraint PKMessage_messageId primary key(messageId)
)

--������Ϣ��Post
create table [Post]
(
postId int not null identity(1,1),
caption nvarchar(40) not null,
content text null,
postSender nvarchar(25) not null,
postTypeId int not null,
theme int not null,
supportCount int null,
postDate datetime,
constraint PKPost_postId primary key(postId)
)
alter table [post] add constraint DFPost_supportCount default 0 for supportCount

--������ͱ�Theme
create table[Theme]
(
themeId int not null,
themeName nvarchar(5) not null,
constraint PKTheme_themeId primary key(themeId),
constraint UQTheme_themeId unique (themeId)
)
insert into theme values(1,'��װ')
insert into theme values(2,'��Ʒ')

--ģ�����ͱ�Module
create table [Module]
(
moduleId int not null,
moduleName nvarchar(5) not null,
constraint PKModule_Id primary key(moduleId),
constraint UQModule_moduleName unique (moduleName)
)
insert into [Module] values(1,'������ѯ')
insert into [Module] values(2,'��־')
insert into [Module] values(3,'����')
insert into [Module] values(4,'��Ƶ')
insert into [Module] values(5,'��������Ƭ')

--�������ͱ�PostType
create table [PostType]
(
postTypeId int not null,
postTypeName nvarchar(5) not null,
constraint PKPostType_Id primary key(postTypeId),
constraint UQPostType_postTypeName unique (postTypeName)
)
insert into [PostType] values(1,'������ѯ')
insert into [PostType] values(2,'��־')
insert into [PostType] values(3,'����')
insert into [PostType] values(4,'��Ƶ')
insert into [PostType] values(5,'��������Ƭ')

--������Ϣ��StreetSnap
create table StreetSnap
(
streetSnapId int not null identity(1,1),
streetSnapTypeId int not null,
postId int null,
constraint PKStreetSnap_streetSnapId primary key(streetSnapId),
)

drop table StreetSnap
--�������ͱ�StreetSnapType
create table StreetSnapType
(
streetSnapTypeId int not null,
streetSnapType nvarchar(8) not null,
constraint PKStreetSnapType_Id primary key(streetSnapTypeId),
constraint UQStreetSnapType_streetSnapType unique(streetSnapType)
)

insert into StreetSnapType values(1,'���˽���')

--��Ƶ����Ϣ��VideoShow
create table VideoShow
(
videoShowId int not null identity(1,1),
postId int not null,
constraint PKVideoShow_videoShowId primary key(videoShowId),
)

--�ղؼ�¼Collect
create table Collect
(
collectId int not null identity (1,1),
collector nvarchar(25) not null,
postId int not null,
constraint PKCollect_collectId primary key(collectId)
)


--��ע��¼��Attention
create table Attention
(
attentionId int not null identity(1,1),
concerns nvarchar(25) not null,
beConcerned nvarchar(25) not null,
constraint PKAttention_attentionId primary key(attentionId)
)

--������ReplyPost
create table ReplyPost
(
replyPostId int not null identity(1,1),
postId int not null,
replyer nvarchar(25) not null,
content text,
constraint PKReplyPost_replyPostId primary key(replyPostId)
)

--���۱�Comment
create table Comment
(
commentId int not null identity(1,1),
postId int not null,
conmenter nvarchar(25) not null,
becomment nvarchar(25) not null,
content text,
constraint PKComment_commentId primary key(commentId)
)
