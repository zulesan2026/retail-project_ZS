--1-DDL 

--creación de esquema 
create schema retail_project;


--creación de tablas

create table clientes (
id_cliente serial primary key,
nombre varchar(100) not null,
email varchar(100) unique not null,
edad int check (edad>=18)
);


create table productos (
id_producto serial primary key,
precio decimal(10,2) not null check (precio > 0),
nombre varchar(100) not null,
stock int not null check (stock >= 0)
);

create table ventas (
id_venta serial primary key,
cantidad int not null check (cantidad > 0),
fecha_venta timestamp not null default current_date,
id_cliente int not null references clientes (id_cliente),
id_producto int not null references productos (id_producto)
);


select * from ventas

--2 DML

begin;

-- Clientes
INSERT INTO clientes (nombre, email, edad)
values
    ('Ana García', 'ana@email.com', 25),
    ('Luis Fernández', 'luis@email.com', 30),
    ('Marina Ruiz', 'marina@email.com', 22),
    ('Carlos Pérez', 'carlos@email.com', 40),
    ('Sofía Torres', 'sofia@email.com', 19);

-- Productos
INSERT INTO productos (nombre, precio, stock) 
values
    ('Teclado Mecánico', 85.50, 20),
    ('Mouse Gaming', 42.00, 35),
    ('Monitor 24"', 199.99, 10),
    ('Webcam HD', 35.00, 15),
    ('Auriculares BT', 60.50, 25);

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

select * from productos clientes
where nombre in ('Mouse Gaming', 'Auriculares BT');


update productos
set precio = precio * 1.10
where nombre in ('Mouse Gaming', 'Auriculares BT');

select * from productos;

-- Delete

select * from ventas
where id_venta = 5;


delete from ventas 
where id_venta = 5;


select * from ventas;
