class pc:
    def __init__(self, formato, cpu, almacenamiento, marca): #Se imprime en primer lugar
        self.formato= formato
        self.cpu= cpu
        self.almacenamiento= almacenamiento
        self.marca= marca
        print(f'Se creo pc marca: {self.marca}')
    
    def __del__(self): #Se imprime en tercer lugar
        print(f'Se vendio pc marca: {self.marca}')
    
    def __str__(self): #Se imprime en segundo lugar
        return 'PC. Formato: {}, CPU: {}, Almacenamiento: {}'.format(self.formato, self.cpu, self.almacenamiento)

PC1=pc('Escritorio', 'Raizen 5', 400, 'HP')
PC2=pc('Portatil', 'Intel Pentium', '480 gb ADATA', 'Philco')
#Metodo str
print(str(PC1))

print()

#Metodo del:
del(PC2)