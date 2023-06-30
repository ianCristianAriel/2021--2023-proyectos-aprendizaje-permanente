--Top 10 de películas con mayor facturación.

SELECT 
	peliculas.pelicula_id,
	peliculas.titulo,
	COUNT(*) AS cantidad_rentas_pelicula
FROM 
	peliculas INNER JOIN inventarios ON peliculas.pelicula_id = inventarios.pelicula_id
	INNER JOIN rentas ON inventarios.inventario_id = rentas.inventario_id
GROUP BY peliculas.pelicula_id
ORDER BY cantidad_rentas_pelicula DESC
LIMIT 10;

--Categorías con mayor facturación.

WITH top_peliculas AS(
	SELECT 
		peliculas.pelicula_id AS id_peli,
		COUNT(*) AS CRP
	FROM 
		peliculas INNER JOIN inventarios ON peliculas.pelicula_id = inventarios.pelicula_id
		INNER JOIN rentas ON inventarios.inventario_id = rentas.inventario_id
	GROUP BY id_peli
	ORDER BY CRP DESC)
SELECT
	categorias.categoria_id AS id,
	categorias.nombre AS nombre_categoria,
	COUNT(*) CRPC
FROM 
top_peliculas INNER JOIN peliculas_categorias ON top_peliculas.id_peli = peliculas_categorias.pelicula_id
			  INNER JOIN categorias ON peliculas_categorias.categoria_id = categorias.categoria_id
GROUP BY id
ORDER BY CRPC
LIMIT 1;

--Empleado que mas venta realiza

SELECT 
	empleados.empleado_id AS identificador,
	empleados.nombre AS nombre,
	empleados.apellido AS apellido,
	COUNT(rentas.renta_id) OVER(PARTITION BY rentas.empleado_id) AS rentas_empleados 
FROM 
	empleados INNER JOIN rentas ON empleados.empleado_id = rentas.empleado_id
GROUP BY
	empleados.empleado_id,
	empleados.nombre,
	rentas.empleado_id,
	rentas.renta_id
ORDER BY rentas_empleados DESC
LIMIT 1;

--Top 2 de empleados que generaron un total mayor de ventas y el monto total de sus ventas

WITH top_2_empleados AS (
	select	distinct(rentas.empleado_id) empleados,
			empleados.nombre,
			SUM(peliculas.precio_renta) OVER(PARTITION BY rentas.empleado_id) AS suma
	from 
		empleados INNER JOIN rentas ON empleados.empleado_id = rentas.empleado_id
		INNER JOIN inventarios ON inventarios.inventario_id = rentas.inventario_id
		INNER JOIN peliculas ON peliculas.pelicula_id = inventarios.pelicula_id
	group by 
			 rentas.empleado_id,
			 empleados.nombre,
			 peliculas.precio_renta
	order by suma DESC)

SELECT top_2_empleados.empleados, top_2_empleados.suma * tipos_cambio.cambio_usd as monto_epleado from top_2_empleados, tipos_cambio where tipos_cambio.codigo = 'MXN'

--Ticket promedio por cliente en $.

select  distinct(clientes.cliente_id),
		concat(clientes.nombre,' ', clientes.apellido) as nombre_apellido,
		AVG(pagos.cantidad) OVER(PARTITION BY pagos.cliente_id) * tipos_cambio.cambio_usd as pago_cliente 
from clientes INNER JOIN pagos ON clientes.cliente_id = pagos.cliente_id,
	 tipos_cambio
where tipos_cambio.codigo = 'MXN'
group by clientes.cliente_id,
		 pagos.cliente_id,
		 pagos.cantidad,
		 cambio_usd
order by pago_cliente;

--Contribución por categoría (Margen).

WITH categorias_top AS(
	SELECT 
			DISTINCT(categorias.CATEGORIA_ID) AS CATEGORIA,
			categorias.nombre,
			SUM(PELICULA_ID) OVER(PARTITION BY categorias.CATEGORIA_ID) AS PELICULAS_CATEGORIAS
	FROM 
			peliculas_categorias INNER JOIN categorias ON categorias.categoria_id = peliculas_categorias.categoria_id
	group by 
			CATEGORIA,
			categorias.nombre,
			PELICULA_ID
	order by 
			PELICULAS_CATEGORIAS desc)
SELECT *,
	   PERCENT_RANK() OVER(PARTITION BY CATEGORIA) AS PORCENTAJE
FROM categorias_top
order by porcentaje;

--10 Ciudades con menos usuarios.

SELECT 
	ciudades.ciudad_id identificador_ciudad,
	ciudades.ciudad nombre_ciudad,
	COUNT(*) AS CUC
FROM 
	ciudades INNER JOIN direcciones ON ciudades.ciudad_id = direcciones.ciudad_id
	INNER JOIN clientes ON clientes.direccion_id = direcciones.direccion_id
GROUP BY identificador_ciudad
ORDER by CUC, identificador_ciudad;	

--Fechas con mayores ventas

SELECT 
	distinct(date_part('year', fecha_retorno)) AS anio,
	COUNT(renta_id) OVER (PARTITION BY date_part('year', fecha_retorno)) AS renta_fechas
FROM rentas
group by 
		anio,
		renta_id
order by anio;