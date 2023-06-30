class cuenta:
    id = int
    nombre = str
    dni = int
    email = str
    password = str
    
    def __init__(self, nombre, dni):
        self.nombre = nombre
        self.dni = dni
        

