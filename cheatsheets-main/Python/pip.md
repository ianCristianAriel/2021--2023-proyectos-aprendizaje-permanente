Puntos Claves

1. Un repositorio (o repo para abreviar) diseñado para recopilar y compartir código Python gratuito lleva por nombre Python Package Index (PyPI) aunque también es probable que te encuentres con el nombre de The Cheese Shop (La Tienda de Queso). Su sitio web está disponible en https://pypi.org/.


2. Para hacer uso de The Cheese Shop, se ha creado una herramienta especializada y su nombre es pip (pip instala paquetes mientras que pip significa ... ok, no importa). Como es posible que pip no se implemente como parte de la instalación estándar de Python, es posible que debas instalarlo manualmente. Pip es una herramienta de consola.


3. Para verificar la versión de pip, se deben emitir los siguientes comandos:

pip --version


o

pip3 --version


Comprueba tu mismo cuál de estos funciona en el entorno de tu sistema operativo.


4. La lista de las actividades principales de pip tiene el siguiente aspecto:

pip help operación_o_comando â muestra una breve descripción de pip.
pip list â muestra una lista de los paquetes instalados actualmente.
pip show nombre_del_paquete â muestra información que incluyen las dependencias del paquete.
pip search cadena â busca en los directorios de PyPI para encontrar paquetes cuyos nombres contengan cadena.
pip install nombre â instala el paquete nombre en todo el sistema (espera problemas cuando no tengas privilegios de administrador).
pip install --user nombre â instala nombre solo para ti; ningún otro usuario de la plataforma podrá utilizarlo.
pip install -U nombre â actualiza un paquete previamente instalado.
pip uninstall nombre â desinstala un paquete previamente instalado.