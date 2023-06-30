
try:
    value = input('Ingresa un número natural: ')
    print('El recíproco de', value, 'es', 1/int(value))        
except ValueError: #Para casos donde las operaciones sean incorrectas ejemplo dividir strings
    print('No se que hacer con', value)    
except ZeroDivisionError:#Cuando se intenta dividir por cero
    print('La división entre cero no está permitida en nuestro Universo.')
except TypeError:#Cuando se intenta por ejemplo aplicar un metodo unico para listas en tuplas
    print('Opercion inadecuada')
except AttributeError:#Cuando se intenta utilizar un metodo que no existe como lista.dppend
    print('operacion inexistente')
except SyntaxError:#Cuando se utiliza una sintaxis de python erronea
    print('sintaxis invalida')
except:
    print('Ha sucedido algo extraño, ¡lo siento!') #¡el except por defecto debe ser el último except! ¡Siempre!
