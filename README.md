# Retail Project

Script SQL que crea el esquema base de un proyecto retail con las tablas
`clientes`, `productos` y `ventas`, incluyendo restricciones de integridad
(PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE) y una carga inicial de datos.

## Contenido del script (script.sql)

- **DDL**: creación de las tablas `clientes`, `productos` y `ventas` en ese
  orden, con sus respectivas restricciones.
- **DML**: carga de al menos 5 registros por tabla dentro de una transacción
  (`BEGIN ... COMMIT`), un `UPDATE` de precios y un `DELETE` de una venta
  de prueba.

## Cómo ejecutarlo

1. Crear la base de datos:

createdb retail_project

2. Ejecutar el script:

psql -U tu_usuario -d retail_project -f script.sql


También se puede correr directamente desde DBeaver, pegando el contenido
de `script.sql` en un SQL Editor conectado a la base `retail_project` y
ejecutando todo el script.
