#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7

Puntos Clave

1.Para leer el contenido de un archivo, se pueden utilizar los siguientes métodos:

read(number): lee elnúmero de carácteres/bytes del archivo y los retorna como una cadena, es capaz de leer todo el archivo a la vez.
readline(): lee una sola línea del archivo de texto.
readlines(number): lee el número de líneas del archivo de texto; es capaz de leer todas las líneas a la vez.
readinto(bytearray): lee los bytes del archivo y llena el bytearray con ellos.

2. Para escribir contenido nuevo en un archivo, se pueden utilizar los siguientes métodos:

write(string): escribe una cadena a un archivo de texto.
write(bytearray): escribe todos los bytes de un bytearray a un archivo.

3. El método open() devuelve un objeto iterable que se puede usar para recorrer todas las líneas del archivo dentro de un bucle for. Por ejemplo:

for line in open("file", "rt"):
    print(line, end='')


El código copia el contenido del archivo a la consola, línea por línea. Nota: el stream se cierra automáticamente cuando llega al final del archivo.

4. Un archivo necesita ser abierto antes de que pueda ser procesado por un programa, y debe ser cerrado cuando el procesamiento termine.

El abrir un archivo lo asocia con el stream, que es una representación abstracta de los datos físicos almacenados en los medios. La forma en que se procesa el stream se llama modo de apertura. Existen tres modos de apertura:

modo lectura: solo se permiten operaciones de lectura.
modo escritura: solo se permiten operaciones de escritura.
modo de actualización: se permiten ambas, lectura y escritura.

5. Dependiendo del contenido del archivo físico, se pueden usar diferentes clases de Python para procesar archivos. En general, BufferedIOBase es capaz de procesar cualquier archivo, mientras que TextIOBase es una clase especializada dedicada al procesamiento de archivos de texto (es decir, archivos que contienen textos visibles para humanos divididos en líneas usando marcadores de nueva línea). Por lo tanto, los streams se pueden dividir en binarios y de texto.

6. Las siguientes sintaxis de la funcion open() se utilizan para abrir un archivo:

open(nombre_archivo, modo=modo_apertura, codificación=codificacion_de_texto)

La invocación crea un objeto stream y lo asocia con el archivo llamado nombre_archivo, utilizando el modo modo_apertura y configurando la especificada codificacion_de_texto, o genera una excepción en caso de un error.

7. Los tres streams predefinidos que ya estan abiertos cuando inicia el programa son:

sys.stdin â entrada estandar.
sys.stdout â salida estandar.
sys.stderr â salida de error estandar.

8. El objeto de la excepción IOError, creado cuando cualquier operación de archivo falla (incluyendo las operaciones de apertura), contiene una propiedad llamada errno, que contiene el código de finalización de la acción fallida. Utiliza este valor para diagnosticar el problema.