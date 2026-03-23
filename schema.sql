create database CoffeeShopManagementDB;

use CoffeeShopManagementDB;

create table items (
    item_id VARCHAR(10) PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(6,2)
);

create table ingredients (
    ingredient_id VARCHAR(10) PRIMARY KEY,
    ingredient_name VARCHAR(100),
    unit VARCHAR(20)
);

create table recipes (
    recipe_id INT PRIMARY KEY,
    item_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    quantity_required DECIMAL(6,2),
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

insert into recipes (recipe_id,item_id,ingredient_id,quantity_required) values
(1,'It001','Ing01',18),
(2,'It002','Ing01',22),
(3,'It003','Ing01',15),
(4,'It003','Ing02',120),
(5,'It004','Ing02',150),
(6,'It005','Ing11',20),
(7,'It006','Ing12',20),
(8,'It007','Ing13',20),
(9,'It008','Ing01',18),
(10,'It009','Ing01',18),
(11,'It010','Ing04',10),
(12,'It011','Ing02',100),
(13,'It012','Ing01',14),
(14,'It013','Ing18',30),
(15,'It014','Ing14',6),
(16,'It015','Ing02',160),
(17,'It016','Ing15',1),
(18,'It017','Ing16',25),
(19,'It018','Ing05',6),
(20,'It019','Ing05',8),
(21,'It020','Ing05',7),
(22,'It021','Ing06',25),
(23,'It022','Ing06',30),
(24,'It024','Ing07',100),
(25,'It027','Ing19',60);

create table inventory (
    inventory_id INT PRIMARY KEY,
    ingredient_id VARCHAR(10),
    quantity_available DECIMAL(8,2),
    last_updated DATE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

insert into inventory (inventory_id,ingredient_id,quantity_available,last_updated) values
(1,'Ing01',6000,'2024-02-12'),
(2,'Ing02',12000,'2024-02-12'),
(3,'Ing03',4000,'2024-02-12'),
(4,'Ing04',2000,'2024-02-12'),
(5,'Ing05',1800,'2024-02-12'),
(6,'Ing06',2500,'2024-02-12'),
(7,'Ing07',5000,'2024-02-12'),
(8,'Ing08',3000,'2024-02-12'),
(9,'Ing09',1500,'2024-02-12'),
(10,'Ing10',1000,'2024-02-12'),
(11,'Ing11',1800,'2024-02-12'),
(12,'Ing12',1700,'2024-02-12'),
(13,'Ing13',1600,'2024-02-12'),
(14,'Ing14',500,'2024-02-12'),
(15,'Ing15',300,'2024-02-12'),
(16,'Ing16',900,'2024-02-12'),
(17,'Ing17',20000,'2024-02-12'),
(18,'Ing18',2500,'2024-02-12'),
(19,'Ing19',2200,'2024-02-12'),
(20,'Ing20',1800,'2024-02-12');

create table orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    item_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    cust_name VARCHAR(100) NOT NULL,
    in_or_out VARCHAR(10) NOT NULL CHECK (in_or_out IN ('in','out'))
);

insert into orders (row_id,order_id,created_at,item_id,quantity,cust_name,in_or_out) values
(1,'ORD001','2024-02-12 07:04:00','It008',1,'Alex','out'),
(2,'ORD002','2024-02-12 07:09:00','It014',1,'Jordan','in'),
(3,'ORD003','2024-02-12 07:14:00','It003',2,'Taylor','out'),
(4,'ORD004','2024-02-12 07:18:00','It019',1,'Casey','out'),
(5,'ORD005','2024-02-12 07:23:00','It024',2,'Jamie','out'),
(6,'ORD006','2024-02-12 07:27:00','It005',1,'Morgan','in'),
(7,'ORD007','2024-02-12 07:32:00','It010',1,'Riley','out'),
(8,'ORD008','2024-02-12 07:36:00','It022',1,'Drew','out'),
(9,'ORD009','2024-02-12 07:41:00','It011',2,'Quinn','out'),
(10,'ORD010','2024-02-12 07:45:00','It001',1,'Avery','in'),
(11,'ORD011','2024-02-12 07:50:00','It026',1,'Parker','out'),
(12,'ORD012','2024-02-12 07:54:00','It018',1,'Blake','out'),
(13,'ORD013','2024-02-12 07:59:00','It015',2,'Cameron','out'),
(14,'ORD014','2024-02-12 08:03:00','It002',1,'Dakota','in'),
(15,'ORD015','2024-02-12 08:08:00','It004',1,'Reese','out'),
(16,'ORD016','2024-02-12 08:12:00','It007',1,'Skyler','out'),
(17,'ORD017','2024-02-12 08:16:00','It017',2,'Rowan','in'),
(18,'ORD018','2024-02-12 08:21:00','It021',1,'Emerson','out'),
(19,'ORD019','2024-02-12 08:25:00','It023',1,'Finley','out'),
(20,'ORD020','2024-02-12 08:30:00','It006',2,'Harper','in'),
(21,'ORD021','2024-02-12 08:34:00','It020',1,'Sawyer','out'),
(22,'ORD022','2024-02-12 08:39:00','It009',1,'Logan','out'),
(23,'ORD023','2024-02-12 08:43:00','It012',1,'Ellis','in'),
(24,'ORD024','2024-02-12 08:48:00','It025',2,'Phoenix','out'),
(25,'ORD025','2024-02-12 08:52:00','It027',1,'River','out');

create table staff (
    staff_id VARCHAR(10) PRIMARY KEY,
    staff_name VARCHAR(100),
    role VARCHAR(50),
    salary INT
);

insert into staff (staff_id,staff_name,role,salary) values
('S01','Aman','Barista',18000),
('S02','Riya','Cashier',16000),
('S03','Karan','Barista',18000),
('S04','Neha','Manager',30000),
('S05','Rohit','Cleaner',12000),
('S06','Ankit','Barista',17500),
('S07','Pooja','Cashier',16500),
('S08','Rahul','Supervisor',22000),
('S09','Sneha','Barista',18000),
('S10','Vikas','Cleaner',12000),
('S11','Arjun','Barista',18500),
('S12','Nidhi','Cashier',16000),
('S13','Manish','Supervisor',22500),
('S14','Kriti','Barista',17800),
('S15','Suresh','Cleaner',11500),
('S16','Meena','Cashier',15800),
('S17','Deepak','Barista',18200),
('S18','Isha','Barista',17600),
('S19','Yash','Cleaner',11800),
('S20','Anjali','Manager',31000);

create table shift (
    shift_id VARCHAR(10) PRIMARY KEY,
    shift_name VARCHAR(50),
    start_time TIME,
    end_time TIME
);

insert into shift (shift_id,shift_name,start_time,end_time) values
('SH01','Morning','06:00','12:00'),
('SH02','Afternoon','12:00','18:00'),
('SH03','Evening','18:00','23:00'),
('SH04','Night','23:00','06:00'),
('SH05','Weekend Morning','07:00','13:00'),
('SH06','Weekend Evening','14:00','22:00'),
('SH07','Early Morning','05:00','11:00'),
('SH08','Late Afternoon','15:00','21:00'),
('SH09','Split Shift A','08:00','12:00'),
('SH10','Split Shift B','16:00','20:00'),
('SH11','Holiday Morning','07:00','13:00'),
('SH12','Holiday Evening','14:00','22:00'),
('SH13','Festival Morning','06:00','12:00'),
('SH14','Festival Evening','16:00','22:00'),
('SH15','Backup Shift','10:00','16:00'),
('SH16','Overtime Morning','06:00','10:00'),
('SH17','Overtime Evening','18:00','22:00'),
('SH18','Training Shift','11:00','15:00'),
('SH19','Maintenance Shift','22:00','02:00'),
('SH20','Inventory Shift','04:00','08:00');

create table rota (
    rota_id INT PRIMARY KEY,
    staff_id VARCHAR(10),
    shift_id VARCHAR(10),
    shift_date DATE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (shift_id) REFERENCES shift(shift_id)
);

insert into rota (rota_id,staff_id,shift_id,shift_date) values
(1,'S01','SH01','2024-02-12'),
(2,'S02','SH01','2024-02-12'),
(3,'S03','SH02','2024-02-12'),
(4,'S04','SH02','2024-02-12'),
(5,'S05','SH03','2024-02-12'),
(6,'S06','SH03','2024-02-12'),
(7,'S07','SH04','2024-02-12'),
(8,'S08','SH05','2024-02-12'),
(9,'S09','SH06','2024-02-12'),
(10,'S10','SH07','2024-02-12'),
(11,'S11','SH08','2024-02-12'),
(12,'S12','SH09','2024-02-12'),
(13,'S13','SH10','2024-02-12'),
(14,'S14','SH11','2024-02-12'),
(15,'S15','SH12','2024-02-12'),
(16,'S16','SH13','2024-02-12'),
(17,'S17','SH14','2024-02-12'),
(18,'S18','SH15','2024-02-12'),
(19,'S19','SH16','2024-02-12'),
(20,'S20','SH17','2024-02-12'),
(21,'S01','SH18','2024-02-13'),
(22,'S02','SH19','2024-02-13'),
(23,'S03','SH20','2024-02-13'),
(24,'S04','SH01','2024-02-13'),
(25,'S05','SH02','2024-02-13');


























