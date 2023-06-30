Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT nombre, precio, fabricante.name FROM PRODUCTO JOIN FABRICANTE using (id);

Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT nombre, precio, fabricante.name FROM PRODUCTO JOIN FABRICANTE using (id);

Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.id, producto.nombre, fabricante.id, fabricante.nombre FROM producto JOIN fabricante USING(ID);

Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante USING(id) ORDER BY producto.precio asc limit 1;

Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante USING(id) ORDER BY producto.precio desc limit 1;

Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT  producto.nombre FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Lenovo';

Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT  producto.nombre FROM producto JOIN fabricante USING(id) WHERE fabricante.nombre = 'Crucial' AND producto.precio >200;

Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT * FROM producto JOIN fabricante ON (fabricante.id = producto.id_fabricante) WHERE fabricante.nombre = 'Asus' or fabricante.nombre =  'Hewlett-Packardy' or fabricante.nombre = 'Seagate';

Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto JOIN fabricante on (fabricante.id = producto.id_fabricante) WHERE fabricante.nombre in ('Asus', 'Hewlett-Packardy', 'Seagate');

Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT * FROM producto JOIN fabricante ON (fabricante.id = producto.id_fabricante) WHERE UPPER(fabricante.nombre) LIKE '%e';

Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT * FROM producto JOIN fabricante ON (fabricante.id = producto.id_fabricante) WHERE UPPER(fabricante.nombre) LIKE '%w%';

Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.precio, producto.nombre, fabricante.nombre FROM producto JOIN fabricante using(id) WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre DESC;

Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT fabricante.id, fabricante.nombre FROM fabricante JOIN producto USING(id);

Resuelva odas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT * FROM fabricante right JOIN producto USING(id);

Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante left JOIN producto USING(id);

¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
Si puede, en el caso de que la tabla sea inconsistente
SELECT * FROM fabricante left JOIN producto USING(id) WHERE producto.id_fabricante is null;    