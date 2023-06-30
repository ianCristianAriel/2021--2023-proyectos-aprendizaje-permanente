
import os
import pyhere
import pathlib
import fs
import pyprojroot

CURRENT_DIR = os.getcwd()  # Ruta actual de trabajo
DATA_DIR = os.path.join(CURRENT_DIR, os.pardir, "data", "raw")  # Ruta objetivo (os.pardir: ruta padre)

os.path.exists(DATA_DIR)  # Revisa si el path existe
os.path.isdir(DATA_DIR)  # Revisa si es un directorio

os.listdir(DATA_DIR)  # Itera por los archivos dentro del directorio

os.mkdir(os.path.join(DATA_DIR, "os"))  # Crea la carpeta *"os"*


pathlib.Path()  # Genera un objeto Unix Path o 

CURRENT_DIR = pathlib.Path().resolve()  # Path local completo
DATA_DIR = CURRENT_DIR.parent.joinpath("data", "raw")  # Directorio objetivo

DATA_DIR.exists()  # Revisa si el directorio existe
DATA_DIR.is_dir()  # Revisa si es un directorio

#Utiliza el método “parent” para obtener el directorio padre y de ahí concatenar el path de las carpetas “data” y “raw”.
#Puedes crear una carpeta dentro de un directorio, usando el método “mkdir”:
DATA_DIR.joinpath("<nombre_carpeta>").mkdir()

#Para buscar la ruta de un archivo dentro del proyecto, usando regex:
list(DATA_DIR.glob("<nombre_archivo>"))


fs.open_fs(".")  # Abre una conexión con el path actual (OSFS)

CURRENT_DIR = fs.open_fs(".")

CURRENT_DIR.exists(".")  # Revisa si el directorio existe
DATA_DIR.listdir(".")  # Muestra el contenido dentro de la ruta.

#El path en pyprojroot se construye desde la raíz, no desde el path del archivo que lo ejecuta.
#Puedes mover el archivo a cualquier parte de la carpeta del proyecto, pero los paths no se romperán.
fs.open_fs("../data/raw/")  # Ruta objetivo
pyprojroot.here("data").joinpath("raw")
pyhere.here().resolve() / "data" / "raw"