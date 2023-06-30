from cuenta import cuenta

class coche:
    identificacion = int
    licencia = str
    conductor = cuenta("","")
    pasajero = cuenta("","")

    def __init__(self, licencia, conductor):
        self.licencia = licencia
        self.conductor = conductor

