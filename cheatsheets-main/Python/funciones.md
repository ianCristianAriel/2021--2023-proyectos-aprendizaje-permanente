#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7

Puntos Clave

1. Una función es un bloque de código que realiza una tarea especifica cuando la función es llamada (invocada). Las funciones son útiles para hacer que el código sea reutilizable, que este mejor organizado y más legible. Las funciones contienen parámetros y pueden regresar valores.

2. Existen al menos cuatro tipos de funciones básicas en Python:

Funciones integradas las cuales son partes importantes de Python (como lo es la función print()). Puedes ver una lista completa de las funciones integradas de Python en la siguiente liga: https://docs.python.org/3/library/functions.html.
También están las que se encuentran en módulos pre-instalados (se hablará acerca de ellas en el curso Fundamentos de Python 2).
Funciones definidas por el usuario las cuales son escritas por los programadores para los programadores, puedes escribir tus propias funciones y utilizarlas libremente en tu código.
Las funciones lambda (aprenderás acerca de ellas en el curso Fundamentos de Python 2).

3. Las funciones propias se pueden definir utilizando la palabra reservada def y con la siguiente sintaxis:

def your_function(optional parameters):
    # el cuerpo de la función


Se puede definir una función sin que haga uso de argumentos, por ejemplo:

def message():    # definiendo una función
    print("Hello")    # cuerpo de la función

message()    # invocación de la función


También es posible definir funciones con argumentos, como la siguiente que contiene un solo parámetro:

def hello(name):    # definiendo una función
    print("Hola,", name)    # cuerpo de la función


name = input("Ingresa tu nombre: ")

hello(name)    # invocación de la función

Puntos Clave
1. Se puede pasar información a las funciones utilizando parámetros. Las funciones pueden tener tantos parámetros como sean necesarios.

Un ejemplo de una función con un parámetro:

def hi(name):
    print("Hola,", name)

hi("Greg")


Un ejemplo de una función de dos parámetros:

def hi_all(name_1, name_2):
    print("Hola,", name_2)
    print("Hola,", name_1)

hi_all("Sebastián", "Konrad")


Un ejemplo de una función de tres parámetros:

def address(street, city, postal_code):
    print("Tu dirección es:", street, city, postal_code)

s = input("Calle: ")
p_c = input("Código Postal: ")
c = input("Ciudad: ")

address(s, c, p_c)


2. Puedes pasar argumentos a una función utilizando las siguientes técnicas:

Paso de argumentos posicionales en la cual el orden de los parámetros es relevante (Ejemplo 1).
Paso de argumentos con palabras clave en la cual el orden de los argumentos es irrelevante (Ejemplo 2).
Una mezcla de argumentos posicionales y con palabras clave (Ejemplo 3).
#Ejemplo 1
def subtra(a, b):
    print(a - b)

subtra(5, 2)    # salida: 3
subtra(2, 5)    # salida: -3


#Ejemplo 2
def subtra(a, b):
    print(a - b)

subtra(a=5, b=2)    # salida: 3
subtra(b=2, a=5)    # salida: 3

#Ejemplo 3
def subtra(a, b):
    print(a - b)

subtra(5, b=2)    # salida: 3
subtra(5, 2)    # salida: 3


Es importante recordar que primero se especifican los argumentos posicionales y después los de palabras clave. Es por esa razón que si se intenta ejecutar el siguiente código:

def subtra(a, b):
    print(a - b)

subtra(5, b=2)    # salida: 3
subtra(a=5, 2)    # Syntax Error

Python no lo ejecutará y marcará un error de sintaxis SyntaxError.


3. Se puede utilizar la técnica de argumentos con palabras clave para asignar valores predefinidos a los argumentos:

def name(first_name, last_name="Pérez"):
    print(first_name, last_name)

name("Andy")    # salida: Andy Pérez
name("Bety", "Rodríguez")    # salida: Bety Rodríguez (el argumento de palabra clave es reemplazado por "Rodríguez")


1. Puedes emplear la palabra clave reservada return para decirle a una función que devuelva algún valor. La instrucción return termina la función, por ejemplo:

def multiply(a, b):
    return a * b

print(multiply(3, 4))    # salida: 12


def multiply(a, b):
    return

print(multiply(3, 4))    # salida: None


2. El resultado de una función se puede asignar fácilmente a una variable, por ejemplo:

def wishes():
    return "¡Felíz Cumpleaños!"

w = wishes()

print(w)    # salida:¡Felíz Cumpleaños!

Observa la diferencia en la salida en los siguientes dos ejemplos:

# Ejemplo 1
def wishes():
    print("Mis deseos")
    return "Felíz Cumpleaños"

wishes()    # salida: Mis deseos


# Ejemplo 2
def wishes():
    print("Mis deseos")
    return "Felíz Cumpleaños"

print(wishes())

# salida: Mis deseos
#         Felíz Cumpleaños


3. Puedes usar una lista como argumento de una función, por ejemplo:

def hi_everybody(my_list):
    for name in my_list:
        print("Hola,", name)

hi_everybody(["Adán", "Juan", "Lucía"])


4. Una lista también puede ser un resultado de función, por ejemplo:

def create_list(n):
    my_list = []
    for i in range(n):
        my_list.append(i)
    return my_list

print(create_list(5))

1. Una variable que existe fuera de una función tiene alcance dentro del cuerpo de la función. (Ejemplo 1) al menos que la función defina una variable con el mismo nombre. (Ejemplo 2, y Ejemplo 3), por ejemplo:

Ejemplo 1:

var = 2


def mult_by_var(x):
    return x * var


print(mult_by_var(7))    # salida: 14


Ejemplo 2:

def mult(x):
    var = 5
    return x * var


print(mult(7))    # salida: 35


Ejemplo 3:

def mult(x):
    var = 7
    return x * var


var = 3
print(mult(7))    # salida: 49


2. Una variable que existe dentro de una función tiene un alcance solo dentro del cuerpo de la función (Ejemplo 4), por ejemplo:

Ejemplo 4:

def adding(x):
    var = 7
    return x + var


print(adding(4))    # salida: 11
print(var)    # NameError


3. Se puede emplear la palabra clave reservada global seguida por el nombre de una variable para que el alcance de la variable sea global, por ejemplo:

var = 2
print(var)    # salida: 2


def return_var():
    global var
    var = 5
    return var


print(return_var())    # salida: 5
print(var)    # salida: 5

1. Una función puede invocar otras funciones o incluso a sí misma. Cuando una función se invoca a si misma, se le conoce como recursividad, y la función que se invoca a si misma y contiene una condición de terminación (la cual le dice a la función que ya no siga invocándose a si misma) es llamada una función recursiva.

2. Se pueden emplear funciones recursivas en Python para crear funciones limpias, elegantes, y dividir el código en trozos más pequeños. Sin embargo, se debe tener mucho cuidado ya que es muy fácil cometer un error y crear una función la cual nunca termine. También se debe considerar que las funciones recursivas consumen mucha memoria, y por lo tanto pueden ser en ocasiones ineficientes.

Al emplear la recursividad, se deben de tomar en cuenta tanto sus ventajas como desventajas.

La función factorial es un ejemplo clásico de como se puede implementar el concepto de recursividad:

# Implementación recursiva de la función factorial.

def factorial(n):
    if n == 1:    # El caso base (condición de terminación).
        return 1
    else:
        return n * factorial(n - 1)


print(factorial(4)) # 4 * 3 * 2 * 1 = 24

