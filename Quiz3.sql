--1. Academy databazasını yaradın - 2 bal

Create database Academy

Use Academy


--2. Groups(İd,Name) ve Students(İd,Name,Surname,Groupİd) table-ları yaradın(one-to-many), 
--təkrar qrup adı əlavə etmək olmasın - 5 bal

Create Table Groups
(
	Id int Primary Key Identity,
	Name nvarchar(50) Unique
)

Create Table Students
(
	Id int Primary Key Identity,
	Name nvarchar(50),
	SurName nvarchar(50),
	GroupId int Foreign Key References Groups(Id)
)

--3. Students table-na Grade (int) kalonunu əlavə etmək - 3 bal

Alter Table Students Add Grade int

--4. Groups table-na 3 data(P129,P124,P221), Students table-na 4 data 
--əlavə edin(1 tələbə p221 qrupna, 3 tələbə p129 qrupuna aid olsun) - 5 bal

Insert Into Groups
Values
('P129'),
('P124'),
('P221')

Insert Into Students
Values
('Hasan', 'Aliyev', '3', 65),
('Hasan', 'Aliyev', '1', 75),
('Hasan', 'Aliyev', '1', 85),
('Hasan', 'Aliyev', '1', 95)


--5. P129 qrupuna aid olan tələbələrin siyahisini gosterin - 10 bal



--6. Her qrupda neçə tələbə olduğunu göstərən siyahı çıxarmaq - 15 bal

Select Groups.Id, Groups.Name, Students.GroupId, Students.Name From Students
Join Groups On Students.GroupId = Groups.Id
Group by Groups.Id, Groups.Name, Students.GroupId, Students.Name

--7. View yaratmaq - tələbə adını, qrupun adını-qrup kimi , tələbə soyadını, 
--tələbənin balını göstərməli - 20 bal
Create View usv_StudentsDetail
As
Select Students.Name, Groups.Id Qrup, Students.SurName, Students.Grade From Students
Join Groups On Students.GroupId = Groups.Id

--8. Procedure yazmalı - göndərilən baldan yüksək bal alan tələbələrin
--siyahısını göstərməlidir - 20 bal

Select Students.Id, Students.Name From Students 
Join Groups On Groups.Id = Students.GroupId 
--9. Funksiya yazmalı - göndərilən qrup adina uyğun neçə tələbə olduğunu
--göstərməlidir - 20 bal