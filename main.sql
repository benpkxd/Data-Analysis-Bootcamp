-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension

-- write SQL 3-5 queries analyze data
-- 1x subquery/ with

--1.Create 5 tables
--1.1 fact
create table pkxd_Order(
  orderid INT primary key ,
  orderdate DATE,
  customerid INT,
  branchid INT,
  menuid INT,
  delivid INT,
  --2. Add Foreign KEY Question: งงว่าทำไมใช้ ALTER TABLE ADD ไม่ได้?
  FOREIGN KEY (customerid) REFERENCES pkxd_dim_cu(customerid),
  FOREIGN KEY (menuid) REFERENCES pkxd_dim_menu(menuid),
  FOREIGN KEY (branchid) REFERENCES pkxd_dim_brnch(branchid),
  FOREIGN KEY (delivid) REFERENCES pkxd_dim_deliver(delivid)
);

--1.2 Dim
create table pkxd_dim_cu(
  customerid INT primary key,
  cu_name CHAR,
  cu_birth DATE,
  cu_member BOOLEAN
  );
--1.3 Dim
create table pkxd_dim_menu(
  menuid INT primary key,
  menu_name CHAR,
  menu_price REAL
);

--1.4 Dim
create table pkxd_dim_brnch(
  branchid INT primary key,
  brnch_name CHAR
);
--1.5 Dim
create table pkxd_dim_deliver(
  delivid INT primary key,
  deliv_type CHAR,
  deliv_price REAL
);


--3. Insert Value
INSERT INTO pkxd_Order VALUES
(1,'2022-08-20',1,1,3,1),
(2,'2022-08-22',2,3,1,2),
(3,'2022-09-20',3,2,2,3),
(4,'2022-08-19',4,2,3,1),
(5,'2022-08-21',1,1,2,2);

INSERT INTO pkxd_dim_cu VALUES
  (1,'ben','1991-08-14',TRUE),
  (2,"P'Toy",'1981-08-14',FALSE),
  (3,'bam','1995-08-14',TRUE),
  (4,'ben','1992-08-14',TRUE);

INSERT INTO pkxd_dim_menu VALUES
  (1,'Steak',55.0),
  (2,'Porkchop',75.5),
  (3,'Huoguo',500.25);

INSERT INTO pkxd_dim_brnch VALUES
  (1,'BKK'),
  (2,'LDN'),
  (3,'AUS');

INSERT INTO pkxd_dim_deliver VALUES
  (1,'drivethru',0.0),
  (2,'grab',5.0),
  (3,'drone',7.5);

.mode column
.header on


-- test 
SELECT * FROM pkxd_dim_cu
WHERE cu_name like '%Toy%';


-- write SQL 3-5 queries analyze data
-- 1. which menu is the most popular , How many orders? ,Revenue?
SELECT 
    m.menu_name, 
    count(*) AS 'qty.',
    sum(m.menu_price)
FROM pkxd_Order as o
JOIN pkxd_dim_menu as m
ON o.menuid = m.menuid
GROUP BY m.menu_name
Limit 1 ;

--2.declare variable as create view table for connected orderID with overall price 
CREATE VIEW Table_bill AS
  SELECT 
    o.orderid,
    m.menu_price,
    d.deliv_price,
    c.cu_member
  FROM pkxd_order AS o 
  JOIN pkxd_dim_menu AS m ON o.menuid = m.menuid
  JOIN pkxd_dim_deliver AS d ON o.delivid = d.delivid
  JOIN pkxd_dim_cu AS c USING(customerid);

--3. compute overall price per orderID
  SELECT 
    orderid,
    menu_price as 'food bill',
    deliv_price as 'deliver bill' ,
    cu_member as membership,
    (
      CASE 
        WHEN cu_member = 0 THEN menu_price + deliv_price
        ELSE (menu_price + deliv_price) * 0.5
      END 
    )  AS overall
  FROM Table_bill;

-- 1x subquery/ with
--4. Age of customer (try Union function)
WITH var1 AS 
(
--Old gen
  SELECT 
  o.customerid AS ID,
  c.cu_name AS CustomerName,
  STRFTIME('%Y',o.orderdate)  - STRFTIME('%Y',c.cu_birth) AS Age 
  FROM pkxd_order AS o 
  JOIN pkxd_dim_cu AS c USING (customerid)
  WHERE STRFTIME('%Y',o.orderdate)  - STRFTIME('%Y',c.cu_birth) > 31
  UNION 
--New gen
  SELECT 
  o.customerid AS ID,
  c.cu_name AS CustomerName,
  STRFTIME('%Y',o.orderdate)  - STRFTIME('%Y',c.cu_birth) AS Age
  FROM pkxd_order AS o 
  JOIN pkxd_dim_cu AS c USING (customerid)
  WHERE STRFTIME('%Y',o.orderdate)  - STRFTIME('%Y',c.cu_birth) <= 31
)

Select CustomerName,Age FROM var1 ;

SELECT menu_name FROM pkxd_dim_menu--

