#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7


Puntos Clave
1. La función print() es una función integrada imprime/envía un mensaje específico a la pantalla/ventana de consola.

2. Las funciones integradas, al contrario de las funciones definidas por el usuario, están siempre disponibles y no tienen que ser importadas. Python 3.7.1 viene con 69 funciones incorporadas. Puedes encontrar su lista completa en orden alfabético en Python Standard Library.

3. Para llamar a una función (invocación de función), debe utilizarse el nombre de la función seguido de un paréntesis. Puedes pasar argumentos a una función colocándolos dentro de los paréntesis. Se Deben separar los argumentos con una coma, por ejemplo, print("¡Hola,", "Mundo!"). una función print() "vacía" imprime una línea vacía a la pantalla.

4. Las cadenas de Python están delimitadas por comillas, por ejemplo, "Soy una cadena", o 'Yo soy una cadena, también'.

5. Los programas de computadora son colecciones de instrucciones. Una instrucción es un comando para realizar una tarea específica cuando se ejecuta, por ejemplo, para imprimir un determinado mensaje en la pantalla.

6. En las cadenas de Python, la barra diagonal inversa (\) es un carácter especial que anuncia que el siguiente carácter tiene un significado diferente, por ejemplo, \n (el carácter de nueva línea) comienza una nueva línea de salida.

7. Los argumentos posicionales son aquellos cuyo significado viene dictado por su posición, por ejemplo, el segundo argumento se emite después del primero, el tercero se emite después del segundo, etc.

8. Los argumentos de palabra clave son aquellos cuyo significado no está dictado por su ubicación, sino por una palabra especial (palabra clave) que se utiliza para identificarlos.

9. Los parámetros end y sep se pueden usar para dar formato la salida de la función print(). El parámetro sep especifica el separador entre los argumentos emitidos (por ejemplo, print("H", "E", "L", "L", "O", sep="-"), mientras que el parámetro end especifica que imprimir al final de la declaración de impresión.

Literales - los datos en si mismos
Ahora que tienes un poco de conocimiento acerca de algunas de las poderosas características que ofrece la función print(), es tiempo de aprender sobre cuestiones nuevas, y un nuevo término - el literal.


10. La función print() envía datos a la consola, mientras que la función input() obtiene datos de la consola.

11. La función input() viene con un parámetro inicial: un mensaje de tipo cadena para el usuario. Permite escribir un mensaje antes de la entrada del usuario, por ejemplo:

name = input("Ingresa tu nombre: ")
print("Hola, " + name + ". ¡Un gusto conocerte!")


12. Cuando la función input() es llamada o invocada, el flujo del programa se detiene, el símbolo del cursor se mantiene parpadeando (le está indicando al usuario que tome acción ya que la consola está en modo de entrada) hasta que el usuario haya ingresado un dato y/o haya presionado la tecla Enter.

NOTA

Puedes probar la funcionalidad completa de la función input() localmente en tu máquina. Por razones de optimización, se ha limitado el máximo número de ejecuciones en Edube a solo algunos segundos únicamente. Ve a Sandbox, copia y pega el código que está arriba, ejecuta el programa y espera unos segundos. Tu programa debe detenerse después de unos segundos. Ahora abre IDLE, y ejecuta el mismo programa ahí -¿Puedes notar alguna diferencia?

Consejo: La característica mencionada anteriormente de la función input() puede ser utilizada para pedirle al usuario que termine o finalice el programa. Observa el siguiente código:

name = input("Ingresa tu nombre: ")
print("Hola, " + name + ". ¡Un gusto conocerte!")

print("\nPresiona la tecla Enter para finalizar el programa.")
input()
print("FIN.")


13. El resultado de la función input() es una cadena. Se pueden unir cadenas unas con otras a través del operador de concatenación (+). Observa el siguiente código:

num_1 = input("Ingresa el primer número: ") # Ingresa 12
num_2 = input("Ingresa el segundo número: ") # Ingresa 21

print(num_1 + num_2) el programa retorna 1221


14. También se pueden multiplicar (* - replicación) cadenas, por ejemplo:

my_input = input("Ingresa algo: ") # Ejemplo: hola
print(my_input * 3) # Salida esperada: holaholahola
