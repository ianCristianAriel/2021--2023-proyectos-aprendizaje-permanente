#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7

Puntos Clave

1. La lista es un tipo de dato en Python que se utiliza para almacenar múltiples objetos. Es una colección ordenada y mutable de elementos separados por comas entre corchetes, por ejemplo:

my_list = [1, None, True, "Soy una cadena", 256, 0]


2. Las listas se pueden indexar y actualizar , por ejemplo:

my_list = [1, None, True, 'Soy una cadena', 256, 0]
print(my_list[3])  # salida: Soy una cadena
print(my_list[-1])  # salida: 0

my_list[1] = '?'
print(my_list)  # salida: [1, '?', True, 'Soy una cadena', 256, 0]

my_list.insert(0, "primero")
my_list.append("último")
print(my_list)  # outputs: ['primero', 1, '?', True, 'Soy una cadena', 256, 0, 'último']


3. Las listas pueden estar anidadas, por ejemplo:

my_list = [1, 'a', ["lista", 64, [0, 1], False]]


Aprenderás más sobre el anidamiento en el módulo 3.7; por el momento, solo queremos que sepas que algo como esto también es posible.

4. Los elementos de la lista y las listas se pueden eliminar, por ejemplo:

my_list = [1, 2, 3, 4]
del my_list[2]
print(my_list)  # salida: [1, 2, 4]

del my_list  # borra la lista entera


Nuevamente, aprenderás más sobre esto en el módulo 3.6, no te preocupes. Por el momento, intenta experimentar con el código anterior y verifica cómo cambiarlo afecta la salida.

5.Las listas pueden ser iteradas mediante el uso del bucle for, por ejemplo:

my_list = ["blanco", "purpura", "azul", "amarillo", "verde"]

for color in my_list:
    print(color)


6. La función len() se puede usar para verificar la longitud de la lista, por ejemplo:

my_list = ["blanco", "purpura", "azul", "amarillo", "verde"]
print(len(my_list))  # salida 5

del my_list[2]
print(len(my_list))  # salida 4


7. Una invocación típica de función tiene el siguiente aspecto: result = function(arg), mientras que una invocación típica de un método se ve así: result = data.method(arg).

8. Puedes usar el método sort() para ordenar los elementos de una lista, por ejemplo:

lst = [5, 3, 1, 2, 4]
print(lst)

lst.sort()
print(lst)  # outputs: [1, 2, 3, 4, 5]


9.También hay un método de lista llamado reverse(), que puedes usar para invertir la lista, por ejemplo:

lst = [5, 3, 1, 2, 4]
print(lst)

lst.reverse()
print(lst)  # salida: [4, 2, 1, 3, 5]

10. Si tienes una lista list_1, y la siguiente asignación: list_2 = list_1 esto no hace una copia de la lista list_1, pero hace que las variables list_1 y list_2 apunten a la misma lista en la memoria. Por ejemplo:

vehicles_one = ['carro', 'bicicleta', 'motor']
print(vehicles_one) # salida: [carro', 'bicicleta', 'motor']

vehicles_two = vehicles_one
del vehicles_one[0] # elimina 'carro'
print(vehicles_two) # salida: ['bicicleta', 'motor']


11. Si deseas copiar una lista o parte de la lista, puedes hacerlo haciendo uso de rebanadas:

colors = ['rojo', 'verde', 'naranja']

copy_whole_colors = colors[:]  # copia la lista entera
copy_part_colors = colors[0:2]  # copia parte de la lista


12. También puede utilizar índices negativos para hacer uso de rebanadas. Por ejemplo:

sample_list = ["A", "B", "C", "D", "E"]
new_list = sample_list[2:-1]
print(new_list)  # outputs: ['C', 'D']


13. Los parámetros start y end son opcionales al partir en rebanadas una lista: list[start:end], por ejemplo:

my_list = [1, 2, 3, 4, 5]
slice_one = my_list[2: ]
slice_two = my_list[ :2]
slice_three = my_list[-2: ]

print(slice_one)  # salida: [3, 4, 5]
print(slice_two)  # salida: [1, 2]
print(slice_three)  # salida: [4, 5]


14. Puedes eliminar rebanadas utilizando la instrucción del:

my_list = [1, 2, 3, 4, 5]
del my_list[0:2]
print(my_list)  # salida: [3, 4, 5]

del my_list[:]
print(my_list)  # delimina el contenido de la lista, genera: []


15. Puedes probar si algunos elementos existen en una lista o no utilizando las palabras clave in y not in, por ejemplo:

my_list = ["A", "B", 1, 2]

print("A" in my_list)  # salida: True
print("C" not in my_list)  # salida: True
print(2 not in my_list)  # salida: False

16. La comprensión de listas te permite crear nuevas listas a partir de las existentes de una manera concisa y elegante. La sintaxis de una comprensión de lista es la siguiente:

[expression for element in list if conditional]


El cual es un equivalente del siguiente código:

for element in list:
    if conditional:
        expression


Este es un ejemplo de una comprensión de lista: el código siguiente crea una lista de cinco elementos con los primeros cinco números naturales elevados a la potencia de 3:

cubed = [num ** 3 for num in range(5)]
print(cubed)  # outputs: [0, 1, 8, 27, 64]


17. Puedes usar listas anidadas en Python para crear matrices (es decir, listas bidimensionales). Por ejemplo:

#  Una tabla de cuatro columnas y cuatro filas: un arreglo bidimensional (4x4)

table = [[":(", ":)", ":(", ":)"],
         [":)", ":(", ":)", ":)"],
         [":(", ":)", ":)", ":("],
         [":)", ":)", ":)", ":("]]

print(table)
print(table[0][0])  # outputs: ':('
print(table[0][3])  # outputs: ':)'

18. Puedes anidar tantas listas en las listas como desee y, por lo tanto, crear listas n-dimensionales, por ejemplo, arreglos de tres, cuatro o incluso sesenta y cuatro dimensiones. Por ejemplo:

print(cube)
print(cube[0][0][0])  # outputs: ':('
print(cube[2][2][0])  # outputs: ':)'
