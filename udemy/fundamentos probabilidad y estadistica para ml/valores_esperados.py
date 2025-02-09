#1: Suponiendo que cara = 1 y cruz = 0, ¿cuál es el valor esperado del lanzamiento de una moneda? 
# valor de cada lado de la moneda
cara = 1 
cruz = 0

# probabilidad de que salga cada lado
p_cara = 1/2
p_cruz = 1/2

# calculo del valor esperado del lanzamiento
valor_esperado = (cara * p_cara) + (cruz * p_cruz)

print(f'El valor esperado del lanzamiento de una moneda es: {valor_esperado}')

#2: ...y de dos lanzamientos de una moneda justa? 
cara = 1 
cruz = 0

p_cara = 1/2
p_cruz = 1/2

valor_esperado = 1 * (p_cara * p_cara) + 0 * (p_cruz * p_cruz)

print(f'El valor esperado de dos lanzamientos de una moneda justa es: {valor_esperado}')

#3: Eres una de las mil personas que compran un billete de lotería. 
#  El billete cuesta 10$ y da 5.000$ si te toca. ¿Qué valor puedes esperar de esta transacción?
# definicion de variables
c_personas = 1000
monto_billete = 10
monto_premio = 5000

# definicion de las probabilidades
p_ganar = 1 / c_personas
p_perder = 999 / c_personas


# calculo del valor esperado
valor_esperado = (monto_premio - monto_billete) * p_ganar + (-monto_billete * p_perder) 

print(f'El valor esperado de la transaccion es: {valor_esperado}')
