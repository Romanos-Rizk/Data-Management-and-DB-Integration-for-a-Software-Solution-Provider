# Data Management Project

## Table of Content

- [Problem Overview](#Project-Overview)
- [Company Information and Business Model](#Company-Information-and-Business-Model)
- [Business Rules](#Business-Rules)
- [Description of Entities](#Description-of-Entities)
- [SQL Management Studio: Table Creation](#SQL-Management-Studio:-Table-Creation)
- [SQL Management Studio: Populating Tables](#SQL-Management-Studio:-Populating-Tables)
- [SQL Management Studio: Custom Queries](#SQL-Management-Studio:-Custom-Queries)

## Project Overview:

This project showcases the design and implementation of a local company's database system. an IT solution provider was interviewed to gather comprehensive insights into the business requirements and rules. With a clear understanding of the needs at hand, the next step involved designing a relational database tailored to meet these requirements. The database structure was mapped out using Enhanced Entity-Relationship Diagrams (ERD), ensuring adherence to the normalization rules vital for efficient data organization. Following the design phase, the database was seamlessly implemented utilizing MySQL, a robust relational database management system. Once the database was up and running, its tables were populated with relevant data, significantly enhancing the store's data analytics capabilities.

## Company Information and Business Model:

Pros Services, a prominent Internet Service Provider (ISP) operating in Lebanon under a Ministry of Telecommunications license since 2008, has established itself as a premier provider of internet services, including IPTV, smart home solutions, and IoT services. With a track record of 14 years in the industry, Pros Services has garnered a solid reputation for delivering high-quality services and remains committed to further solidifying its position in the market.

Covering extensive geographic regions, Pros Services operates through a network of over 500 links strategically installed across Lebanon's key zones, encompassing Beirut, South Lebanon, Beqaa’, North Lebanon, and Mount Lebanon. This widespread coverage allows the company to efficiently cater to diverse customer needs and preferences throughout the country.

The company's portfolio extends beyond basic internet services to encompass a wide range of IT and business solutions. These include but are not limited to power backup systems, telematics solutions such as tracking devices and sensors, hardware offerings including Cisco servers, and comprehensive Microsoft business solutions. Moreover, Pros Services distinguishes itself through the provision of a sophisticated bandwidth management system, enabling detailed usage reports and streamlined client service management.

An emphasis on teamwork characterizes Pros Services' operational structure, with each department led by a dedicated manager and supervised by team leaders. This collaborative approach ensures seamless coordination across different functions, enhancing overall efficiency and service delivery.

As technology continues to evolve in the digital age, Pros Services recognizes the importance of staying abreast of the latest developments. Consequently, the company prioritizes the regular updating and upgrading of its internal systems to maintain operational excellence and remain competitive in the market.

The company's clientele predominantly consists of business-to-business and individual consumers, reflecting its ability to effectively engage with its primary target market segments. Clients benefit from personalized interactions, with Pros Services conducting thorough interviews and analyses to understand their specific needs before offering tailored solutions.

Once a solution is determined, Pros Services goes the extra mile by physically deploying necessary software and providing comprehensive guidance and support to clients. This hands-on approach ensures that customers receive not only effective solutions but also the necessary assistance to maximize the value of the provided services.

## Business Rules:

1. An employee must work in one department.
2. A department must contain many employees.
3. A department must operate many services.
4. A service must be operated by many departments.
5. A service may be an IT solution.
6. A service may be a power backup solution.
7. A service may be a telematics solution.
8. A service may be a software solution.
9. A service may be a Microsoft business solution.
10. A service may be sold to many customers.
11. A customer may purchase many services.
12. An employee may be a regular employee.
13. An employee may be a manager.
14. An employee may be a supervisor.
15. A manager must manage one department.
16. A department must be managed by one manager.
17. A regular employee must work in one team.
18. A team must contain many regular employees.
19. A team must have a supervisor.
20. A supervisor must supervise one team.
21. A task must be completed by one team.
22. A team may complete many tasks.

## Description of Entities:

*  **Services:** The components of a service are its name, its cost, its category, and its special service number (identifier). The offered service kinds are represented by the subtypes of the services entity, which is a super-type.

*  **Department:** Departments consist of a department name, a special department number (identifier), and the number of personnel. These divisions include the departments of IT, HR, accounting, marketing, and finance. And a manager oversees each department.

*	**Employee:** An employee is a person who works for a certain department and is identified by their unique employer identity, first and last names, addresses, phone numbers, and employee type. Employee entity is a supertype, and employee kinds are represented by its subtypes.

*	**IT Solutions:** Every IT solution is provided to address a specific IT issue. (Subtype of services)

*	**Power Backup:** Each Backup power solution has a set amount of time that it may be used. (Subtype of services)

*  **Software Solution:** Every software option comes with unique software advantages. (Subtype of services)

*  **Telematics Solution:** Every Telematics solution is practical for a device, according to the term. (Subtype of services)

*  **Microsoft Business:** A description is provided for each license. (Subtype of services)

*  **Manager:** Each manager lists their pay and the number of years they have worked in the department. Each manager also oversees a certain department. (Subtype of employee)

*  **Supervisor:** Each supervisor oversees several employees and gets paid. And each manager oversees one squad. (Subtype of employee)

*  **Regular employee:** Regular employees are paid a wage and are a part of a team. (Subtype of employee)

*  **Team:** Each has a distinct team number and a certain number of personnel. Each Team is assigned tasks.

*  **Task:** Each task is identified by a primary key (task number) and includes the date it was finished

*  **Customer:** Consists of the customer's first and last name, address, and phone number in addition to a special customer identification.

## Relational Schema: Available in the word file:

## SQL Management Studio: Table Creation:

### Tables Concerning Employees

```sql
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
```

```sql
Create table Supervisor (
SupervisorID nchar (9) not null,
NumberOfEmployeeSupervised integer ,
Salary Integer,
Primary key (SupervisorID),
Foreign key (SupervisorID) references employee);
```

```sql
Create Table RegularEmployee (
RegularEmployeeID nchar (9) not null,
Team_ID integer not null,
Salary integer,
Primary Key (RegularEmployeeID),
Foreign key (RegularEmployeeID) references employee ,
Foreign key (Team_ID) references Team);
```

```sql
Create Table Manager (
ManagerID nchar (9) not null,
NumberOfHoursInDepartment integer,
Salary integer,
Primary key (ManagerID),
Foreign key (ManagerID) references employee);
```

```sql
Create Table Team (
TeamID integer not null,
SuperID nchar (9) not null,
NumberOfEmployees integer,
Primary key (TeamID),
Foreign key ( SuperID) references supervisor );
```

```sql
Create table Department (
DepartmentNum integer not null,
DepartmentName varchar (20) not null,
NumberOfEmployees integer not null,
Primary key (DepartmentNum));
```

```sql
Create Table Task (
TaskNumber integer not null,
T_ID integer not null,
DateCompleted varchar (20),
Primary key ( TaskNumber),
Foreign key ( T_ID) references Team); 
```

```sql
Create table Operation (
Department_Number integer not null,
Service_Number integer not null,
Primary key ( Department_Number, Service_Number),
Foreign key ( Department_Number) references department,
Foreign key (Service_Number) references Service);
```

### Tables Concerning Customers

```sql
Create table Customer (
CustomerID nchar (9) not null,
CustomerLastName varchar (20) not null,
CustomerFirstName varchar (20) not null,
CustomerAddress varchar (20) ,
CustomerPhoneNum nchar (8) ,
Primary key (CustomerID));
```

```sql
Create table Orders (
Service_Num integer not null,
Customer_ID nchar (9) not null,
Primary key (Service_Num, Customer_ID),
Foreign key (Customer_ID) references Customer,
Foreign key (Service_Num) references service);
```

### Tables Concerning Services:

```sql
Create table service(
ServiceNum integer not null,
ServiceName varchar(20) not null,
ServiceCost integer,
ServiceType varchar (20),
Primary key(ServiceNum));
```

```sql
Create table TelematicsSolution (
TelematicsSolutionNum integer not null,
Device varchar (20),
Primary key (TelematicsSolutionNum),
Foreign key (TelematicsSolutionNum) references service);
```

```sql
Create table ITSolution(
ITSolutionNum integer not null,
ITProblem varchar (20),
Primary key (ITSolutionNum),
Foreign key (ITSolutionNum) references service);
```

```sql
Create table PowerBackup (
PowerBackupNum integer not null,
UsageTime float,
Primary key(PowerBackupNum),
Foreign key (PowerBackupNum) references service);
```

```sql
Create table SoftwareSolution (
SoftwareSolutionNum integer not null,
SoftwareBenefit varchar (20),
Primary key (SoftwareSolutionNum),
Foreign key(SoftwareSolutionNum) references service);
```

```sql
Create table MicrosoftBusiness (
MicrosoftBusinessNum integer not null,
Descriptions varchar (20),
Primary key (MicrosoftBusinessNum),
Foreign key (MicrosoftBusinessNum) references service);
```
**Note: table creation order in SQL differs since tables that carry dependencies should be created first.**

## SQL Management Studio: Populating Tables:

```sql
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
```

```sql
Insert into Supervisor 
Values ('0002','3','5000'),('0007','2','2000'), 
('0012','4','4400'),('0014','3','4600');
```

```sql
Insert into RegularEmployee
Values ('0003','001','1700'), ('0004','001','1200'), ('0006','001','2100'),
('0009','002','2600'), ('0011','002','2200'), ('0017','003','1900'), 
('0018','004','2000'), ('0019','005','2100'), ('0020','005','2300');
```

```sql
Insert into Manager
Values ('0005','6', '4500'), ('0008','1','3000'), ('0010','4','6000'),
('0013','2','3900'),('0015','2','4500');
```

```sql
Insert into Team
Values ('001','0002','6'), ('002','0007','1'), ('003','0012','4'),
('004','0014','2'), ('005','0014','5');
```

```sql
Insert into Department 
Values ('1','IT','7'), ('02','HR','2'), ('3','Marketing','5'), ('4','Finance','3'), ('5','Accounting','3');
```

```sql
Insert into Task
Values ('1','1','21/12/2021'), ('2','2','9/4/2012'), ('3','3','4/2/2017'), 
('4','4','1/1/2010'), ('5','5','24/7/2018');
```

```sql
Insert into Operation 
values ('1','02'),('2','21'),('3','18'),('4','05'),('5','16'),('1','11'),('2','07'),
('3','03'),('4','17'),('5','10'),('1','04'),('2','14'),('3','15');
```

```sql
Insert into Customer
Values ('000000001','Nabha','Rashid','Beirut','03775631'),
('200000002','Nassif','Lara','Beirut','76701752'),
('200000003','Rizk','Romanos','Baabda','71123456'),
('000000004','Haddad','Karl','Sour','70312450'),
('000000005','Jawde','Joseph','Byblos','78423570'),
('000000006','helou','Elie','Byblos','78423570');
```

```sql
Insert into Orders 
values ('22','000000001'), ('04','000000002'), ('19','000000003'),
('06','000000004'), ('09', '000000006');
```

```sql
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
```

```sql
Insert into TelematicsSolution
Values ('02','Car'),('08','Safe'),('14','Car'),('12','Computer'),('20', 'Phone');
```

```sql
Insert into ITSolution
Values ('03','InformatioNLack'), ('04','Inconsistancy'), ('15','Redundancy'), ('16','Undetermination'),
('18', 'WeakWorkProcess');
```

```sql
Insert into PowerBackup
Values ('07','6'), ('21', '15'), ('22', '20'), ('09','10');
```

```sql
Insert into SoftwareSolution
Values ('06','Practical'), ('05','WideSource'), ('10', 'ModifyImages'), ('13','WideSource'), 
('19','PrivateBrowsing');
```

```sql
Insert into MicrosoftBusiness
Values ('01', 'SeveralServices'), ('23', 'LifeTimeLiscence'),('17','LargeOrganizations'),
('11', ' OnlineServices');
```

## SQL Management Studio: Custom Queries:

```sql
--retrieve first and last name of every employee:
select EmployeeFirstName, EmployeeLastName
from Employee
```

```sql
--retrieve the name of accounting department
select EmployeeFirstName, EmployeeLastName
from Employee
where EMployeeType = 'Manager' and department_Number = '5'
```

```sql
--Group each service type and count the number of services offered in them
select ServiceType, count(*)
from service
group by serviceType
```

```sql
--Average manager salary
select avg(salary)
from Manager
```

```sql
--Most and least expensive service
select max(ServiceCost), min(serviceCost)
from service
```

```sql
---Retieve names and phone numbers of customers that live in Beirut (for marketing purposes)
select CustomerFirstName, CustomerAddress, CustomerPhoneNum
from customer
where CustomerAddress = 'Beirut'
```

```sql
---Retieve customers names and service they purshased
select CustomerFirstName, CustomerLastName, ServiceName
from customer, orders, service
where Customer_ID = CustomerID and ServiceNum = Service_Num
```








