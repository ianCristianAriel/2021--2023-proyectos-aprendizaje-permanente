#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7

Puntos Clave

1. Una clase es una idea (más o menos abstracta) que se puede utilizar para crear varias encarnaciones; una encarnación de este tipo se denomina objeto.

2. Cuando una clase se deriva de otra clase, su relación se denomina herencia. La clase que deriva de la otra clase se denomina subclase. El segundo lado de esta relación se denomina superclase. Una forma de presentar dicha relación es en un diagrama de herencia, donde:

Las superclases siempre se presentan encima de sus subclases.
Las relaciones entre clases se muestran como flechas dirigidas desde la subclase hacia su superclase.

3. Los objetos están equipados con:

Un nombre que los identifica y nos permite distinguirlos.
Un conjunto de propiedades (el conjunto puede estar vacío).
Un conjunto de métodos (también puede estar vacío).

4. Para definir una clase de Python,se necesita usar la palabra clave reservada class. Por ejemplo:

class This_Is_A_Class:
     pass


5. Para crear un objeto de la clase previamente definida, se necesita usar la clase como si fuera una función. Por ejemplo:

this_is_an_object = This_Is_A_Class()

Puntos Clave

1. Una pila es un objeto diseñado para almacenar datos utilizando el modelo LIFO. La pila normalmente realiza al menos dos operaciones, llamadas push() y pop().


2. La implementación de la pila en un modelo procedimental plantea varios problemas que pueden resolverse con las técnicas ofrecidas por la POO (Programación Orientada a Objetos).


3. Un método de clase es en realidad una función declarada dentro de la clase y capaz de acceder a todos los componentes de la clase.


4. La parte de la clase en Python responsable de crear nuevos objetos se llama constructor y se implementa como un método de nombre __init__.


5. Cada declaración de método de clase debe contener al menos un parámetro (siempre el primero) generalmente denominado self, y es utilizado por los objetos para identificarse a sí mismos.


6. Si queremos ocultar alguno de los componentes de una clase del mundo exterior, debemos comenzar su nombre con __. Estos componentes se denominan privados

Puntos Clave

1. Una variable de instancia es una propiedad cuya existencia depende de la creación de un objeto. Cada objeto puede tener un conjunto diferente de variables de instancia.

Además, se pueden agregar y quitar libremente de los objetos durante su vida útil. Todas las variables de instancia de objeto se almacenan dentro de un diccionario dedicado llamado __dict__, contenido en cada objeto por separado.


2. Una variable de instancia puede ser privada cuando su nombre comienza con __, pero no olvides que dicha propiedad aún es accesible desde fuera de la clase usando un nombre modificado construido como < codel>_ClassName__PrivatePropertyName.


3. Una variable de clase es una propiedad que existe exactamente en una copia y no necesita ningún objeto creado para ser accesible. Estas variables no se muestran como contenido de __dict__.

Todas las variables de clase de una clase se almacenan dentro de un diccionario dedicado llamado __dict__, contenido en cada clase por separado.


4. Una función llamada hasattr() se puede utilizar para determinar si algún objeto o clase contiene cierta propiedad especificada.

Por ejemplo:

class Sample:
    gamma = 0 # Class variable.
    def __init__(self):
        self.alpha = 1 # Variable de instancia.
        self.__delta = 3 # Variable de instancia privada.


obj = Sample()
obj.beta = 2  # Otra variable de instancia (que existe solo dentro de la instancia "obj").
print(obj.__dict__)


El código da como salida:

{'alpha': 1, '_Sample__delta': 3, 'beta': 2}

##Metodos
1. Un método es una función dentro de una clase. El primer (o único) parámetro de cada método se suele llamar self, que está diseñado para identificar al objeto para el que se invoca el método con el fin de acceder a las propiedades del objeto o invocar sus métodos.


2. Si una clase contiene un constructor (un método llamado __init__), este no puede devolver ningún valor y no se puede invocar directamente.


3. Todas las clases (pero no los objetos) contienen una propiedad llamada __name__, que almacena el nombre de la clase. Además, una propiedad llamada __module__ almacena el nombre del módulo en el que se ha declarado la clase, mientras que la propiedad llamada __bases__ es una tupla que contiene las superclases de una clase.

Por ejemplo:

class Sample:
    def __init__(self):
        self.name = Sample.__name__
    def myself(self):
        print("Mi nombre es " + self.name + " y vivo en " + Sample.__module__)


obj = Sample()
obj.myself()


El código da como salida:

Mi nombre es Sample y vivo en __main__

1. Un método llamado __str__() es responsable de convertir el contenido de un objeto en una cadena (más o menos) legible. Puedes redefinirlo si deseas que tu objeto pueda presentarse de una forma más elegante. Por ejemplo:

class Mouse:
    def __init__(self, name):
        self.my_name = name


    def __str__(self):
        return self.my_name


the_mouse = Mouse('mickey')
print(the_mouse)  # Imprime "mickey". 


2. Una función llamada issubclass(Class_1, Class_2) es capaz de determinar si Class_1 es una subclase de Class_2. Por ejemplo:

class Mouse:
    pass


class LabMouse(Mouse):
    pass


print(issubclass(Mouse, LabMouse), issubclass(LabMouse, Mouse))  # Imprime "False True"


3. Una función llamada isinstance(Object, Class) comprueba si un objeto proviene de una clase indicada. Por ejemplo:

class Mouse:
    pass


class LabMouse(Mouse):
    pass


mickey = Mouse()
print(isinstance(mickey, Mouse), isinstance(mickey, LabMouse))  # Imprime "True False".


4. Un operador llamado is comprueba si dos variables hacen referencia al mismo objeto. Por ejemplo:

class Mouse:
    pass


mickey = Mouse()
minnie = Mouse()
cloned_mickey = mickey
print(mickey is minnie, mickey is cloned_mickey)  # Imprime "False True".



5. Una función sin parámetros llamada super() retorna la referencia a la superclase más cercana de la clase. Por ejemplo:

class Mouse:
    def __str__(self):
        return "Mouse"


class LabMouse(Mouse):
    def __str__(self):
        return "Laboratory " + super().__str__()


doctor_mouse = LabMouse();
print(doctor_mouse)  # Imprime "Laboratory Mouse".


6. Los métodos, así como las variables de instancia y de clase definidas en una superclase son heredados automáticamente por sus subclases. Por ejemplo:

class Mouse:
    Population = 0
    def __init__(self, name):
        Mouse.Population += 1
        self.name = name

    def __str__(self):
        return "Hola, mi nombre es " + self.name

class LabMouse(Mouse):
    pass

professor_mouse = LabMouse("Profesor Mouse")
print(professor_mouse, Mouse.Population)  # Imprime "Hola, mi nombre es Profesor Mouse 1"


7. Para encontrar cualquier propiedad de objeto/clase, Python la busca dentro:

Del objeto mismo.
Todas las clases involucradas en la línea de herencia del objeto de abajo hacia arriba.
Si existe más de una clase en una ruta de herencia en particular, Python las escanea de izquierda a derecha.
Si lo mencionado anteriormente falla, la excepción AttributeError es generada.

8. Si alguna de las subclases define un método, variable de clase o variable de instancia del mismo nombre que existe en la superclase, el nuevo nombre anula cualquiera de las instancias anteriores del nombre. Por ejemplo:

class Mouse:
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return "Mi nombre es " + self.name

class AncientMouse(Mouse):
    def __str__(self):
        return "Meum nomen est " + self.name

mus = AncientMouse("Caesar")  # Imprime "Meum nomen est Caesar"
print(mus)

1. El bloque else: de la sentencia try se ejecuta cuando no ha habido ninguna excepción durante la ejecución del try:.


2. El bloque finally: de la sentencia try es siempre executado.


3. La sintaxis except Exception_Name as exception_object: te permite interceptar un objeto que contiene información sobre una excepción pendiente. La propiedad del objeto llamada args (una tupla) almacena todos los argumentos pasados al constructor del objeto.


4. Las clases de excepciones pueden extenderse para enriquecerlas con nuevas capacidades o para adoptar sus características a excepciones recién definidas.

Por ejemplo:

try:
    assert __name__ == "__main__"
except:
    print("fallido", end=' ')
else:
    print("éxito", end=' ')
finally:
    print("terminado")


El código da como salida: éxito terminado