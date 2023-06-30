# Par que reduce funcione hay que importar el modulo functools
import functools

numero1 = [1, 2, 3, 10]
numero2 = [1, 2, 3, 4]

#Lo que hace es comenzar en i=1 y irlo aumentando en cada iteracion
#Los los valores del elemento actual se sumaran junto con el de "i", y se almacenan en "c"
resultado = functools.reduce(lambda c, i: c + i, numero1 )
print(resultado)

#Otra forma mas sensilla
resultado = sum(numero1)
print(resultado)

#Reduce en divicion de elementos
#Dividira c por el numero de iteracion, y esto lo acumulara en c, asi susesivamente
resultado = functools.reduce(lambda c, i: c / i, numero1 )
print(resultado)