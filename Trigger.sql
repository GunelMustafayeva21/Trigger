--create database p323
--use p323

--create table Groups(
--id int primary key identity(1,1),
--Name nvarchar(20) not null unique,
--StudentCount int )

--create table Students(
--id int primary key identity(1,1),
--Name nvarchar(20) not null,
--Surname nvarchar(50) not null,
--GroupId int foreign key references Groups(Id)
--)

insert into Groups values('P323', 0)
Select * from Groups
--insert into Students values('Gunel', 'Mustafa', 1)
--Select * from Students

create trigger StudentCreated on Students
after insert as begin
update Groups set StudentCount= StudentCount+1
where id = (Select GroupId from inserted Students)
end

insert into Students values('Konul', 'Huseynli', 1)
insert into Students values('Aysun', 'Huseynli', 1)

Select * from Groups