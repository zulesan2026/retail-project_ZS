--1-DDL 

--creación de esquema 
create database retail_project;


--creación de tablas

create table clientes (
id_cliente serial primary key,
nombre varchar(100) not null,
email varchar(100) unique not null,
edad int check (edad>=18)
);


create table productos (
id_producto serial primary key,
nombre varchar(100) not null,
categoria varchar (50) not null,
precio decimal(10,2) not null check (precio > 0),
stock int not null check (stock >= 0)
);

create table ventas (
id_venta serial primary key,
cantidad int not null check (cantidad > 0),
fecha_venta timestamp not null default current_timestamp,
id_cliente int not null references clientes (id_cliente),
id_producto int not null references productos (id_producto)
);


select * from ventas;

--2 DML

begin;

-- Clientes
INSERT INTO clientes (nombre, email, edad)
values
    ('Lalo Landa', 'lalolanda@gmail.com', 45),
    ('Lou Miller', 'loumiller@gmail.com', 30),
    ('Disco Stu', 'discostu@gmail.com', 62),
    ('Eleanor Abernathy', 'lalocadelosgatos@gmail.com', 70),
    ('Moe Szyslak', 'elbardemoe@gmail.com', 49);

-- Productos
INSERT INTO productos (nombre, categoria, precio, stock) 
values
    ('teclado mecánico', 'periféricos', 85.50, 20),
    ('mouse gaming', 'periféricos', 42.00, 35),
    ('monitor 24 pulgadas', 'monitores', 199.99, 10),
    ('webcam hd', 'accesorios', 35.00, 15),
    ('auriculares bluetooth', 'audio', 60.50, 25);

-- Ventas 
INSERT INTO ventas (id_cliente, id_producto, cantidad)
values
    (1, 1, 2),
    (2, 3, 1),
    (3, 2, 3),
    (4, 5, 1),
    (5, 4, 2);

commit;

select * from clientes;
select * from productos;
select * from ventas;

-- Update

update productos
set precio = precio * 1.10
where categoria = 'periféricos';

select * from productos;

-- Delete


delete from ventas 
where id_venta = 5;


select * from ventas;
