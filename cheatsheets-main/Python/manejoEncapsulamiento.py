#Encapsular: Es bloquear la modificacion de una caracteristica (argumento) dejandolo solo con el valor que se pasa entre parentesis
class pc:
    def __init__(self, formato, cpu, almacenamiento, marca): #Se imprime en primer lugar
        self.__formato= formato #Encapsulada
        self.__cpu= cpu #Encapsulada
        self.almacenamiento= almacenamiento
        self.marca= marca
        print(f'Se creo pc marca: {self.marca}')
    
    def __str__(self): #Se imprime en segundo lugar
        return 'Formato: {}, CPU: {}, Almacenamiento: {}'.format(self, self.__cpu, self.almacenamiento)

PC1=pc('Escritorio', 'Raizen 5', 400, 'HP')
PC1.Formato = 'portatil'
PC2=pc('Portatil', 'Intel Pentium', '480 gb ADATA', 'Philco')
PC2.almacenamiento = 'Chotito'

#Metodo str
print(str(PC1))
print()
print(PC2)

#Metodo del:
del(PC2)