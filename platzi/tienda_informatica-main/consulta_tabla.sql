Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, (precio * 400) AS euros, (precio * 350) AS dolares FROM producto;

Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS nombre_producto, precio * 400 AS euros, precio * 350 AS usd FROM producto;

Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;

Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto;

Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, SUBSTRING(nombre, 1, 2) FROM fabricante;

Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio,0) from producto;

Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, round(precio, 0) from producto;

Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT id from fabricante join producto using(id);

Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
select distinct(id) from fabricante join producto using(id);

Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by(nombre) asc;

Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by(nombre) dec;

Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre, precio from producto order by nombre asc, precio desc;

Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 0,5;

Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from fabricante limit 3,4;

Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio asc limit 1;

Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio desc limit 1;

Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
select nombre from producto where id_fabricante = 2;

Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre from producto where precio <= 120;

Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre from producto where precio >=400;

Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
select nombre from producto where not precio >=400;

Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select * from producto where precio >=80 and precio <=300;

Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select * from producto where precio BETWEEN 60 and 300;

Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
select * from producto where precio > 200 and id_fabricante = 6;

Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from producto where id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;

Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from producto where id_fabricante in (1,3,5);

Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio * 100 as centimo_precio  from producto;

Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where upper(nombre) like 's%';

Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where upper(nombre) like '%e';

Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where upper(nombre) like '%w%';

Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where LENGTH(nombre)=4;

Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre from producto where nombre like '%Portátil%';

Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre like '%Monitor%' and precio < 215;

Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre, precio from producto where precio >= 180 order by precio desc, order by nombre asc;