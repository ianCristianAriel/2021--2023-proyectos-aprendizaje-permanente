from coche import *
from cuenta import *
from pago import *
from valoracion import *

if __name__ == "__main__":
    coche_1 = coche('12312s', cuenta('Ian', 42906680))
    coche_1.identificacio, coche_1.pasajero = '313123', cuenta('ian', 42906680)
    usuario_1 = cuenta('ian', 42906680)
    conductor_1 = cuenta('Cristian', 42906680)
    conductor_1.email = 'ian.00@hotmail.com'
    conductor_1.password = '42906680'
    pago_1 = pago()
    pago_1.id = 1
    valoracio_1 = valoracion(cuenta('ian', 42906680), 9)