diccionario={'ian':'Iancho',
'Juan':'Iancho',
'imagine dragons': 'wherever i takes'}
diccionario['imagine dragons']='Warriors'
#Agregar elementos
diccionario['Juancio']='Pepe el grillo'

print(diccionario)

#MEtodos especiales
print(diccionario.get('pi')) #".get" Busca dentro del diccionario la clave, en este caso "pi", devuelve el valor si la encuentra o por el contario "none"

print('k' in diccionario) #Comprueba que se encuentre un valor dentro del diccionario. Devuelve true o false

print(diccionario.items()) #Devuelve una lista de tuplas conformadas por cada clae y valor

print(diccionario.keys())#Devuelve una lista con las claves del diccionario

print(diccionario.pop('Juan')) #Elimina una clave del diccionario y devuelve su valor

print(diccionario.values())#Devuelve los valores del diccionario