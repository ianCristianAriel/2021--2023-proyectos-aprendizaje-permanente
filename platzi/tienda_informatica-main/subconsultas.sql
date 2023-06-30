Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto 
WHERE producto.id_fabricante IN (
        SELECT id 
        FROM fabricante 
        WHERE nombre = 'Lenovo');

Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto 
WHERE precio = (
        SELECT MAX(precio) 
        FROM producto 
        WHERE producto.id_fabricante IN ( 
            SELECT id 
            FROM fabricante 
            WHERE fabricante.nombre = 'Lenovo'));

Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre 
FROM producto 
WHERE producto.id_fabricante = (
    select id 
    from fabricante 
    where nombre = 'Lenovo') 
group by precio desc limit 1;

Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre 
FROM producto 
WHERE producto.id_fabricante = (
    select id 
    from fabricante 
    where nombre = 'Hewlett-Packard') 
group by precio asc limit 1;

Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto 
WHERE precio >= (SELECT MAX(precio) 
    FROM producto 
    WHERE id_fabricante = (
        SELECT id 
        FROM fabricante 
        WHERE nombre = 'Lenovo'));

Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto 
WHERE precio > (
        SELECT MAX(precio) 
        FROM producto 
        WHERE producto.id_fabricante = (
            SELECT id 
            FROM fabricante 
            WHERE nombre = 'Asus'));

1.1.7.4 Subconsultas con EXISTS y NOT EXISTS

Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante WHERE EXISTS (SELECT id_fabricante FROM producto);

Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante WHERE NOT EXISTS (SELECT id_fabricante FROM producto);