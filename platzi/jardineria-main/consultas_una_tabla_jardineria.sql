--1.4.4 CONSULTAS SOBRE UNA TABLA

--Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT 
	codigo_oficina,
	ciudad
FROM oficina
GROUP BY codigo_oficina
ORDER BY ciudad DESC;

--Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT 
	ciudad,
	telefono
FROM 
	oficina
WHERE 
	pais = 'España'
ORDER BY 
	ciudad DESC;

--Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT 
	nombre,
	apellido1, apellido2,
	email
FROM 
	empleado
WHERE
	codigo_jefe = 7
ORDER BY 
	nombre DESC;

--Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT 
	codigo_oficina,
	puesto,
	codigo_jefe
FROM 
	empleado
ORDER BY 
	codigo_oficina DESC;

--Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT 
	nombre,
	apellido1, apellido2,
	puesto
FROM
	empleado LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE cliente.codigo_empleado_rep_ventas IS NULL;

Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT 
	nombre_cliente
FROM
	cliente
WHERE 
	pais ilike 'Spain'
ORDER BY 
	cliente DESC;

--Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT
	distinct(estado) AS tipos_estados
FROM
	pedido
ORDER BY 
	tipos_estados DESC;

--Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
SELECT 
	DISTINCT(cliente.codigo_cliente) AS cliente_id,
	nombre_cliente
FROM
	cliente INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
WHERE
	DATE_PART('YEAR', fecha_pago) = '2008'
ORDER BY 
	cliente_id ASC;

--Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
--Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT
	codigo_pedido,
	codigo_cliente,
	fecha_esperada,
	fecha_entrega
FROM
	pedido
WHERE 
	fecha_entrega > fecha_esperada
ORDER BY 
	codigo_pedido ASC;

Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
SELECT
	codigo_pedido,
	codigo_cliente,
	fecha_esperada,
	fecha_entrega
FROM 
	pedido
WHERE
	(fecha_esperada - fecha_entrega) >= 2;

--Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT 
	*
FROM 
	pedido
WHERE
	pedido.estado ilike 'Rechazado'
ORDER BY 
	pedido.codigo_pedido ASC;

--Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
SELECT 
	*
FROM 
	pedido
WHERE
	pedido.estado ilike 'Rechazado' AND date_part('YEAR', pedido.fecha_pedido) = '2009'
ORDER BY 
	pedido.codigo_pedido ASC;

--Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
SELECT
	*
FROM 
	pedido
WHERE 
	date_part('MONTH', fecha_entrega) = '01' and estado ilike 'entregado';

--Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT 
	*
FROM
	pago
WHERE
	forma_pago ilike 'paypal' AND DATE_PART('YEAR', fecha_pago) = '2008'
ORDER BY 
	codigo_cliente DESC,
	fecha_pago DESC,
	total DESC;

--Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
SELECT 
	DISTINCT(forma_pago)
FROM
	pago
ORDER BY 
	forma_pago ASC;

--Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales,
--que tienen más de 100 unidades en stock. 
--El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT 
	*
FROM
	producto
WHERE 
	gama ilike 'Ornamentales' AND cantidad_en_stock > 100
ORDER BY 
	precio_venta DESC,
	precio_proveedor DESC;

--Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
SELECT 
	*
FROM
	cliente
WHERE 
	ciudad ilike 'madrid' AND (codigo_empleado_rep_ventas = 11 OR codigo_empleado_rep_ventas = 30)
ORDER BY
	codigo_cliente ASC;