create database ProServices
use ProServices

Create table service(
ServiceNum integer not null,
ServiceName varchar(20) not null,
ServiceCost integer,
ServiceType varchar (20),
Primary key(ServiceNum));

Create table TelematicsSolution (
TelematicsSolutionNum integer not null,
Device varchar (20),
Primary key (TelematicsSolutionNum),
Foreign key (TelematicsSolutionNum) references service);

Create table ITSolution(
ITSolutionNum integer not null,
ITProblem varchar (20),
Primary key (ITSolutionNum),
Foreign key (ITSolutionNum) references service);

Create table PowerBackup (
PowerBackupNum integer not null,
UsageTime float,
Primary key(PowerBackupNum),
Foreign key (PowerBackupNum) references service);

Create table SoftwareSolution (
SoftwareSolutionNum integer not null,
SoftwareBenefit varchar (20),
Primary key (SoftwareSolutionNum),
Foreign key(SoftwareSolutionNum) references service);

Create table MicrosoftBusiness (
MicrosoftBusinessNum integer not null,
Descriptions varchar (20),
Primary key (MicrosoftBusinessNum),
Foreign key (MicrosoftBusinessNum) references service);

Create table Customer (
CustomerID nchar (9) not null,
CustomerLastName varchar (20) not null,
CustomerFirstName varchar (20) not null,
CustomerAddress varchar (20) ,
CustomerPhoneNum nchar (8) ,
Primary key (CustomerID));


Create table Orders (
Service_Num integer not null,
Customer_ID nchar (9) not null,
Primary key (Service_Num, Customer_ID),
Foreign key (Customer_ID) references Customer,
Foreign key (Service_Num) references service);

Create table Department (
DepartmentNum integer not null,
DepartmentName varchar (20) not null,
NumberOfEmployees integer not null,
Primary key (DepartmentNum));

Create table Operation (
Department_Number integer not null,
Service_Number integer not null,
Primary key ( Department_Number, Service_Number),
Foreign key ( Department_Number) references department,
Foreign key (Service_Number) references Service);

Create Table Employee (
EmployeeID NCHAR (9) NOT null,
EmployeeLastName varchar (20) not null,
EmployeeFirstName varchar (20) not null,
EmployeeAddress varchar (50),
EmployeePhoneNum nchar (11),
Department_Number integer,
EmployeeType varchar (20),
Primary key (EmployeeID),
Foreign key ( Department_Number) references Department);

Create table Supervisor (
SupervisorID nchar (9) not null,
NumberOfEmployeeSupervised integer ,
Salary varchar (20),
Primary key (SupervisorID),
Foreign key (SupervisorID) references employee);

Create Table Team (
TeamID integer not null,
SuperID nchar (9) not null,
NumberOfEmployees integer,
Primary key (TeamID),
Foreign key ( SuperID) references supervisor );

Create Table RegularEmployee (
RegularEmployeeID nchar (9) not null,
Team_ID integer not null,
Salary integer,
Primary Key (RegularEmployeeID),
Foreign key (RegularEmployeeID) references employee ,
Foreign key (Team_ID) references Team);

Create Table Manager (
ManagerID nchar (9) not null,
NumberOfHoursInDepartment integer,
Salary integer,
Primary key (ManagerID),
Foreign key (ManagerID) references employee);

Create Table Task (
TaskNumber integer not null,
T_ID integer not null,
DateCompleted varchar (20),
Primary key ( TaskNumber),
Foreign key ( T_ID) references Team);


Insert into service 
Values ('01','ServicesProvider','100','MicrosoftBusiness'), ('02','GPS','200','TelematicsSolution'),
('03','SocialInformation','150','ITSolution'), ('04','ProcessControl','130','ITSolution'),
('05', 'Yahoo','80','SoftwareSolution'), ('06','Windows','70','SoftwareSolution'),
('07', 'Batteries','200','PowerBackup'), ('08', 'Sensor', '220','TelematicsSolution'),
('09','EngineGednerator','200','PowerBackupSolution'), ('10', 'Photoshop', '50','SoftwareSolution'),
('11', 'EntrepriseAgreement', '170','MicrosoftBusiness'), ('12','Geotab','300','TelematicsSolution'),
('13','Google','50','SoftwareSolution'), ('14','GIS','300','TelematicsSolution'),
('15','DataWarehouse','260','ITSolution'), ('16','DecisionSupport','240','ITSolution'),
('17','SelectPlusLiscencing','150','MicrosoftBusiness'), ('18','ERP','400','ITSolution'),
('19','FireFox','20','SoftwareSolution'), ('20','AMS','90','TelematicsSolution'),
('21','UPS','100','PowerBackupSolution'), ('22','APS','200','PowerBackupSolution'),
('23','OpenLiscenicing','150','MicrosoftBusiness');

Insert into TelematicsSolution
Values ('02','Car'),('08','Safe'),('14','Car'),('12','Computer'),('20', 'Phone');

Insert into PowerBackup
Values ('07','6'), ('21', '15'), ('22', '20'), ('09','10');

Insert into MicrosoftBusiness
Values ('01', 'SeveralServices'), ('23', 'LifeTimeLiscence'),('17','LargeOrganizations'),
('11', ' OnlineServices');

Insert into ITSolution
Values ('03','InformatioNLack'), ('04','Inconsistancy'), ('15','Redundancy'), ('16','Undetermination'),
('18', 'WeakWorkProcess');

Insert into SoftwareSolution
Values ('06','Practical'), ('05','WideSource'), ('10', 'ModifyImages'), ('13','WideSource'), 
('19','PrivateBrowsing');

Insert into Customer
Values ('000000001','Nabha','Rashid','Beirut','03775631'),
('200000002','Nassif','Lara','Beirut','76701752'),
('200000003','Rizk','Romanos','Baabda','71123456'),
('000000004','Haddad','Karl','Sour','70312450'),
('000000005','Jawde','Joseph','Byblos','78423570'),
('000000006','helou','Elie','Byblos','78423570');

update customer
set customerID = '000000002'
where customerID = '200000002'

update customer
set customerID = '000000003'
where customerID = '200000003'


Insert into Orders 
values ('22','000000001'), ('04','000000002'), ('19','000000003'),
('06','000000004'), ('09', '000000006');


Insert into Department 
Values ('1','IT','7'), ('02','HR','2'), ('3','Marketing','5'), ('4','Finance','3'), ('5','Accounting','3');

Insert into Employee
Values ('0001','Khoury','Jean','Beirut','76828671','2','RegularEmployee'),
('0002','Berkachi','Antoine','Byblos','71783756','1','Supervisor'),
('0003','Ramada','Hadi','Byblos','03804824','4','RegularEmployee'),
('0004','Rahal','Rozan','Beirut','78709685','5','RegularEmployee'),
('0005','Zeinab','Tiya','Tripoli','79384756','3','Manager'),
('0006','Hammoud','Haya','Beirut','03102856','2','RegularEmployee'),
('0007','Houri','Salim','Byblos','71123908','3','Supervisor'),
('0008','Itani','Adam','Beirut','81234567','2','Manager'),
('0009','Hassan','Jamil','Sayda','76987463','5','RegularEmployee'),
('0010','Daher','Kevin','Beirut','03908213','1','Manager'),
('0011','Hajjar','Matilda','Sour','76867489','2','RegularEmployee'),
('0012','Karazi','Mira','Byblos','81109876', '4','Supervisior'),
('0013','Keyrouz','Mariam','Sour','76123123','5','Manager'),
('0014','Zoor','Maya','Tripoli','03234234','2','Supervisor'),
('0015','Messi','Lionel','Beirut','81345345','4','Manager'),
('0016','Nader','Halim','Byblos','76678678','5','Supervisor'),
('0017','Sabra','Omar','Sayda','03908746','2','RegularEmployee'),
('0018','Osta','Ralph','Beirut','79109876','1','RegularEmployee'),
('0019','Ismail','Hassan','Beirut','81230196','5','RegularEmployee'),
('0020','Merouch','Lynn','Beirut','78912378','4','RegularEmployee');



alter table Department add Manager_ID nchar (9)  FOREIGN KEY references Manager;


update department
set Manager_ID = '0005'
where DepartmentName = 'Marketing'

update department
set Manager_ID = '0008'
where DepartmentNum = '2'

update department
set Manager_ID = '0010'
where DepartmentNum = '1'

update department
set Manager_ID = '0013'
where DepartmentNum = '5'

update department
set Manager_ID = '0015'
where DepartmentNum = '4'



Insert into Supervisor 
Values ('0002','3','5000'),('0007','2','2000'), 
('0012','4','4400'),('0014','3','4600');

Insert into Team
Values ('001','0002','6'), ('002','0007','1'), ('003','0012','4'),
('004','0014','2'), ('005','0014','5');

Insert into RegularEmployee
Values ('0003','001','1700'), ('0004','001','1200'), ('0006','001','2100'),
('0009','002','2600'), ('0011','002','2200'), ('0017','003','1900'), 
('0018','004','2000'), ('0019','005','2100'), ('0020','005','2300');

Insert into Manager
Values ('0005','6', '4500'), ('0008','1','3000'), ('0010','4','6000'),
('0013','2','3900'),('0015','2','4500');

Insert into Task
Values ('1','1','21/12/2021'), ('2','2','9/4/2012'), ('3','3','4/2/2017'), 
('4','4','1/1/2010'), ('5','5','24/7/2018');

Insert into Operation 
values ('1','02'),('2','21'),('3','18'),('4','05'),('5','16'),('1','11'),('2','07'),
('3','03'),('4','17'),('5','10'),('1','04'),('2','14'),('3','15');



EXEC sp_help 'dbo.Customer';
select *
from Customer

EXEC sp_help 'dbo.Department';
select *
from Department

EXEC sp_help 'dbo.Employee';
select *
from Employee

EXEC sp_help 'dbo.ITSolution';
select *
from ITSolution

EXEC sp_help 'dbo.Manager'
select*
from Manager

EXEC sp_help 'dbo.MicrosoftBusiness'
select*
from MicrosoftBusiness

EXEC sp_help 'dbo.Operation'
select *
from Operation

EXEC sp_help 'Orders'
select * 
from orders

EXEC sp_help 'PowerBackup'
select*
from PowerBackup

EXEC sp_help 'RegularEmployee'
select* 
from RegularEmployee

EXEC sp_help 'Service'
select* 
from Service

EXEC sp_help 'SoftwareSolution'
select* 
from SoftwareSolution

EXEC sp_help 'Supervisor'
select* 
from Supervisor

EXEC sp_help 'Task'
select* 
from Task

EXEC sp_help 'Team'
select* 
from Team

EXEC sp_help 'TelematicsSolution'
select* 
from TelematicsSolution


--retrieve first and last name of every employee:
select EmployeeFirstName, EmployeeLastName
from Employee

--retrieve the name of accounting department
select EmployeeFirstName, EmployeeLastName
from Employee
where EMployeeType = 'Manager' and department_Number = '5'

--Group each service type and count the number of services offered in them
select ServiceType, count(*)
from service
group by serviceType

--Average manager salary
select avg(salary)
from Manager

--Most and Least expensive service
select max(ServiceCost), min(serviceCost)
from service

---Retieve names and phone numbers of customers that live in Beirut (for marketing purposes)
select CustomerFirstName, CustomerAddress, CustomerPhoneNum
from customer
where CustomerAddress = 'Beirut'


---Retieve customers names and service they purshased
select CustomerFirstName, CustomerLastName, ServiceName
from customer, orders, service
where Customer_ID = CustomerID and ServiceNum = Service_Num


select salary, employeeFirstName, employeeLastName
from employee, customer, orders, task, team, regularEmployee, department, service
where teamID = T_ID and regularEmployeeID = employeeID and departmentNum = serviceNum and customer_ID = customerID AND CustomerID = 000000001 AND DepartmentNum = 3 AND TaskNumber = 5
order by Salary desc










