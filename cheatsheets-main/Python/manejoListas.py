#-------------------------------------Manejo de listas
#remplazar elementos de una  lista
lista=[1, 2 ,3 ,[4]]

print(lista)

lista[1]='Remplazo'

print(lista)

#Imprime rangos de la lista. Sin incluir el indice despues de los dos puntos
print(lista[1:3])

print(lista[1:]) #Imprime desde un indice en particular

print(lista[:2])#Imprime hasta un indice en particular

print(lista[0:4:3]) #Imprime un rango de la lista en el cual el tercer valor que se pasa luego de los dos puntos corresponde a los saltos que da para mostrar

print(lista[::2]) #Imprime la lista cada dos

#Tambien se puede modifica rla lista:
lista2=[1,2,3,1,'asdasd',121,2]
lista2[0:2]='remplazo','remplazo'
print(lista2)
lista2[::1]=['cada2']
print(lista2)
lista2.append('2')
print(lista2)

#MEtodos especiales de las listas
lista=[]
print(lista.append('l')) #agrega un elemento a la lista
print(lista.count('i')) #Cuenta la cantidad de veces que se encuentra en la lista el subelemento

print(lista.extend(lista2))

print(lista.index('2')) #Devueleve el indice de la primera posicion en la que se encontro el parametro pasado como indice, en su defecto da error

lista.insert(len(lista), 'pijita') #Inserta un elemento desntro de una lista en el indice que se le espesifique

print(lista)

print(lista.pop(0))#Elimina el objeto del indice que se le pasa y lo devuelve

print(lista)

lista.remove('pijita') #Remueve la primera vez que aparece el valor que se le pasa

lista.reverse() #Invierte el orden de la lista

lista.sort() #Ordena la lista por tipos de datos

print(lista)

import re
""" Buscar elementos dentro de una lista mediante el modulo "re"""
lista='coche de plastico, chancho loco nemo'
print(re.search("nemo", lista)) #El string a buscardeve ser solo texto, no puede estar dentro de una lista al menos que se use un for o similar por ejemplo
nemo=re.search('nemo', lista)
if nemo:
    print('Se encontro a nemo')

print((re.search('plastico', lista).start()))
print((re.search('plastico', lista).end()))
print(re.findall('coche', lista))

for j in lista_Dominios:
    if re.findall('^ftp', j): #Al colocarle el simbolo "^" seleccionara aquellos que comienzen con el string entre comilas
        print(j)

for j in lista_Dominios:
    if re.findall('ar$', j): #Al agregarle el simbolo de "$" seleccionara aquellos que terminen con ese string entre comillas
        print(j)

nombres=['lautari', 'nioño', 'fuerte', 'niño', 'niña']

#Se pueden eliminar elementos mediante del
del nombres[0]

for j in nombres:
    if re.findall('[ñ]', j): #Seleccionara aquellas cadenas de texto que incluyan la letr entre parentesis
        print(j)

for j in nombres:
    if re.findall('niñ[oa]s', j): #Colocar la o y la a entre corchetes permite que en este caso se seleccionen niños y niñas
        print(j)

listaNombres=['JUan', 'Pepe', 'Tania']
for j in listaNombres:
    if re.findall('^[A-J]', j): #En este caso se colocan el rango de letras en el que se deve seleccionar las palabras que comienzen
        print(j)

nombre1='tito corto'
nombre2='pepe'
nombre3='Juan gonzales perez dias marcos afroamericano'

if re.match('tito', nombre1): #Busca una cadena de texto dentro de otrancadena mayor
    print('Encontramos a tito')

if re.match('.ep', nombre2): #Busca la cadena de texto lugo del punto en otra cadena mayor
    print('Encontramos a pepe')

cadena1='1221212123'
cadena2='dsdsf23322323'
cadena3='asdasdasdasd'

if re.match('\d', cadena1): #Match comienza buscando desde el comienzo. "\d" busca cadenas con numeros (La barra deve ser siempre invertida)
    print('Lo hemos encontrado tio!')

if re.search('\d', cadena2): #"search" busca en toda la cadena
    print('Lo hemos encontrado tio!')



