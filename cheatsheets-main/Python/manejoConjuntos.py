#PARTICULARIDADES
#Coleccion no ordenada. No se pueden repetir los elementos
#No se pueden definir listas ni ningun otro tipo de coleccion dentro
conjunto= set()#Asi se inicializa la creacion de conjuntos
conjunto = {'Ian', 'Fabi', 'Mario', 'Jenifer', True, 1.0, 2}

#Se aniade un elemento al conjunto
conjunto.add(3)

#Se quita un determinado elemento del conjunto
conjunto.discard('Mario')

print(conjunto)
#Se utiliza "not in" para consultar por la falsedad
print('Marcos' not in conjunto)

#Sequitan todos los elementos del conjunto
conjunto.clear()
print(conjunto)