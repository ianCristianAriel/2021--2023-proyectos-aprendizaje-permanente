import math
from platform import platform
from platform import machine
from platform import system
from math import pi, radians, degrees, sin, cos, tan, asin
from math import pi as numero_pi #Con as se agrega un alias al modulo
from platform import processor
from platform import version
from random import choice, sample
from random import randrange, randint #Modulo para numeros aleatorios
from platform import python_implementation, python_version_tuple
import paquete
from paquete.borrador import fun
import sys

for p in sys.path:#Muestra el directorio en el que se encuentra
    print(p)

path.append('C:\\Users\\Ian\\Desktop')#Ocupa la ultima posicion de la ruta 
path.insert('C:\\Users\\Ian\\Desktop')#Ocupa la ultima posicion de la lista


print(python_implementation())

for atr in python_version_tuple():
    print(atr)


print(round(numero_pi,2))
print(dir(math))

""" sinh()# → el seno hiperbólico.
cosh(x)# → el coseno hiperbólico.
tanh(x)# → la tangente hiperbólico.
asinh(x)# → el arcoseno hiperbólico.
acosh(x)# → el arcocoseno hiperbólico.
atanh(x)# → el arcotangente hiperbólico.
#e  #→ una constante con un valor que es una aproximación del número de Euler (e).
exp(x)# → encontrar el valor de ex.
log(x)# → el logaritmo natural de x.
log(x, b)# → el logaritmo de x con base b.
log10(x)# → el logaritmo decimal de x (más preciso que log(x, 10)).
log2(x)# → el logaritmo binario de x (más preciso que log(x, 2))
ceil(x)# → devuelve el entero más pequeño mayor o igual que x.
floor(x)# → el entero más grande menor o igual que x.
trunc(x)# → el valor de x truncado a un entero (ten cuidado, no es equivalente a ceil o floor).
factorial(x)# → devuelve x! (x tiene que ser un valor entero y no negativo).
hypot(x, y)# → devuelve la longitud de la hipotenusa de un triángulo rectángulo con las longitudes de los catetos iguales a (x) y (y) (lo mismo que sqrt(pow(x, 2) + pow(y, 2)) pero más preciso).
 """

inicio= 0
fin= 10
incremento = 3
print(randrange(inicio, fin), randrange(inicio, fin, incremento), randint(inicio, fin))


my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print(choice(my_list))
print(sample(my_list, 5))
print(sample(my_list, 10))
print(platform(), 'platform')
print(platform(1))
print(platform(0, 1))
print(machine())
print(processor())
print(system())
print(version(), 'Version')