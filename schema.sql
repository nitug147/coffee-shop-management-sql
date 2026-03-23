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

create table inventory (
    inventory_id INT PRIMARY KEY,
    ingredient_id VARCHAR(10),
    quantity_available DECIMAL(8,2),
    last_updated DATE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

create table orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    item_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    cust_name VARCHAR(100) NOT NULL,
    in_or_out VARCHAR(10) NOT NULL CHECK (in_or_out IN ('in','out'))
);

create table staff (
    staff_id VARCHAR(10) PRIMARY KEY,
    staff_name VARCHAR(100),
    role VARCHAR(50),
    salary INT
);

create table shift (
    shift_id VARCHAR(10) PRIMARY KEY,
    shift_name VARCHAR(50),
    start_time TIME,
    end_time TIME
);

create table rota (
    rota_id INT PRIMARY KEY,
    staff_id VARCHAR(10),
    shift_id VARCHAR(10),
    shift_date DATE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (shift_id) REFERENCES shift(shift_id)
);


























