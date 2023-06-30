#Estas operaciones equivalen a las operaciones que se pueden realizar en sql, con joins para diferenciar tablas
set_a = {'col', 'mex', 'bol'}
set_b = {'pe', 'bol'}

#EPor medio de .union o | se obtienen los elementos de los dos conjuntos (si hay un elemento que se repite en los dos conjuntos solo se mostrara una vez)
set_c = set_a.union(set_b)
print(set_c)
print(set_a | set_b)

#Por medio de .intersection o &, se mostrara aquellos elementos que esten an ambos conjuntos
set_c = set_a.intersection(set_b)
print(set_c)
print(set_a & set_b)

#SPor medio de .difference o - , se mostraran aquellos elementos del primer conjunto que no estan en el segundo conjunto
set_c = set_a.difference(set_b)
print(set_c)
print(set_a - set_b)

#Por medio de .symmetric_difference o ^, se mostraran los elementos que no se repiten en ambos conjuntos, es decir aquellos que son unicos en cada uno
set_c = set_a.symmetric_difference(set_b)
print(set_c)
print(set_a ^ set_b)