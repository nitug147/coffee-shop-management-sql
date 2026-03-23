create database CoffeeShopManagementDB;

use CoffeeShopManagementDB;

create table items (
    item_id VARCHAR(10) PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(6,2)
);

insert into items (item_id,item_name,category,price) values
('It001','Espresso','Coffee',120),
('It002','Double Espresso','Coffee',150),
('It003','Cappuccino','Coffee',150),
('It004','Caffe Latte','Coffee',160),
('It005','Vanilla Latte','Coffee',170),
('It006','Caramel Latte','Coffee',180),
('It007','Hazelnut Latte','Coffee',180),
('It008','Americano','Coffee',140),
('It009','Long Black','Coffee',145),
('It010','Mocha','Coffee',170),
('It011','Flat White','Coffee',160),
('It012','Macchiato','Coffee',155),
('It013','Affogato','Coffee',190),
('It014','Cold Coffee','Cold Drink',180),
('It015','Iced Latte','Cold Drink',190),
('It016','Lemon Iced Tea','Cold Drink',140),
('It017','Peach Iced Tea','Cold Drink',150),
('It018','Green Tea','Tea',110),
('It019','Masala Tea','Tea',100),
('It020','Black Tea','Tea',90),
('It021','Hot Chocolate','Beverage',200),
('It022','White Hot Chocolate','Beverage',210),
('It023','Chocolate Brownie','Bakery',120),
('It024','Chocolate Muffin','Bakery',90),
('It025','Blueberry Muffin','Bakery',100),
('It026','Croissant','Bakery',110),
('It027','Cheese Sandwich','Snack',130);

create table ingredients (
    ingredient_id VARCHAR(10) PRIMARY KEY,
    ingredient_name VARCHAR(100),
    unit VARCHAR(20)
);

insert into ingredients (ingredient_id,ingredient_name,unit) values
('Ing01','Coffee Beans','grams'),
('Ing02','Milk','ml'),
('Ing03','Sugar','grams'),
('Ing04','Cocoa Powder','grams'),
('Ing05','Tea Leaves','grams'),
('Ing06','Chocolate Syrup','ml'),
('Ing07','Flour','grams'),
('Ing08','Butter','grams'),
('Ing09','Yeast','grams'),
('Ing10','Salt','grams'),
('Ing11','Vanilla Syrup','ml'),
('Ing12','Caramel Syrup','ml'),
('Ing13','Hazelnut Syrup','ml'),
('Ing14','Ice Cubes','units'),
('Ing15','Lemon','units'),
('Ing16','Peach Syrup','ml'),
('Ing17','Water','ml'),
('Ing18','Cream','ml'),
('Ing19','Cheese','grams'),
('Ing20','Chocolate Chips','grams');

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



# Q.1. Write an SQL query to find the total quantity sold for each item.
select item_id , sum(quantity) as total_quantity_sold
from orders
group by item_id;


# Q.2. Write an SQL query to display customers who ordered more than one quantity in a single order.
select cust_name , order_id, quantity
from orders
where quantity > 1;


# Q.3. Write an SQL query to calculate the total sales amount generated by each item.
select o.item_id , i.item_name , sum(o.quantity * i.price) as total_sales
from orders as o
join items as i
on o.item_id = i.item_id
group by o.item_id, i.item_name;


# Q.4. Write an SQL query to list all ingredients used in each menu item.
select i.item_name , g.ingredient_name
from recipes as r
join items as i 
on r.item_id = i.item_id
join ingredients as g 
on r.ingredient_id = g.ingredient_id;


# Q.5. Write an SQL query to display staff members working on a specific date.
select s.staff_name , sh.shift_name , r.shift_date
from rota as r
join staff as s 
on r.staff_id = s.staff_id
join shift as sh 
on r.shift_id = sh.shift_id
where r.shift_date = '2024-02-12';


# Q.6. Write an SQL query to find ingredients that are not used in any recipe.
select ingredient_id , ingredient_name
from ingredients
where ingredient_id not in (select distinct ingredient_id from recipes);

# Q.7. Write an SQL query to find the most expensive item in each category.
select category , item_name , price
from items as i
where price = (select max(price) from items where category = i.category);


# Q.8. Write an SQL query to display hour-wise order count.
select hour(created_at) as order_hour , count(*) as total_orders
from orders
group by hour(created_at)
order by order_hour;


# Q.9. Write an SQL query to rank items based on total sales amount.
select i.item_name , sum(o.quantity * i.price) as total_sales ,
rank() over (order by sum(o.quantity * i.price) DESC) as sales_rank
from orders as o
join items as i 
on o.item_id = i.item_id
group by i.item_name;


# Q.10. Write an SQL query to find staff members who worked more than one shift on the same day.
select staff_id , shift_date , count(*) as shift_count
from rota
group by staff_id , shift_date
having COUNT(*) > 1;


# Q.11. Write an SQL query to calculate total ingredient consumption based on all orders.
select i.ingredient_name , sum(o.quantity * r.quantity_required) as total_consumed
from orders as o
join recipes as r 
on o.item_id = r.item_id
join ingredients as i 
on r.ingredient_id = i.ingredient_id
GROUP BY i.ingredient_name;


# Q.12. Write an SQL query to find ingredients where required quantity exceeds available inventory.
select g.ingredient_name , i.quantity_available , sum(o.quantity * r.quantity_required) as total_required
from orders as o
join recipes as r 
on o.item_id = r.item_id
join inventory as i 
on r.ingredient_id = i.ingredient_id
join ingredients as g 
on i.ingredient_id = g.ingredient_id
group by g.ingredient_name , i.quantity_available
having total_required > i.quantity_available;


# Q.13. Write an SQL query to find the top 3 best-selling items based on quantity sold.
with item_sales as (
select i.item_name , sum(o.quantity) as total_quantity
from orders as o
join items as i 
on o.item_id = i.item_id
group by i.item_name
)
select item_name , total_quantity
from item_sales
order by total_quantity DESC
LIMIT 3;


# Q.14. Write an SQL query to create a view that shows daily revenue.
create view daily_revenue as
select date(o.created_at) as sale_date , sum(o.quantity * i.price) as total_revenue
from orders as o
join items as i 
on o.item_id = i.item_id
group by date(o.created_at);


# Q.15. Write a CTE (Common Table Expression) to rank items based on total sales.
with ranked_items as (
select i.item_name , sum(o.quantity * i.price) as total_sales,
rank() over (order by sum(o.quantity * i.price) DESC) as sales_rank
from orders as o
join items as i 
on o.item_id = i.item_id
group by i.item_name
)
select * from ranked_items;
























