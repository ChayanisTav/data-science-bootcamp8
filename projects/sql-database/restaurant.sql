-- Create customer table
CREATE TABLE customer(
    id int PRIMARY KEY,
    firstname text NOT NULL,
    lastname text NOT NULL,
    gender text,
    phone text
);

-- insert value in customer table
INSERT INTO customer(id, firstname, lastname, gender, phone) VALUES
(1, 'Mark', 'Tomson', 'Male','542-675-5345')
(2, 'Jane', 'Holla', 'Male','064-345-4345')
(3, 'John', 'Smith', 'Male','675-143-545')
(4, 'Joe', 'Watson', 'Male','976-655-554')
(5, 'Marky', 'Kerral', 'Male','972-645-5125')
(6, 'Jim', 'Trailor', 'Male','876-675-5875')
(7, 'Clark', 'Satlor', 'Male','098-332-9067')
(8, 'Robin', 'Hob', 'Male','943-157-8769')
(9, 'George', 'Wesker', 'Male','532-985-4365')
(10, 'Brithney', 'Potter', 'Male','864-978-3455')

-- Create payment_type table
CREATE TABLE payment_type (
    id int PRIMARY KEY,
    payment text
);

-- insert value in payment_table
INSERT INTO payment_type(id, payment) values
(1, "Cash"),
(2, "Credit/Debit");

-- Create menu
CREATE TABLE menu(
    id int PRIMARY KEY,
    menu_name text,
    price int
);

insert into menu(id, menu_name, price) values
(1,"Hotdog",60),
(2,"Fried_rice",60),
(3,"Asai",60),
(4,"Fried_chick",100),
(5,"French_fried",40),

-- Create order_detail table
CREATE TABLE order_detail(
    id int PRIMARY KEY,
    order_id int,
    menu_id int,

    FOREIGN KEY (order_id) REFERENCES order_head(id),
    FOREIGN KEY (menu_id) REFERENCES menu(id)
);

--insert value in order_detail
INSERT INTO order_detail(id, order_id, menu_id) VALUES
(1,5,7),
(7,9,7),
(3,11,1),
(4,7,4),
(4,4,8),
(1,6,5),
(7,1,8),
(8,12,2),
(9,1,8),
(7,2,2);

-- Create order_head table
CREATE TABLE order_head(
    id int PRIMARY KEY,
    order_date date,
    customer_id int,
    payment_id int,

    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_id) REFERENCES payment_type(id)
);

-- insert value in order_head 
INSERT INTO order_head(id, order_date, customer_id, payment_id) VALUES
(1,"2023-07-31",2,2),
(2,"2023-08-30",5,2),
(3,"2023-03-29",10,1),
(4,"2023-04-14",3,2),
(5,"2023-06-02",10,1),
(6,"2022-09-20",5,1),
(7,"2023-12-28",3,3),
(8,"2022-05-06",8,1),
(9,"2021-08-09",3,2),
(10,"2020-10-10",4,3);