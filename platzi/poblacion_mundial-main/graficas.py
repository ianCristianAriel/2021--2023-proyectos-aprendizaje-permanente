import matplotlib.pyplot as plt


def genera_grafico_barras(labels, values):
    # Estas son herramientas del modulo pyplot
    # fig se encarga de la parte visual
    # Ax se encarga de las cordenadas de la grafica
    fig, ax = plt.subplots()
    # Bar se encarga de la parte de las barras dentro de grafica
    ax.bar(labels, values)
    plt.show()


def genera_grafico_circular(labels, values):
    fig, ax = plt.subplots()
    # En el caso de los graficos circulares o de torta, es necesario espesificar el parametro labels
    ax.pie(values, labels=labels)
    # pie se encarga de los graficos circulares o de torta
    # equal se encara de central la grafica
    ax.axis('equal')
    plt.show()


if __name__ == '__main__':
    labels = ['a', 'b', 'd']
    values = [1000, 30, 40]
    genera_grafico_barras(labels, values)
    genera_grafico_circular(labels, values)
