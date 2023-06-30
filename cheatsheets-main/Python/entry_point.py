def modulo_a():
    print('Funcion 1 del modulo')
    

def modulo_b():
    print('Funcion 2 del modulo')
    
#Esta parte del codigo se le llama ENTRY POINT, sirve para hacer que la parte luego del if, se ejecute solo si es desde el mismo
# archivo, de lo contrario solo se ejecutaran las funciones que sean importadas en el otro archivo   
if __name__ == "__main__" :
    modulo_a()
    modulo_b()