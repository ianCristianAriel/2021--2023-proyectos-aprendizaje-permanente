def funciones(verdura, fruta=1):#Se le pasa un valor por defecto. En caso de que no resiva ningun valor el que tenga por defecto quedara
    print(verdura)
    print(fruta)

funciones('tomate', 'pera')

def funcionIndeterminadoTupla(parametro1, parametro2, *tupla): #Se almacena los argumentos que se pasen extra dentro de una tuplacon el nombre del parametro que le precede un *
    print(parametro1)
    print(parametro2)
    for i in tupla:
        print (i)

tupla=(1,23,1,2)
funcionIndeterminadoTupla('pija', 'cajeta', 1,2,'culo')

def funcionIndeterminadoDiccionario(parametro1, parametro2, **diccionario): #De este modo se reciven los argumentos indeeterminados como clave:valor
    print(parametro1)
    print(parametro2)
    for i in diccionario.items(): #Se utiliza items que lo que hace es pasar cada elemento clave valor del diccionario a una lista
        print(i)

funcionIndeterminadoDiccionario(1,2, ian = 'yané', cristian= 2) #De este modo se pasan los parametros indeterminados

def f (x, y):
    x+=3 #X cambiara su valor dentro de la funcion pero al ser entero es inmutable y no cambiara su valor global
    y.append(34) #y cambiara su valor dentro y fuera de la funcion porque es una lista por lo que es inmutable
    print(x, y)

#x hace su pasaje por valor mientras que y por referencia. Ya que y Es una lista (mutable) y x un entero (inmutable)
y=[23]
x=3
f(x, y)
print(x, y)