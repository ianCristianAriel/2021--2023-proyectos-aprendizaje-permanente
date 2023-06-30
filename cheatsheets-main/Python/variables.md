#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7


Puntos Clave

1. Una variable es una ubicación nombrada reservada para almacenar valores en la memoria. Una variable es creada o inicializada automáticamente cuando se le asigna un valor por primera vez. (2.1.4.1)

2. Cada variable debe de tener un nombre único - un identificador. Un nombre válido debe ser aquel que no contiene espacios, debe comenzar con un guion bajo (_), o una letra, y no puede ser una palabra reservada de Python. El primer carácter puede estar seguido de guiones bajos, letras, y dígitos. Las variables en Python son sensibles a mayúsculas y minúsculas. (2.1.4.1)

3. Python es un lenguaje de tipo dinámico, lo que significa que no se necesita declarar variables en él. (2.1.4.3) Para asignar valores a las variables, se utiliza simplemente el operador de asignación, es decir el signo de igual (=) por ejemplo, var = 1.

4. También es posible utilizar operadores de asignación compuesta (operadores abreviados) para modificar los valores asignados a las variables, por ejemplo, var += 1, or var /= 5 * 2. (2.1.4.8)

5. Se les puede asignar valores nuevos a variables ya existentes utilizando el operador de asignación o un operador abreviado, por ejemplo (2.1.4.5):

var = 2
print(var)

var = 3
print(var)

var += 1
print(var)


6. Se puede combinar texto con variables empleado el operador +, y utilizar la función print() para mostrar o imprimir los resultados, por ejemplo: (2.1.4.4)

var = "007"
print("Agente " + var)