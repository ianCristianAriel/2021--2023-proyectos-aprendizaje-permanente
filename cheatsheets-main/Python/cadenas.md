#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7

Puntos Claves

1. Las cadenas de Python son secuencias inmutables y se pueden indexar, dividir en rebanadas e iterar como cualquier otra secuencia, además de estar sujetas a los operadores in y not in. Existen dos tipos de cadenas en Python:

Cadenas de una línea, las cuales no pueden cruzar los límites de una línea, las denotamos usando apóstrofes ('cadena') o comillas ("cadena").
Cadenas multilínea, que ocupan más de una línea de código fuente, delimitadas por apóstrofes triples:

'''
cadena
'''


o

"""
cadena
"""


2. La longitud de una cadena está determinada por la función len(). El carácter de escape (\) no es contado. Por ejemplo:

print(len("\n\n"))


Su salida es 2.


3. Las cadenas pueden ser concatenadas usando el operador +, y replicadas usando el operador *. Por ejemplo:

asterisk = '*'
plus = "+"
decoration = (asterisk + plus) * 4 + asterisk
print(decoration)


salida *+*+*+*+*.


4. El par de funciones chr() y ord() se pueden utilizar para crear un carácter utilizando su punto de código y para determinar un punto de código correspondiente a un carácter. Las dos expresiones siguientes son siempre verdaderas:

chr(ord(character)) == character
ord(chr(codepoint)) == codepoint


5. Algunas otras funciones que se pueden aplicar a cadenas son:

list() â crea una lista que consta de todos los caracteres de la cadena.
max() â encuentra el carácter con el punto de código máximo.
min() â encuentra el carácter con el punto de código mínimo.

6. El método llamado index() encuentra el índice de una subcadena dada dentro de la cadena.

1. Algunos de los métodos que ofrecen las cadenas son:

capitalize(): cambia todas las letras de la cadena a mayúsculas.
center(): centra la cadena dentro de una longitud conocida.
count(): cuenta las ocurrencias de un carácter dado.
join(): une todos los elementos de una tupla/lista en una cadena.
lower(): convierte todas las letras de la cadena en minúsculas.
lstrip(): elimina los caracteres en blanco al principio de la cadena.
replace(): reemplaza una subcadena dada con otra.
rfind(): encuentra una subcadena comenzando por el final de la cadena.
rstrip(): elimina los caracteres en blanco al final de la cadena.
split(): divide la cadena en una subcadena usando un delimitador dado.
strip(): elimina los espacios en blanco iniciales y finales.
swapcase(): intercambia las mayúsculas y minúsculas de las letras.
title(): hace que la primera letra de cada palabra sea mayúscula.
upper(): convierte todas las letras de la cadena en letras mayúsculas.

2. El contenido de las cadenas se puede determinar mediante los siguientes métodos (todos devuelven valores booleanos):

endswith(): ¿La cadena termina con una subcadena determinada?
isalnum(): ¿La cadena consta solo de letras y dígitos?
isalpha(): ¿La cadena consta solo de letras?
islower(): ¿La cadena consta solo de letras minúsculas?
isspace(): ¿La cadena consta solo de espacios en blanco?
isupper(): ¿La cadena consta solo de letras mayúsculas?
startswith(): ¿La cadena consta solo de letras mayúsculas?

Puntos Claves

1. Las cadenas se pueden comparar con otras cadenas utilizando operadores de comparación generales, pero compararlas con números no da un resultado razonable, porque ninguna cadena puede ser igual a ningún otro número. Por ejemplo:

cadena == número es siempre False (falso).
cadena != número es siempre True (verdadero).
cadena >= número siempre genera una excepción.

2. El ordenamiento de listas de cadenas se puede realizar mediante:

Una función llamada sorted(), crea una nueva, lista ordenada.
Un método llamado sort(), el cual ordena la lista en el momento.

3. Un número se puede convertir en una cadena empleando la función str().

4. Una cadena se puede convertir en un número (aunque no todas las cadenas) empleando ya sea la función int() o float(). La conversión falla si la cadena no contiene un número válido (se genera una excepción en dicho caso).

1. Las cadenas son herramientas clave en el procesamiento de datos modernos, ya que la mayoría de los datos útiles son en realidad cadenas. Por ejemplo, el uso de un motor de búsqueda web (que parece bastante trivial en estos días) utiliza un procesamiento de cadenas extremadamente complejo, que involucra cantidades inimaginables de datos.

2. El comparar cadenas de forma estricta (como lo hace Python) puede ser muy insatisfactorio cuando se trata de búsquedas avanzadas (por ejemplo, durante consultas extensas a bases de datos). En respuesta a esta demanda, se han creado e implementado una serie de algoritmos de comparación de cadenas difusos. Estos algoritmos pueden encontrar cadenas que no son iguales en el sentido de Python, pero que son similares.

Uno de esos conceptos es la Distancia Hamming, que se utiliza para determinar la similitud de dos cadenas. Si este tema te interesa, puedes encontrar más información al respecto aquí: https://en.wikipedia.org/wiki/Hamming_distance. Otra solución del mismo tipo, pero basada en un supuesto diferente, es la Distancia Levenshtein descrita aquí: https://en.wikipedia.org/wiki/Levenshtein_distance.




3. Otra forma de comparar cadenas es encontrar su similitud acústica, lo que significa un proceso que lleva a determinar si dos cadenas suenan similares (como "echo" y "hecho"). Esa similitud debe establecerse para cada idioma (o incluso dialecto) por separado.

Un algoritmo utilizado para realizar una comparación de este tipo para el idioma Inglés se llama Soundex y se inventó, no lo creerás, en 1918. Puedes encontrar más información al respecto aquí: https://en.wikipedia.org/wiki/Soundex.


4. Debido a la precisión limitada de los datos enteros y flotantes nativos, a veces es razonable almacenar y procesar valores numéricos enormes como cadenas. Esta es la técnica que usa Python cuando se le fuerza a operar con un número entero que consta de una gran cantidad de dígitos.