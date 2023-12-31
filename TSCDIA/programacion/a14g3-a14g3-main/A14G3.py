from ing2i import ing2i #Encargada de recivir y retornar valor numerico
from ing2s import ing2s #Encargada de recivir y retornar valor string

#1- función suma, retorna la suma de 2 parámetros.
from suma import suma

#2- función resta, retorna la resta de 2 parámetros.
from resta import resta

#3- función producto, retorna el producto de 2 parámetros.
from producto import producto

#4- función cociente, retorna el cociente de 2 parámetros.
from cociente import cociente

#5- función módulo, retorna el módulo de 2 parámetros.
from módulo import módulo

#6- función potencia, retorna la potencia del primero elevado al segundo parámetros.
from potencia import potencia

#7- función radicación, retorna la raiz del primero respecto del segundo parámetros.
from radicación import radicación

#9- función p1, retorna el producto de los 2 primero más el 3er parámetros, usando las funciones anteriores.
from p1_a import p1_a

#10- función p1, retorna la suma de los 2 primero por el 3er parámetros, usando las funciones anteriores.
from p1_b import p1_b

#11- función p1, retorna la resta de los 2 primero por el 3er parámetros, usando las funciones anteriores.
from p1_c import p1_c

#NO USAR NUMPY#
#12- función genrnd que retorna una lista con 50 números aleatorios.
from genrnd import genrnd

#13- función que devuelva la suma de las combinaciones posibles de los números generados por la función genrnd tomados de a dos.
from suma_genrnd import suma_genrnd

#14 / 15- función que devuelva el producto de las combinaciones posibles de los números generados por la función genrnd tomados de a dos.
from producto_genrnd import producto_genrnd

#16- función que calcule la media del vector obtenido en genrnd.
from media_vector import media_vector

#17- función que calcule la mediana del vector obtenido en genrnd.
from mediana_media import mediana_media

#18- función que calcule el rango del vector obtenido en genrnd.
from rango_vector import rango_vector

#19- función que calcule la varianza del vector obtenido en genrnd.
from varianza_vector import varianza_vector

#20- función que calcule devuelva el mínimo del vector obtenido en genrnd.
from minimo_vector import minimo_vector

#21- función que calcule devuelva el máximo del vector obtenido en genrnd.
from maximo_vector import maximo_vector

#22- función genrnd que retorna una lista con 500.000.000.000.000.000 números aleatorios.
from genrnd2 import genrnd2

#23- función que calcule la media del vector obtenido en genrnd.
from media_del_vector import media_del_vector

#24- función que calcule la mediana del vector obtenido en genrnd.
from mediana_del_vector import mediana_del_vector

#25- función que calcule el rango del vector obtenido en genrnd.
from rango_del_vector import rango_del_vector

#26- función que calcule la varianza del vector obtenido en genrnd.
from varianza_del_vector import varianza_del_vector

#27- función que calcule devuelva el mínimo del vector obtenido en genrnd.
from minimo_del_vector import minimo_del_vector

#278- función que calcule devuelva el máximo del vector obtenido en genrnd.
from maximo_del_vector import maximo_del_vector

#29- medir el tiempo de ejecución del 16 al 21 y #30- medir el tiempo de ejecución del 22 al 28
def tiempo_ejecucion():
    #Primer bloque --utilizando genrnd
    comienzo = datetime.today()
    lista = genrnd()
    mediana_media(lista)
    rango_vector(lista)
    varianza_vector(lista)
    minimo_vector(lista)
    maximo_vector(lista)
    fin = datetime.today()
    primer_bloque = fin-comienzo
    
    #Segundo bloque --utilizando genrnd2
    comienzo=datetime.today()
    lista=genrnd2()
    mediana_del_vector(lista)
    rango_del_vector(lista)
    varianza_del_vector(lista)
    minimo_del_vector(lista)
    maximo_del_vector(lista)
    fin = datetime.today()
    segundo_bloque = fin-comienzo
    print(f"Primer bloque: {primer_bloque} \nSegundo bloque: {segundo_bloque} \nDiferencia: {segundo_bloque-primer_bloque}")


