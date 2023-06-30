# Llama a la funcion de lectura de CSV, que retorna un lista de diccionarios donde cada uno corresponde a un pais
# Por medio de una funcion tomo los valores de la lsita anterior que necesito: poblacion por diferentes años y, lo retorno por lista de labels y lista de values
# Importo funcion que retorana graficos, y por medio de los valores anteriores genero los graficos correspondientes

from lectura_archivos_texto import lectura_csv as lectura
from graficas import genera_grafico_barras as grafico_barras
from graficas import genera_grafico_circular as grafico_pie


def poblacion_por_años(funcion_lista_paises):
    d = {}  # Para corroborar luego que el elemento se halla llenado y, de ahi evaluar si iterar nuevamente o no
    # Muestra los paises disponibles
    for pais in funcion_lista_paises:
        print(pais['Country/Territory'], end=', ')
    # Ingresar por input el pais, si esta en el diccionario, debe mostrar la poblacion por años del pais seleccionado,
    # de lo contrario pedira que se ingrese nuevamente
    while True:
        if d != {}:
            break
        else:
            print('El pais ingresado no se encuentra en la lsita.')

        pais = input(
            'Ingresa el nombre de un pais, exactamente como figura en la lista: ')

        # Por medio de .values se buscara en todas los valores de cada una de las claves del diccionario
        for d in funcion_lista_paises:
            if pais in d.values():
                elementos_pais = d
                break

    # Los valores seleccionados para el grafico, se alamacenan dentro de un diccionario nuevo
    #En matplotlib, es mejor ingresar los labs en formato string para que se vean mejor
    poblacion_año = {
        "1970": int(elementos_pais['1970 Population']),
        "1980": int(elementos_pais['1980 Population']),
        '1990': int(elementos_pais['1990 Population']),
        '2000': int(elementos_pais['2000 Population']),
        '2010': int(elementos_pais['2010 Population']),
        '2015': int(elementos_pais['2015 Population']),
        '2020': int(elementos_pais['2020 Population']),
        '2022': int(elementos_pais['2022 Population']),
    }
    # Se alamacena dentro de variable de tipo lista las claves seleccionadas para la seleccion de valores de interes que corresponden a los metadatos / header
    # del csv
    labels = poblacion_año.keys()
    # Se almacenan dentro de una variable de tipo lista los valores exlusivos de los datos de interes del diccionario, que responden a los metadatos
    # seleccionados
    values = poblacion_año.values()

    # Se retorna la lista que contiene los labels y values para los graficos
    return labels, values


if __name__ == '__main__':
    labels, values = poblacion_por_años(lectura())
    grafico_barras(labels, values)
    grafico_pie(labels, values)
