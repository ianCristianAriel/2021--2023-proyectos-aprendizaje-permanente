# Se utilizara map junto con lambda para reducir las lineas de codigo al momento de aplicar una funcion a los elementos de una  lista
numbers = [1, 2, 3, 4]
numbers_2 = []
# Metodo tradicional
for i in numbers:
    i *= 3
    numbers_2.append(i)

# Map de por si es un iterador, por tal motivo aplicara la funcion a cada uno de los elementos de la lista pasada al final (en este caso "numbers")
numbers_2 = list(map(lambda i: i*3, numbers))

#En este caso se buscara que se sumen las dos listas
numeros_1 = [1,2,3,4,5]
numeros_2 = [1,2,3,4]

#Por medio tradicional
resultado = []
i=0
for n in numeros_1:
    i+=1
    try:
        resultado.append(numeros_2[i] + n)
    except:
        break
print(resultado)

#Forma con map
#Primero se les da el nombre a los parametros de la funcion, luego se realiza la operacion de la funcion entre los parametros y, por ultimo se espesifica
#los argumentos que se envian
resultado = list(map(lambda argumento1, argumento2: argumento1 + argumento2, numeros_1, numeros_2))