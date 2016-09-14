
declare @statusId int,
		@taskId int,
		@userId int

if not exists(select * from [User] where Username = 'bhogg')
	INSERT INTO [dbo].[User] ([Firstname], [Lastname], [Username]) VALUES (N'Boss', N'Hogg', N'bhogg')

if not exists (select * from [User] where Username = 'jbob')
	INSERT INTO [dbo].[User] ([Firstname], [Lastname], [Username]) VALUES (N'Jim', N'Bob', N'Jbob')

if not exists (select * from [User] where Username = 'jdoe')    
	INSERT into [dbo].[User] ([Firstname], [Lastname], [Username]) VALUES (N'John', N'Doe', N'jdoe')

if not exists(select * from dbo.Task where Subject = 'Test Task')
	begin
		select top 1 @statusId = StatusId from Status ORDER BY StatusId;
		select top 1 u@serId = UserId from [User] ORDER BY UserId;

		insert into dbo.Task(Subject, StartDate, StatusId, CreatedDate, CreatedUserId) VALUES ('Test Task', getdate(), @statusId, getdate(), @userId)

		set @taskId = SCOPE_IDENTITY();

		INSERT [dbo].[TaskUser] ([TaskId], [UserId]) VALUES (@taskId, @userId)
	end