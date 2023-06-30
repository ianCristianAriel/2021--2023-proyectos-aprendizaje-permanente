
#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7

Puntos Clave

1. Un iterator es un objeto de una clase que proporciona al menos dos métodos (sin contar el constructor):

__iter__() se invoca una vez cuando se crea el iterador y devuelve el propio objeto del iterador.
__next__() se invoca para proporcionar el valor de la siguiente iteración y genera la excepción StopIteration cuando la iteración llega a su fin.

2. La sentencia yield solo puede ser utilizada dentro de funciones. La sentencia yield suspende la ejecución de la función y hace que la función regrese el argumento de yield como resultado. Esta función no puede invocarse de forma regular, su único propósito es ser utilizada como un generador (es decir, en un contexto que requiera una serie de valores, como un bucle for).


3. Una expresión condicional es una expresión construida usando el operador if-else. Por ejemplo:

print(True if 0 >= 0 else False)


Da como salida: True.


4. Una lista por comprensión se convierte en un generador cuando se emplea dentro de paréntesis (usado entre corchetes, produce una lista regular). Por ejemplo:

for x in (el * 2 for el in range(5)):
    print(x)

Da como salida: 02468.


4. Una función lambda es una herramienta para crear funciones anónimas. Por ejemplo:

def foo(x, f):
    return f(x)

print(foo(9, lambda x: x ** 0.5))


Da como salida: 3.0.


5. La función map(fun, list) crea una copia del argumento list, y aplica la función fun a todos sus elementos, retornando un generador que proporciona el nuevo contenido de la lista elemento por elemento. Por ejemplo:

short_list = ['mython', 'python', 'fell', 'on', 'the', 'floor']
new_list = list(map(lambda s: s.title(), short_list))
print(new_list)


Da como salida: ['Mython', 'Python', 'Fell', 'On', 'The', 'Floor'].


6. La función filter(fun, list) crea una copia de aquellos elementos de list, lo cual hace que la función fun retorne True. El resultado de la función es un generador proporcionando el nuevo contenido de la lista elemento por elemento. Por ejemplo

short_list = [1, "Python", -1, "Monty"]
new_list = list(filter(lambda s: isinstance(s, str), short_list))
print(new_list)


Da como salida: ['Python', 'Monty'].


7. Un cierre es una técnica que permite almacenar valores a pesar de que el contexto en el que han sido creados no existe más. Por ejemplo:

def tag(tg):
    tg2 = tg
    tg2 = tg[0] + '/' + tg[1:]

    def inner(str):
        return tg + str + tg2
    return inner


b_tag = tag('<b>')
print(b_tag('Monty Python'))


Da como salida: <b>Monty Python</b>