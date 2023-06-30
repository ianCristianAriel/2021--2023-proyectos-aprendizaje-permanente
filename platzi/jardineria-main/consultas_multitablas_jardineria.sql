--1.4.5 CONSULTAS MULTITABLA

--Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT 
	nombre_cliente,
	empleado.nombre,
	empleado.apellido1, empleado.apellido2
FROM
	cliente INNER JOIN empleado ON codigo_empleado_rep_ventas = codigo_empleado
ORDER BY 
	codigo_cliente DESC;

--Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT 
	nombre_cliente,
	empleado.nombre,
	empleado.apellido1, empleado.apellido2
FROM
	cliente INNER JOIN empleado ON codigo_empleado_rep_ventas = codigo_empleado
    INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
ORDER BY 
	cliente.codigo_cliente DESC;

--Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT 
	nombre_cliente,
	empleado.nombre,
	empleado.apellido1, empleado.apellido2
FROM
	cliente INNER JOIN empleado ON codigo_empleado_rep_ventas = codigo_empleado
    LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
WHERE	
	pago.codigo_cliente IS NULL
ORDER BY 
	pago.codigo_cliente DESC;

--Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT
	cliente.nombre_cliente,
	CONCAT(empleado.nombre,' ', empleado.apellido1) as empleado_ventas,
	oficina.ciudad
FROM
	pago INNER JOIN cliente ON pago.codigo_cliente = cliente.codigo_cliente
	INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
	INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
ORDER BY 
	cliente.codigo_cliente;

--Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT 
	nombre_cliente,
	empleado.nombre,
	empleado.apellido1, empleado.apellido2
FROM
	oficina INNER JOIN empleado ON empleado.codigo_oficina = oficina.codigo_oficina
	INNER JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
	LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
WHERE	
	pago.codigo_cliente IS NULL
ORDER BY 
	pago.codigo_cliente DESC;

--Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
SELECT 
	oficina.codigo_oficina,
	oficina.linea_direccion1, oficina.linea_direccion2
FROM 
	oficina INNER JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina
	INNER JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE
	cliente.ciudad ilike 'Fuenlabrada'
ORDER BY 
	oficina.codigo_oficina;

--Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT 
	oficina.ciudad,
	cliente.nombre_cliente,
	empleado.nombre AS nombre_empleado
FROM 
	oficina INNER JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina
	INNER JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
ORDER BY 
	cliente.codigo_cliente ASC,
	oficina.codigo_oficina;

--Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT 
	empleado.codigo_empleado,
	empleado.nombre,
	empleado.apellido1, empleado.apellido2,
	empleado.codigo_jefe,
	oficina.ciudad
FROM
	empleado INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
ORDER BY 
	empleado.codigo_empleado;
	
--Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
SELECT 
	cliente.nombre_cliente
FROM
	cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE
	pedido.fecha_entrega > pedido.fecha_esperada
ORDER BY
	cliente.codigo_cliente;

--Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT 
	cliente.codigo_cliente,
	cliente.nombre_cliente,
	producto.gama
FROM
	cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
	INNER JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
	INNER JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto
WHERE
	pedido.fecha_entrega > pedido.fecha_esperada
GROUP BY
	cliente.codigo_cliente,
	cliente.nombre_cliente,
	producto.gama
ORDER BY
	cliente.codigo_cliente;

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
SELECT 
	cliente.nombre_cliente,
	cliente.nombre_contacto
FROM
	cliente LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE 
	pedido.codigo_cliente IS NULL
ORDER BY 
	cliente.nombre_cliente ASC;

--Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
SELECT 
	cliente.codigo_cliente,
	cliente.nombre_cliente
FROM 
	cliente LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
	LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE 
	pedido.codigo_cliente IS NULL AND pago.codigo_cliente IS NULL
ORDER BY
	cliente.codigo_cliente ASC;

--Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
SELECT 
	oficina.codigo_oficina,
	empleado.codigo_empleado,
	empleado.nombre,
	CONCAT(empleado.apellido1, ' ', empleado.apellido2) AS empleado_apellido
FROM
	empleado LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE 
	oficina.codigo_oficina IS NULL
ORDER BY 
	empleado.codigo_empleado ASC;

--Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
SELECT 
	empleado.codigo_empleado,
	empleado.nombre,
	CONCAT(empleado.apellido1, ' ', empleado.apellido2) AS empleado_apellido
FROM
	empleado LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE
	cliente.codigo_empleado_rep_ventas IS NULL
ORDER BY
	empleado.codigo_empleado ASC;

--Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
SELECT 
	empleado.codigo_empleado,
	empleado.nombre,
	CONCAT(empleado.apellido1, ' ', empleado.apellido2) AS empleado_apellido,
	oficina.*
FROM
	empleado LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
	INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE
	cliente.codigo_empleado_rep_ventas IS NULL
ORDER BY
	empleado.codigo_empleado ASC;

--Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
SELECT 
	empleado.codigo_empleado,
	empleado.nombre,
	CONCAT(empleado.apellido1, ' ', empleado.apellido2) AS empleado_apellido
FROM
	empleado LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
	LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE
	cliente.codigo_empleado_rep_ventas IS NULL AND	oficina.codigo_oficina IS NULL
ORDER BY
	empleado.codigo_empleado ASC;

--Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT 
	producto.codigo_producto,
	producto.nombre
FROM
	producto LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE 
	detalle_pedido.codigo_producto IS NULL
ORDER BY 
	producto.codigo_producto ASC;

--Devuelve un listado de los productos que nunca han aparecido en un pedido. 
--El resultado debe mostrar el nombre, la descripción y la imagen del producto.
SELECT 
	producto.codigo_producto,
	producto.nombre,
	gama_producto.descripcion_texto,
	gama_producto.descripcion_html,
	gama_producto.imagen
FROM
	producto LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
	INNER JOIN gama_producto ON producto.gama = gama_producto.gama
WHERE 
	detalle_pedido.codigo_producto IS NULL
ORDER BY 
	producto.codigo_producto ASC;
	
--Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
SELECT 
	oficina.*
FROM
	oficina LEFT JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina
	RIGHT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
	INNER JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
	INNER JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
	RIGHT JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto
WHERE 
	producto.gama NOT ILIKE 'Frutales' 
	AND oficina.codigo_oficina IS NOT NULL
ORDER BY 
	oficina.codigo_oficina ASC;
	
--Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
SELECT 
	cliente.codigo_cliente,
	cliente.nombre_cliente
FROM
	cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
	LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
WHERE 
	pago.codigo_cliente IS NULL
ORDER BY
	cliente.codigo_cliente ASC;

