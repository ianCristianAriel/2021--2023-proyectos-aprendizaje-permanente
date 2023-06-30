#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7

Puntos Claves
1. La función uname devuelve un objeto que contiene información sobre el sistema operativo actual. El objeto tiene los siguientes atributos:

systemname (almacena el nombre del sistema operativo)
nodename (almacena el nombre de la máquina en la red)
release (almacena el release (actualización) del sistema operativo)
version (almacena la versión del sistema operativo)
machine (almacena el identificador de hardware, por ejemplo, x86_64)

2. El atributo name disponible en el módulo os te permite distinguir el sistema operativo. Devuelve uno de los siguientes tres valores:

posix (obtendrás este nombre si usas Unix)
nt (obtendrás este nombre si usas Windows)
java (obtendrá este nombre si tu código está escrito en algo como Jython)

3. La función mkdir crea un directorio en la ruta pasada como argumento. La ruta puede ser relativa o absoluta, por ejemplo:

import os

os.mkdir("hello") # la ruta relativa
os.mkdir("/home/python/hello") # la ruta absoluta

Nota: Si el directorio existe, una excepción FileExistsError será generada. Además de la función mkdir, el módulo os proporciona la función makedirs, que te permite crear recursivamente todos los directorios en una ruta.

4. El resultado de la función listdir() es una lista que contiene los nombres de los archivos y directorios que se encuentran en la ruta pasada como argumento.

Es importante recordar que la función listdiromite las entradas '.' y '..', que se muestran, por ejemplo, cuando se utiliza el comando ls -a en sistemas Unix. Si no se pasa la ruta, el resultado se devolverá para el directorio de trabajo actual.

5. Para moverte entre directorios, puedes usar una función llamada chdir(), que cambia el directorio de trabajo actual a la ruta especificada. Como argumento, toma cualquier ruta relativa o absoluta.

Si deseas averiguar cuál es el directorio de trabajo actual, puedes usar la función getcwd(), que devuelve la ruta actual.

6. Para eliminar un directorio, puedes usar la función rmdir(), pero para eliminar un directorio y sus subdirectorios, emplea la función removedirs().

7. Tanto en Unix como en Windows, puedes usar la función system, que ejecuta el comando que se le pasa como cadena, por ejemplo:

import os

returned_value = os.system("mkdir hello")


La función system en Windows devuelve el valor devuelto por el shell después de ejecutar el comando dado, mientras que en Unix devuelve el estado de salida del proceso.

##Date time
Puntos Clave
1. Para crear un objeto date, debes pasar los argumentos de año, mes y día de la siguiente manera:

from datetime import date

my_date = date(2020, 9, 29)
print("Año:", my_date.year) # Año: 2020
print("Mes:", my_date.month) # Mes: 9
print("Día:", my_date.day) # Día: 29


El objeto date tiene tres atributos (de solo lectura): año, mes y día.


2. El método today devuelve un objeto de fecha que representa la fecha local actual:

from datetime import date
print("Hoy:", date.today()) # Muestra: Hoy: 2020-09-29



3. En Unix, la marca de tiempo expresa el número de segundos desde el 1 de Enero de 1970 a las 00:00:00 (UTC). Esta fecha se llama la "época de Unix", porque ahí comenzó el conteo del tiempo en los sistemas Unix. La marca de tiempo es en realidad la diferencia entre una fecha en particular (incluida la hora) y el 1 de Enero de 1970, 00:00:00 (UTC), expresada en segundos. Para crear un objeto de fecha a partir de una marca de tiempo, debemos pasar una marca de tiempo Unix al método fromtimestamp:

from datetime import date
import time

timestamp = time.time()
d = date.fromtimestamp(timestamp)


Nota: La función time devuelve el número de segundos desde el 1 de Enero de 1970 hasta el momento actual en forma de número punto flotante.


4. El constructor de la clase time acepta seís argumentos (hour, minute, second, microsecond, tzinfo, y fold). Cada uno de estos argumentos es opcional.

from datetime import time

t = time(13, 22, 20)

print("Hora:", t.hour) # Hora: 13
print("Minuto:", t.minute) # Minuto: 22
print("Segundo:", t.second) # Segundo: 20


5. El módulo time contiene la función sleep, que suspende la ejecución del programa durante un número determinado de segundos, por ejemplo:

import time

time.sleep(10)
print("¡Hola mundo!") # Este texto se mostrará después de 10 segundos.



6. En el módulo datetime, la fecha y la hora se pueden representar como objetos separados o como un solo objeto. La clase que combina fecha y hora se llama datetime. Todos los argumentos pasados al constructor van a atributos de clase de solo lectura. Son year, month, day, hour, minute, second, microsecond, tzinfo, y fold:

from datetime import datetime

dt = datetime(2020, 9, 29, 13, 51)
print("Fecha y Hora:", dt) # Muestra: Fecha y Hora: 2020-09-29 13:51:00



7. El método strftime toma solo un argumento en forma de cadena que especifica un formato que puede constar de directivas. Una directiva es una cadena que consta del carácter % (porcentaje) y una letra minúscula o mayúscula. A continuación se muestran algunas directivas útiles:

%Y: devuelve el año con el siglo como número decimal.
%m: devuelve el mes como un número decimal con relleno de ceros.
%d: devuelve el día como un número decimal con relleno de ceros.
%H: devuelve la hora como un número decimal con relleno de ceros.
%M: devuelve el minuto como un número decimal con relleno de ceros.
%S: devuelve el segundo como un número decimal con relleno de ceros.
Ejemplo:

from datetime import date

d = date(2020, 9, 29)
print(d.strftime('%Y/%m/%d')) # Muestra: 2020/09/29



8. Es posible realizar cálculos en los objetos date y datetime, por ejemplo:

from datetime import date

d1 = date(2020, 11, 4)
d2 = date(2019, 11, 4)

d = d1 - d2
print(d) # Muestra: 366 days, 0:00:00.
print(d * 2) # Muestra: 732 days, 0:00:00.


El resultado de la resta se devuelve como un objeto timedelta que expresa la diferencia en días entre las dos fechas en el ejemplo anterior.

Toma en cuenta que también se muestra la diferencia en horas, minutos y segundos. El objeto timedelta se puede utilizar para realizar más cálculos (por ejemplo, puedes multiplicarlo por 2).

##Calendario
Puntos Claves
1. En el módulo calendar, los días de la semana se muestran de Lunes a Domingo. Cada día de la semana tiene su representación en forma de número entero, donde el primer día de la semana (Lunes) está representado por el valor 0, mientras que el último día de la semana (Domingo) está representado por el valor 6.


2. Para mostrar un calendario de cualquier año, se emplea la función calendar con el año pasado como argumento, por ejemplo:

import calendar
print(calendar.calendar(2020))


Nota: Una buena alternativa a la función anterior es la función llamada prcal, que también toma los mismos parámetros que la función calendar, pero no requiere el uso de la función print para mostrar el calendario.


3. Para mostrar un calendario de cualquier mes del año, se emplea la función month, pasándole el año y el mes. Por ejemplo:

import calendar
print(calendar.month(2020, 9))


Nota: También puedes usar la función prmonth, que tiene los mismos parámetros que la función month, pero no requiere el uso de la función print para mostrar el calendario.


4. La función setfirstweekday te permite cambiar el primer día de la semana. Toma un valor de 0 a 6, donde 0 es Domingo y 6 es Sábado.


5. El resultado de la función weekday es un día de la semana como un valor entero para un año, mes y día determinados:

import calendar
print(calendar.weekday(2020, 9, 29)) # Esto muestra 1, que significa Martes.



6. La función weekheader devuelve los nombres de los días de la semana en forma abreviada. El método weekheader requiere que se especifique el ancho en caracteres para un día de la semana. Si el ancho que proporciona es mayor que 3, aún se obtendrán los nombres abreviados de los días de la semana que constan de solo tres caracteres. Por ejemplo:

import calendar
print(calendar.weekheader(2)) # Esto muestra: Mo Tu We Th Fr Sa Su


7. Una función muy útil disponible en el módulo calendar es la función llamada isleap, que, como su nombre indica, te permite comprobar si el año es bisiesto o no:

import calendar
print(calendar.isleap(2020)) # Esto muestra: True


8. Puedes crear un objeto calendar tu mismo usando la clase Calendar, que, al crear el objeto, te permite cambiar el primer día de la semana con el parámetro opcionalfirstweekday, por ejemplo:

import calendar  

c = calendar.Calendar(2)

for weekday in c.iterweekdays():
    print(weekday, end=" ")
# Resultado: 2 3 4 5 6 0 1

iterweekdays devuelve un iterador para los números de los días de la semana. El primer valor devuelto siempre es igual al valor de la propiedad firstweekday.