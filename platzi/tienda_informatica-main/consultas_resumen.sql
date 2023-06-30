1.1.6 Consultas resumen
Calcula el número total de productos que hay en la tabla productos.
select count(*) as cantidad_productos from producto;

Calcula el número total de fabricantes que hay en la tabla fabricante.
select count(*) as cantidad_fabricantes from fabricante;

Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
select sum(distinct(fabricante.id)) from fabricante;

Calcula la media del precio de todos los productos.
select avg(precio) from producto;

Calcula el precio más barato de todos los productos.
select MIN(precio) AS precio_b FROM producto;

Calcula el precio más caro de todos los productos.
select max(precio) AS precio_b FROM producto;

Lista el nombre y el precio del producto más barato.
SELECT nombre, min(precio) FROM producto;

Lista el nombre y el precio del producto más caro.
SELECT nombre, MAX(precio) FROM producto;

Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto;

Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Asus';

Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Asus';

Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Asus';

Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Asus';

Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Asus';

Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo, COUNT(*) AS total_productos FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Crucial';

Muestra el número total de productos que tiene cada uno de los fabricantes. 
El listado también debe incluir los fabricantes que no tienen ningún producto. 
El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
Ordene el resultado descendentemente por el número de productos.
SELECT fabricante.nombre, count(*) as cantidad FROM fabricante JOIN producto ON (producto.id_fabricante = fabricante.id) GROUP BY fabricante.nombre ORDER BY cantidad;

Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo, AVG(precio) AS precio_promedio 
FROM producto JOIN fabricante 
ON(fabricante.id = producto.id_fabricante) 
GROUP BY fabricante.id;

Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo, AVG(precio) AS precio_promedio 
FROM producto
JOIN fabricante 
ON (fabricante.id = producto.id_fabricante)
WHERE producto.precio > 200
GROUP BY fabricante.id;

Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT fabricante.nombre, MAX(precio) as precio_maximo, MIN(precio) as precio_minimo, AVG(precio) as precio_medio, COUNT(*) FROM producto join fabricante on (fabricante.id = producto.id_fabricante) where fabricante.id in (SELECT id_fabricante from producto where producto.precio > 200);

Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT fabricante.nombre, COUNT(*) as cantidad_productos 
FROM producto JOIN fabricante 
ON (fabricante.id = producto.id_fabricante) 
WHERE id_fabricante in (SELECT id_fabricante FROM producto WHERE precio>=180) 
group by fabricante.id;

Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT id_fabricante, AVG(PRECIO) AS precio_medio 
FROM producto JOIN fabricante 
ON (fabricante.id = producto.id_fabricante)
GROUP BY fabricante.id;

Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT fabricante.nombre AS nombre_fabricante, AVG(PRECIO) AS precio_medio 
FROM producto JOIN fabricante 
ON (fabricante.id = producto.id_fabricante)
GROUP BY fabricante.nombre;

Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT fabricante.nombre AS nombre_fabricante, AVG(PRECIO) AS precio_medio 
FROM producto JOIN fabricante 
ON (fabricante.id = producto.id_fabricante)
WHERE producto.id IN 
    SELECT id FROM producto 
    WHERE producto.precio in (
            SELECT AVG(precio) 
            FROM producto 
            where producto.precio >= 150 
            group by producto.id_fabricante ))
GROUP BY fabricante.nombre;

Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT fabricante.nombre, count(producto.nombre) 
FROM producto JOIN fabricante 
ON (fabricante.id = producto.id_fabricante) 
where fabricante.id in (SELECT id_fabricante 
    FROM producto 
    WHERE precio >=220) 
GROUP BY fabricante.nombre;

Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT fabricante.nombre as nombre_fabricante, count(producto.nombre) 
FROM fabricante left JOIN  producto
ON (fabricante.id = producto.id_fabricante) 
where fabricante.id in (SELECT id_fabricante 
    FROM producto 
    WHERE precio >=220) 
GROUP BY nombre_fabricante;

