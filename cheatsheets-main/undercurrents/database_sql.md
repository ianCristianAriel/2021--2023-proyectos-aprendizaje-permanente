# SQL

**1. Tipos de datos.**

**2. Manipulación de datos:**
- `SELECT * FROM tabla;`
- `INSERT INTO tabla (columna1, columna2) VALUES (valor1, valor2);`
- `UPDATE tabla SET columna1 = valor1 WHERE condición;`
- `DELETE FROM tabla WHERE condición;`

**3. láusulas:**
- `SELECT columnas FROM tabla WHERE condición ORDER BY columna ASC/DESC GROUP BY columna HAVING condición;`

**4. Operadores en SQL:**

**5. Operadores aritméticos:**
- Suma: `SELECT columna1 + columna2 AS suma FROM tabla;`
- Resta: `SELECT columna1 - columna2 AS resta FROM tabla;`
- Multiplicación: `SELECT columna1 * columna2 AS multiplicacion FROM tabla;`
- División: `SELECT columna1 / columna2 AS division FROM tabla;`

**6. Operadores lógicos:**
- AND: `SELECT * FROM tabla WHERE condicion1 AND condicion2;`
- OR: `SELECT * FROM tabla WHERE condicion1 OR condicion2;`
- NOT: `SELECT * FROM tabla WHERE NOT condicion;`

**7. Operadores de comparación:**
- Igual a: `SELECT * FROM tabla WHERE columna = valor;`
- Diferente de: `SELECT * FROM tabla WHERE columna != valor;`
- Mayor que: `SELECT * FROM tabla WHERE columna > valor;`
- Menor que: `SELECT * FROM tabla WHERE columna < valor;`
- Mayor o igual que: `SELECT * FROM tabla WHERE columna >= valor;`
- Menor o igual que: `SELECT * FROM tabla WHERE columna <= valor;`

**8. Tablas y Relaciones:**
- Creación y modificación de tablas:
  - `CREATE TABLE nombre_tabla (columna1 tipo1, columna2 tipo2, PRIMARY KEY (columna_primaria));`
  - `ALTER TABLE nombre_tabla ADD COLUMN nueva_columna tipo;`
- Claves primarias y foráneas.
```
  CREATE TABLE tabla1 (
      id INT PRIMARY KEY,
      nombre VARCHAR(50)
  );
```
```
  CREATE TABLE tabla2 (
      id INT PRIMARY KEY,
      tabla1_id INT,
      FOREIGN KEY (tabla1_id) REFERENCES tabla1(id)
  );
```

- Relaciones entre tablas.

**9. Consultas Avanzadas:**
- JOINS:
  - `SELECT * FROM tabla1 INNER JOIN tabla2 ON tabla1.columna = tabla2.columna;`
  - `SELECT * FROM tabla1 LEFT JOIN tabla2 ON tabla1.columna = tabla2.columna;`
  - `SELECT * FROM tabla1 RIGHT JOIN tabla2 ON tabla1.columna = tabla2.columna;`
  - `SELECT * FROM tabla1 FULL JOIN tabla2 ON tabla1.columna = tabla2.columna;`
- Subconsultas y consultas anidadas.
  - `SELECT nombre FROM empleados WHERE departamento_id IN (SELECT id FROM departamentos WHERE nombre = 'Ventas');`
- Expresiones condicionales.
  - `SELECT * FROM productos WHERE precio > 100 AND cantidad_disponible > 0;`
- Funciones agregadas.
  - `SELECT AVG(edad) AS edad_promedio FROM empleados;`

**10. Indices y Optimización de Consultas:**
- Uso de índices:
  - `CREATE INDEX index_nombre ON tabla (columna);`
- Estrategias para optimizar consultas.
  - `CREATE INDEX index_nombre ON tabla (columna);`

**11. Procedimientos Almacenados y Funciones:**
- Creación y uso de procedimientos almacenados:
  - `CREATE PROCEDURE nombre_procedimiento (parámetros) AS BEGIN ... END;`
  - `EXEC nombre_procedimiento;`
- Funciones definidas por el usuario.
  - 
```
CREATE FUNCTION calcular_impuesto(salario INT) RETURNS INT AS
BEGIN
    RETURN salario * 0.15;
END;
```

**12. Transacciones y Control de Concurrencia:**
- Concepto de transacciones:
  - `BEGIN TRANSACTION;`
  - `COMMIT;`
  - `ROLLBACK;`

- Control de bloqueo y concurrencia.
  - ```
    BEGIN TRANSACTION;
    -- Operaciones
    COMMIT;```

**13. SQL Avanzado:**
- Ventanas y funciones analíticas:
  - `SELECT columna, ROW_NUMBER() OVER (PARTITION BY particion ORDER BY orden_columna) AS row_num FROM tabla;`
  - `SELECT columna, AVG(valor) OVER (PARTITION BY particion ORDER BY orden_columna) AS promedio_movil FROM tabla;`
- Operadores SET (UNION, INTERSECT, EXCEPT):
  - Union: `SELECT columna FROM tabla1 UNION SELECT columna FROM tabla2;`
  - Intersección: `SELECT columna FROM tabla1 INTERSECT SELECT columna FROM tabla2;`
  - Diferencia: `SELECT columna FROM tabla1 EXCEPT SELECT columna FROM tabla2;`
- Desencadenadores (Triggers):
  - `CREATE TRIGGER nombre_trigger BEFORE INSERT ON tabla FOR EACH ROW BEGIN ... END;`

**14. Optimización Avanzada:**
- Planes de ejecución.
  `EXPLAIN SELECT * FROM empleados WHERE departamento_id = 1;`

- Perfiles de rendimiento.
  - ``` SET profiling = 1; -- Tu consulta; HOW PROFILES;```

- Herramientas de monitoreo.

**15. Seguridad en SQL:**
- Usuarios y roles:
  - `CREATE USER nombre_usuario WITH PASSWORD 'contraseña';`
  - `GRANT privilegio ON objeto TO usuario;`
  - `REVOKE privilegio ON objeto FROM usuario;`
- Control de acceso.
  - `CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña';`
  - `GRANT SELECT, INSERT ON base_de_datos.tabla TO 'nombre_usuario'@'localhost';`

- Encriptación de datos.
  - 
  ```
    CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    contrasena VARBINARY(64) -- Almacena la contraseña de forma encriptada
);
```