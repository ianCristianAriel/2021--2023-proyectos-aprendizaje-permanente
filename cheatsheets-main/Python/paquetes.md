#Fuente: https://lms.netacad.com/course/view.php?id=1281732 #FUNDAMENTOS DE LA PROGRAMACIÒN EN PYTHON - ALUMNOS ISPC - COHORTE 7


Puntos Claves

1. Si deseas importar un módulo como un todo, puedes hacerlo usando la sentencia import nombre_del_módulo. Puedes importar más de un módulo a la vez utilizando una lista separada por comas. Por ejemplo:

import mod1
import mod2, mod3, mod4


Aunque la última forma no se recomienda por razones estilísticas, y es mejor y más bonito expresar la misma intención de una forma más detallada y explícita, como por ejemplo:

import mod2
import mod3
import mod4


2. Si un módulo se importa de la manera anterior y desea acceder a cualquiera de sus entidades, debes anteponer el nombre de la entidad empleando la notación con punto. Por ejemplo:

import my_module

result = my_module.my_function(my_module.my_data)


El fragmento de código utiliza dos entidades que provienen del módulo my_module: una función llamada my_function() y una variable con el nombre my_data. Ambos nombres deben tener el prefijo my_module. Ninguno de los nombres de entidad importados entra en conflicto con los nombres idénticos existentes en el namespace de tu código.


3. Se te permite no solo importar un módulo como un todo, sino también importar solo entidades individuales de él. En este caso, las entidades importadas no deben especificar el prefijo cuando son empleadas. Por ejemplo:

from module import my_function, my_data

result = my_function(my_data)


La forma anterior, a pesar de su atractivo, no se recomienda debido al peligro de causar conflictos con los nombres derivados de la importación del namespace del código.


4. La forma más general de la sentencia anterior te permite importar todas las entidades ofrecidas por un módulo:

from my_module import *

result = my_function(my_data)


Nota: la variante de esta importación no se recomienda debido a las mismas razones que antes (la amenaza de un conflicto de nombres es aún más peligrosa aquí).

5. Puede cambiar el nombre de la entidad importada "sobre la marcha" utilizando la frase as del import. Por ejemplo:

from module import my_function as fun, my_data as dat

result = fun(dat)

1. Una función llamada dir() puede mostrarte una lista de las entidades contenidas dentro de un módulo importado. Por ejemplo:

import os
dir(os)


Imprime una lista de todo el contenido del módulo os el cual, puedes usar en tu código.


2. El módulo math contiene más de 50 funciones y constantes que realizan operaciones matemáticas (como sine(), pow(), factorial()) o aportando valores importantes (como π y la constante de Euler e).


3. El módulo random agrupa más de 60 entidades diseñadas para ayudarte a usar números pseudoaleatorios. No olvides el prefijo "pseudo", ya que no existe un número aleatorio real cuando se trata de generarlos utilizando los algoritmos de la computadora.


4. El módulo platform contiene alrededor de 70 funciones que te permiten sumergirte en las capas subyacentes del sistema operativo y el hardware. Usarlos te permite aprender más sobre el entorno en el que se ejecuta tu código.


5. El Índice de Módulos de Python (https://docs.python.org/3/py-modindex.html es un directorio de módulos impulsado por la comunidad disponible en el universo de Python. Si deseas encontrar un módulo que se adapte a tus necesidades, comienza tu búsqueda allí.

6. Mientras que un módulo está diseñado para acoplar algunas entidades relacionadas como funciones, variables o constantes, un paquete es un contenedor que permite el acoplamiento de varios módulos relacionados bajo un mismo nombre. Dicho contenedor se puede distribuir tal cual (como un lote de archivos implementados en un subárbol de directorio) o se puede empaquetar dentro de un archivo zip.


7. Durante la primera importación del módulo, Python traduce su código fuente a un formato semi-compilado almacenado dentro de los archivos pyc y los implementa en el directorio __pycache__ ubicado en el directorio de inicio del módulo.


8. Si deseas decirle al usuario del módulo que una entidad en particular debe tratarse como privada (es decir, no debe usarse explícitamente fuera del módulo), puedes marcar su nombre con el prefijo _ o __. No olvides que esto es solo una recomendación, no una orden.


9. Los nombres shabang, shebang, hasbang, poundbang y hashpling describen el dígrafo escrito como #!, se utiliza para instruir a los sistemas operativos similares a Unix sobre cómo se debe iniciar el archivo fuente de Python. Esta convención no tiene efecto en MS Windows.


10. Si deseas convencer a Python de que debe tomar en cuenta el directorio de un paquete no estándar, su nombre debe insertarse/agregarse en/a la lista de directorios de importación almacenada en la variable path contenida en el módulo sys.


11. Un archivo de Python llamado __init__.py se ejecuta implícitamente cuando un paquete que lo contiene está sujeto a importación y se utiliza para inicializar un paquete y/o sus subpaquetes (si los hay). El archivo puede estar vacío, pero no debe faltar.