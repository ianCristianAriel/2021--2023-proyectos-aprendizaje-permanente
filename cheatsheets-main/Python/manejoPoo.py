class coche:
    def __init__(self, gasolina):
        self.combustible= gasolina
    
    def arrancar(self): #en el metodo solo se coloca self, sin necesidad de agregar el segundo argumento
        if self.combustible>0: #Se utiliza el nombre que se cambia en, es decir: no se utiliza self.gasolina, se utiliza >> Self.combustible, 
            print('arrancado')
            self.combustible-=1
    
    def conducir(self):
        print('quedan '+str(self.combustible)+' litros')

auto=coche(10)

for i in range (6):
    auto.arrancar()
auto.conducir()

#ejemplos de herencia simple:
class Instrumento:
    def __init__(self, precio):
        self.precio=precio
    def tocar(self): #Es fundamental colocar el self a los metodos de una clase
        print('tocando musica')
    

class guitarra(Instrumento): #En este caso solo se utiliza los metodos y constructores de la calse padre instrumento
    def romper(self):
        print('Te la parto por la cabeza')
    pass

miGuitarra=guitarra("$2000")
miGuitarra.tocar()
miGuitarra.romper()
class bateria(Instrumento):
    def __init__(self, precio, golpear): #Agregando un nuevo atributo (se suma un atributo a lo que se ereda de la clase padre)
        self.golpear=golpear
        pass

    def golpeDeBateria(self):
        if self.golpear:
            print('golpea bateria')
        else:
            print('no golpea bateria')

miBateria=bateria(200, False)
miBateria.golpeDeBateria()


#Ejemplo herencia multiple
class herenciaMultiple(guitarra, bateria):
    pass

visnieto=herenciaMultiple(200, True) #Se pasa el argumento de la class padre y los argumentos de las clases hijas
visnieto.golpeDeBateria()
visnieto.romper()

#Metodos privados

class metodosTipos:
    def __privado(self):
        print('Metodo Privado')
        print("\tEste es privado")
        print('\tsolo se accede desde tipos de metodos')
    def publico(self):
        print('Metodo publico')
        print('\tEste es publico')
    def tiposDeMetodos(self):
        self.__privado()#Para llamar a un metodo dentro dela misma clase se deve utilizar nomenclatura. "self." seguido del nombre del metodo
        self.publico()

muestra= metodosTipos()
muestra.tiposDeMetodos()

#hilando filo en los metodos de las clases
class experimentando:

    def __init__(self, creado):
        self.creado=creado
        if self.creado:
            print('Se creo')
    def __del__(self):
        pass

    def imprimeMensaje(self, mensaje):
        self.mensaje=mensaje
        print('Mensaje: ', self.mensaje)

experimento=experimentando(True)

experimento.imprimeMensaje('Estoy vivo')
del(experimento) #Los metodos especiales como del se utilizan antes del parentesis donde va el objeto
try:
    experimento.imprimeMensaje('Estoy vivo')
except:
    print('se muriooooo!')