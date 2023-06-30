--¿Cuántos empleados hay en la compañía?
SELECT
	COUNT(empleado.codigo_empleado) AS cantidad_empleados
FROM
	empleado;

--¿Cuántos clientes tiene cada país?
SELECT
	cliente.pais,
	COUNT(*) AS clientes_pais
FROM
	cliente
GROUP BY
	cliente.pais
ORDER BY
	clientes_pais;

--¿Cuál fue el pago medio en 2009?
SELECT
	AVG(pago.total) AS promedio_pago
FROM 
	pago
WHERE 
	DATE_PART('YEAR', pago.fecha_pago) = '2009';

--¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT 
	distinct(pedido.estado),
	COUNT(*) OVER(PARTITION BY pedido.estado) as estado_pedidos
FROM 
	pedido
ORDER BY
	estado_pedidos DESC;

--Calcula el precio de venta del producto más caro y más barato en una misma consulta.
SELECT 
	MIN(producto.precio_venta) AS producto_barato,
	MAX(producto.precio_venta) AS producto_caro
FROM
	producto;

--Calcula el número de clientes que tiene la empresa.
SELECT
	COUNT(cliente.codigo_cliente) AS cantidad_clientes
FROM
	cliente;

--¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT 
	COUNT(cliente.codigo_cliente) AS clientes_madrid
FROM
	cliente
WHERE
	cliente.ciudad ilike 'madrid'
ORDER BY
	clientes_madrid ASC;

--¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
SELECT 
	cliente.ciudad,
	COUNT(cliente.codigo_cliente) AS clientes
FROM
	cliente
WHERE
	cliente.ciudad ilike 'm%'
GROUP BY 
	cliente.ciudad
ORDER BY
	clientes ASC;

--Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
SELECT 
	CONCAT(empleado.nombre,' ', empleado.apellido1,' ', empleado.apellido2) AS empleado_ventas,
	COUNT(cliente.codigo_cliente) as clientes
FROM
	cliente INNER JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
GROUP BY 
	empleado_ventas,
	cliente.codigo_empleado_rep_ventas
ORDER BY
	clientes ASC;

--Calcula el número de clientes que no tiene asignado representante de ventas.
WITH cantidad_clientes AS (
SELECT
	COUNT(cliente.codigo_cliente) AS total
FROM
	cliente
)

SELECT 
	CONCAT(empleado.nombre,' ', empleado.apellido1,' ', empleado.apellido2) AS empleado_ventas,
	(cantidad_clientes.total - COUNT(cliente.codigo_cliente)) as clientes_faltantes
FROM
	cantidad_clientes,
	cliente INNER JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
GROUP BY 
	empleado_ventas,
	cliente.codigo_empleado_rep_ventas,
	cantidad_clientes.total
ORDER BY
	clientes_faltantes ASC;

--Calcula la fecha del primer y último pago realizado por cada uno de los clientes. 
--El listado deberá mostrar el nombre y los apellidos de cada cliente.
SELECT
	MAX(pago.fecha_pago) AS fecha_mayor_pago,
	MIN(pago.fecha_pago) AS fecha_menor_pago,
	CONCAT(cliente.nombre_cliente, ' ', cliente.apellido_contacto) AS clientes
FROM
	pago INNER JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente
GROUP BY 
	cliente.codigo_cliente;	

--Calcula el número de productos diferentes que hay en cada uno de los pedidos.
SELECT 
	DISTINCT(detalle_pedido.codigo_pedido) AS pedido_id,
	COUNT(detalle_pedido.codigo_producto) OVER(PARTITION BY detalle_pedido.codigo_pedido) AS productos_por_pedidos
FROM
	detalle_pedido
ORDER BY 
	productos_por_pedidos ASC;

--Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. 
--El listado deberá estar ordenado por el número total de unidades vendidas.
SELECT 
	DISTINCT(detalle_pedido.codigo_pedido) AS pedido_id,
	COUNT(detalle_pedido.codigo_producto) OVER(PARTITION BY detalle_pedido.codigo_pedido) AS productos_por_pedidos
FROM
	detalle_pedido
ORDER BY 
	productos_por_pedidos DESC
LIMIT
	20;

--La facturación que ha tenido la empresa en toda la historia, indicando:
--la base imponible: Se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido.
--el IVA: El IVA es el 21 % de la base imponible
--total facturado: la suma de los dos campos anteriores.
SELECT 
	SUM(precio_unidad * cantidad) AS base_imponible,
	(SUM(precio_unidad * cantidad) * 0.21) AS IVA,
	(SUM(precio_unidad * cantidad) + (SUM(precio_unidad * cantidad) * 0.21)) AS total 
FROM 
	detalle_pedido
GROUP BY 
	detalle_pedido.codigo_producto

--La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
SELECT 
	SUM(precio_unidad * cantidad) AS base_imponible,
	(SUM(precio_unidad * cantidad) * 0.21) AS IVA,
	(SUM(precio_unidad * cantidad) + (SUM(precio_unidad * cantidad) * 0.21)) AS total 
FROM 
	detalle_pedido
WHERE 
    detalle_pedido.codigo_producto ilike 'OR%'
GROUP BY 
	detalle_pedido.codigo_producto

--Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
SELECT 
	distinct(pago.codigo_cliente),
	cliente.nombre_cliente,
	SUM(pago.total) OVER(PARTITION BY pago.codigo_cliente) total_pago_cliente
FROM
	pago INNER JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente
GROUP BY 
	pago.fecha_pago,
	pago.total,
	pago.codigo_cliente,
	cliente.nombre_cliente
ORDER BY
	pago.codigo_cliente ASC;