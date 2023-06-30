import csv
# Este modulo sirve para imprimir los diccionarios linea por linea de manera estetica
from pprint import pprint

# En esta variable almaceno la direccion del archivo csv a leer
csv_path = r'C:\Users\Ian\Desktop\world_population.csv'


def lectura_csv():
    # Por medio de with se evita cerrar el archivo con .close, se cierra por defecto
    with open(csv_path, 'r') as archivo_csv:
        # En el delimitador va lo que separa los distintos elementos, es variable
        lectura = csv.reader(archivo_csv, delimiter=',')
        # En este caso como los elementos tienen sus metadatos en las columnas, se toma la primer fila y se almacena como tal
        encabezado = next(lectura)
        # Se almacenaran los diccionarios con la informacion de los distinos elementos, dentro de una lista
        lista_diccionarios = []
        # Se recorre fila por fila para obtener sus datos dentro de un diccionarioo
        for fila in lectura:
            # El diccionario molde del encabezado, se une con los diccionarios de cada fila, formando una lista
            iterable = zip(encabezado, fila)
            # Se almacena los elementos anteriores dentro de diccionario por cada clave del header y cada clave de la fila
            diccionario_poblacion = {clave: valor for clave, valor in iterable}
            # Se almacena el diccionario anterior dentro de la lista exclusiva de los diccionarios de cada elemento
            lista_diccionarios.append(diccionario_poblacion)
        return lista_diccionarios


if __name__ == '__main__':
    pprint(lectura_csv())
