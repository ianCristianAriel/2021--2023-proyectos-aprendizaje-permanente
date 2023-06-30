# Transporte
![transporte](https://raw.githubusercontent.com/ianCristianAriel/transporte/main/transporte.png)
## Descripción
Cursando en "Platzi" la ruta de "Data engineer", espesificamente el curso  "Curso de PostgreSQL" impartido por el profesor Oswaldo Rodríguez González, se debia crear el siguiente proyecto de aplicación que consiste en una base de datos **"Transporte" **la cual contiene 6 tablas, 5 de ellas se encuentran relacionadas puramente para el caso de estudio, mientras que la restante tiene dos disparadores enlazados con la tabla** "trenes"** el primero para almacenar la fecha de cuando se inserta un registro nuevo en la tabla y el segundo para almacenar la fecha cuando se elemina un registro.
Dentro del primer grupo, que contiene 5 tablas se almacena:
**"trayectos"** el identificador del trayecto, identificador del viaje, identificador del tren y el nombre del trayecto.
**"trenes"** el identificador, modelo del tren y capacidad del mismo. 
**"estaciones" **el identificador, nombre de la estacion y su dirección.
**"viaje"** el identificador, el identificador del pasajero, el identificador del trayecto, la fecha de inicio del viaje y la fecha del fin del viaje.
**"pasajeros"** el identificador, nombre y la fecha de nacimeinto del pasajero.
### Funcionalidades:

**Relacionar informacion sobre:**

- Trayectos mas realizados por los pasajeros
- Viajes hechos por usuario
- Fechas de viajes
- Trenes mas utilizados
- Pasajeros que mas viajan
- Horas en las que viaja un determinado pasajero

### Tecnologias utilizadas:
SQL -> ** MySQL**
### Estado del proyecto:
Finalizado
### Desarrolladores:

**@IanCristianYane**

### Licencia: 
Platzi, Curso de PostgresSQL, Oswaldo Rodríguez González: https://platzi.com/cursos/postgresql/
