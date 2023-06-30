from io import open

#FASES:
#CREACION
#APERTURA (creacion y apertura pueden darse en la misma fase si el archivo no existe previamente, este se crea y se abre con open)
archivo_texto = open("archivo.txt", "w")
#MANIPULACION
frase = 'Estupendo dia para estudiar python'
archivo_texto.write(frase)
#CIERRE
archivo_texto.close()

#Apertura en modo lectura
archivo_texto= open("archivo.txt", "r")
#Manipulacion
texto = archivo_texto.read()
#Cierre
archivo_texto.close()

print(texto)

#Apertura
archivo_texto = open("archivo.txt", 'r')
#Manipulacion
lineas_texto = archivo_texto.readlines()
#cierre
archivo_texto.close()

print(lineas_texto[0]) #Se puede llama a una linea del texto en particular. En este caso a la primera

#Apertura
archivo_texto = open('archivo.txt', 'a')
#Manipulacion:
texto='\nLinea agregada' #De no agregar "\n" el texto se imprime a continuacion
archivo_texto.write(texto)
#Cierre
archivo_texto.close()



#Manejo de puntero
#Apertura en modo lectura
archivo_texto= open("archivo.txt", "r")
#Manipulacion
print(archivo_texto.read(11)) #Al colocarle un valor el programa lee hasta esa linea


archivo_texto.seek(3) #Posiciona el cursor en el indice indicado entre parentesis
print(archivo_texto.read())
#Cierre
archivo_texto.close()

#Apertura en modo lectura
archivo_texto= open("archivo.txt", "r+") # Con "+" se le agrega a la lectura escritura
#Manipulacion
texto = 'Texto agregado'
texto = archivo_texto.write(texto) 
"""En este caso como no se le indica la posicion del cursor. Se remplazara lo que ubiera en los caracteres que ocupara sobre la primera linea """
#Cierre
archivo_texto.close()

miCalculo = 8/2
print(miCalculo)

import pickle

#SERIALIZACION:
lista = ['1', 'segundo', 'Tercero']

archivo_Serializacion = open('serializacion_Ej.txt', 'wb')

pickle.dump(('Tu cara me suena\n''Tu caripela me suenaaaaa', lista), archivo_Serializacion)     
""" se puede volcar mediante agregado directo a la variable de mediacion con el txt
o mediante otra variable """

archivo_Serializacion.close()


archivo_Serializacion = open('serializacion_Ej.txt', 'rb')

texto=pickle.load(archivo_Serializacion)

print(texto)

archivo_Serializacion.close()


