def factorial(n: int) -> int:
    """
    Calcula el factorial de un número entero no negativo.
    
    :param n: Número entero para calcular el factorial.
    :return: Factorial de 'n'.
    """
    if n == 0:
        return 1
    
    resultado = 1
    for i in range(1, n + 1):
        resultado *= i
    
    return resultado


def coeficiente_binomial(n: int, k: int) -> int:
    """
    Calcula el coeficiente binomial, que representa la cantidad de formas
    en que se pueden elegir 'k' elementos de un conjunto de 'n' elementos.
    
    :param n: Número total de elementos.
    :param k: Número de elementos seleccionados.
    :return: Coeficiente binomial C(n, k).
    """
    if not (0 <= k <= n):
        raise ValueError("El valor de 'k' debe estar entre 0 y 'n'")
    
    return factorial(n) // (factorial(k) * factorial(n - k))


# <--------------------------------------------------------------------------------------------------------------------------->

# Ejercicio: ¿Cuál es la probabilidad de sacar el As de Picas dos veces seguidas con reposición?

# Definimos las variables del problema
cartas_totales = 52  # Total de cartas en la baraja
cartas_as_picas = 1   # Número de As de Picas en la baraja

# Probabilidad de sacar un As de Picas en una extracción
probabilidad_as_picas = cartas_as_picas / cartas_totales

# Como son eventos independientes, multiplicamos las probabilidades
probabilidad_dos_ases = probabilidad_as_picas * probabilidad_as_picas

print(f"Probabilidad de sacar el As de Picas dos veces seguidas: {probabilidad_dos_ases:.5f}")

# <--------------------------------------------------------------------------------------------------------------------------->

# Se saca una carta de la baraja. Después de volver a colocar la carta extraída en el mazo y barajar bien, 
# ¿cuál es la probabilidad de volver a sacar la misma carta?

# Definimos las variables del problema
cartas_totales = 52  # Total de cartas en la baraja
cartas_x = 1   # Número de As de Picas en la baraja

# Probabilidad de sacar un As de Picas en una extracción
probabilidad_carta_x_1 = cartas_totales / cartas_totales
probabilidad_carta_x_2 = cartas_x / cartas_totales

# Como son eventos independientes, multiplicamos las probabilidades
prob_x_2 = probabilidad_carta_x_1 * probabilidad_carta_x_2

print(f"Probabilidad de sacar el As de Picas dos veces seguidas: {prob_x_2:.5f}")

# <--------------------------------------------------------------------------------------------------------------------------->

# Utiliza combinatoria para calcular la probabilidad de sacar tres caras en cinco lanzamientos de moneda.
n_ensayos = 5
n_exitos = 3
n_eventos_posibles = 2

coef_binomial = coeficiente_binomial(n=n_ensayos, k=n_exitos)

prob_3caras = coef_binomial / n_eventos_posibles ** n_ensayos

print(f'La probabilidad de sacar 3 caras seguidas es de: {prob_3caras:.3f}')

# <--------------------------------------------------------------------------------------------------------------------------->

# Crea un método en Python que resuelva el ejercicio 3 e incorpora la fórmula del coeficiente binomial
# Con el método en la mano, calcular la probabilidad de en cinco lanzamientos:
# tirar cada uno de cero, uno, dos, tres, cuatro y cinco caras.

# no comprendo la consigna