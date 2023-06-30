import doctest
import math
def suma(num1, num2):
    """ Se le pasan dos numeros y hace una sumatoria entre ellos """
    return num1+num2

def resta(num1,num2,num3):
    """ 
    Se le pasan tres numeros por parametros y realiza una resta
    >>> resta(3,4,6)
    -7

    >>> resta(2.0,3,1)
    -2.0
    """
    return num1-num2-num3

#Mediante doctest se ejecuta una prueba de la funcion a la que se le pasaron los tres signos de mayor
#Se puede realizar un solo chequeo o varios
doctest.testmod()

##############################################################################################################################

def raizCuadrada(listaNumeros):
    """ 
    la funcion devuelve una lista de valores resultados de la raiz de otros valores pasados por parametro
    >>> lista=[]
    >>> for i in [4, 16, 64]:
    ...     lista.append(i)
    >>> raizCuadrada(lista)
    [2.0, 4.0, 8.0]
    """
    return [math.sqrt(n) for n in listaNumeros]

""" Los tres puntos indicados cuando se agrega el numero a la lista mediante la var i, son para indicar que esa linea pertence a la anterior. 
En este caso por el bucle for """

print(raizCuadrada([2, 3, 4, 5]))

doctest.testmod()