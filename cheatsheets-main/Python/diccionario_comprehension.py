import random
#Se describe formas de expresar la creacion de un diccionario en una sola linea mediante un bucle for

#SITUACION 1
#Forma tradicional
dic_i = {}
for i in range(5):
    dic_i[i] = i*2

#Forma por comprehension
#diccionario = {clave en cada iteracion: clave en cada iteracion * 2 (opcional, equivale a x operacion) in range}
dic_i_c = {i: i*2 for i in range(5)}

#SITUACION 2
ciudades = ['Argentina', 'Colombia', 'Paris']
#Forma tradicional
poblacion = {}
for c in ciudades:
    poblacion[c] = random.randint(1,100)

#Forma por comprehension
#diccionario = {clave en cada iteracion: valor a cargar en la clave en cada iteracion for clave en cada iteracion in lista con elementos}
poblacion_c = {c: random.randint(1,40098765) for c in ciudades}

#OPCION AGREGANDO CONDICIONAL "IF"
#Aca se exluye la opcion de un else, como si es posible en la forma extendida del bucle
poblacion_c_c = {c: random.randint(1,1000) for c in ciudades if (c != 'Argentina')}
