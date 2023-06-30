def sumar(x, y):
    return x + y
l = [1, 2, 3]
#l2 = reduce(sumar, l)

l2 = (n ** 2 for n in l) #Recorre la lista y almacena los nuevos valores en otra lista
print(list(l2)) 