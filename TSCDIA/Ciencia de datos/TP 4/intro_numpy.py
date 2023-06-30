#Import numpy
import numpy as np

#Creo el primer arreglo (vector)
arreglo1 = np.array([1,2,3,4])

#Creo una lista de python
lista = ['e',2,3,4]
#Utilio la lista para crear un segundo vector
arreglo_lista = np.array(lista)

#Creo una matriz
arreglo_matriz = np.array([arreglo1, arreglo_lista])


#Ejercicio: Crear una matriz de 3 filas y 5 columnas,
#completados con los numeros del 1 al 15.
#Metodo 2
array_2 = np.arange(1, 15)
array_2.reshape(3,5)