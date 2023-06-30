from cuenta import cuenta

class valoracion:
    usuario = cuenta("","")
    valoracion_numerica = int
    
    def __init__(self, usuario, valoracion_numerica):
        self.usuario = usuario
        self.valoracion_numerica = valoracion_numerica

