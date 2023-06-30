import re

print('Aqui va el lavel:\n \tAqui va la tabulacion')#" \t ", sirve para tabular el texto

caracterRaw= r'hola\n mundo'

caracterUnicode= u"äóè" 

saltoLineasTextoConMuchos="""Hola
linea nueva
otra linea""" #Las triples dobles comillas sirven para que los saltos de linea se impriman por solo precionar enter. Sin necesidad de \n

print(saltoLineasTextoConMuchos)

print(caracterRaw)

print(caracterUnicode)

texto='klfjl- kdsafljkhjldsfhjdaslhfja- iansdkjfkldsjfl'
print(texto.count('ian')) #Devuelve el numero de veces que se repite unna subcadena dentro de otra cadena mayor
print(texto.find('ian'))#Devuelve la primera posicion en la que se encuentra la subcadena, en su defecto devuelve "-1"
print(texto.join('adkajskdjaksdjask'))
print(texto.partition('-')) #Devuelve una tupla hasta el separador, otra tupla con separador y una utltima con elteto resatante, aunque el separador aparezca nuevamente
print(texto.replace('ian', 'ianchu')) #Remplaza una subcadena por otra subcadena
print(texto.split('-')) #Devuelve lista contenida por subcadenas que se separaban por el separador pasado

##############################################################################################################
#Imprimir  texto en la misma linea dentro de un bucle
for i in range(3):
    print(i, end=' ') 
""" Por defecto se agrega un fin de linea en end, para cambiarlo se le puede reasignar comillas y si 
se quiere un separador, hay que agrearlo dentro """

##############################################################################################################

if re.match('python', 'python'): #Comprueba que la cadenas son iguales
    print('Es igual')
else:
    print('no es igual')

if re.match('.ython', 'python'):#Ignorando si coincide el primer caracter (se utiliza punto), comprueba que el resto de caracteres coinciden
    print('si')

if re.match('.../.', 'abc.'): #Comprueva que el string es una cadena de la cantidad de puntos antes de la barra y que termina en un "."
    print('Tres caracteres seguidos de un punto')

if re.match("python|jython|cython", 'python'): #Comprueba si uno de los strings coincide
    print('Una de las tres coincide')

if re.match('[pjc]ython', 'python'):#comprueba que los caracteres encerrados entre corchees estan dentro de la segunda cadena
    print('uno de los tres caracteres coincide')

if re.match('python[0-9]', 'python0'): #En este caso, se agrega la comprobacion de un caracter dentro de un rango
    print('Se encontro dentro de los caracteres')

if re.match('python[0-9a-zA-Z]', 'pythonp'):#Busca dentro de tres rangos, ubicados uno al lado del otro denro de corchetes
    print('Sencontro dentro de los tres posibles rangos pasdados')

if re.match('python[^0-9a-z]', 'pythonA'):#Comprueba que el ultimo caracter este fuera de determinados rangos
    print('El caracter fatante efectivamente estava fuera de los rangos negados')



""" 
En lugar de "re.match" se puede utilizar: 
"re.IGNORECASE" que no diferencia mayuscula de minuscula
"re.VERBOSE: que ignora los espacios en cayo de que los halla

equivalencias rapidas:
^: indica que un determinado elemento va al principio de una cadena
$: indica que un elemento va al final de una cadena
Espesificas:
"d”• : un dígito. Equivale a [0-9]
“\D”• : cualquier carácter que no sea un dígito. Equivale a [^0-9]
“\w”• : cualquier caracter alfanumérico. Equivale a [a-zA-Z0-9_]
“\W”• : cualquier carácter no alfanumérico. Equivale a [^a-zA-Z0-9_]
“\s”• : cualquier carácter en blanco. Equivale a [ \t\n\r\f\v]
“\S”• : cualquier carácter que no sea un espacio en blanco. Equivale a [^ \t\n\r\f\v] 

Generales:
+: indica que lo que tenemos a la izquierda, sea un carácter como ‘a’, una clase como ‘[abc]’ o un subpatrón como (abc)
*: es similar a +, pero en este caso lo que se sitúa a su izquierda puede encontrarse cero o mas veces.
?: indica opcionalidad, es decir, lo que tenemos a la izquierda puede o no aparecer (puede aparecer 0 o 1 veces).

"""
#############################################################################################################

