def funcion_Decoradora(funcion_Parametro):
    def funcion_Interior():
        #Acciones adicionales que decoran
        print('Vamos a realizar el calculo')

        funcion_Parametro()

        #Acciones adicionales que decoran
        print('Emos terminado el calculo')
        
    return funcion_Interior

@funcion_Decoradora
def suma():
    print(12+3)

#Para utilizar la funcion decoradra se deve llamar a la funcion parametro (la que se va a decorar)  o llamando a la funcion decoradora y pasandole la funcion parametro como parametro
suma() 
funcion_Decoradora(suma())

#####################################################################################################################################################################

def funcion_Decoradora(funcion_Parametro):
    def funcion_Interior(*args): #El asterico sirve para resivir argumentos indeterminados y args es una convencion para cuando se utiliza
        #Acciones adicionales que decoran
        print('Vamos a realizar el calculo')

        funcion_Parametro(*args)

        #Acciones adicionales que decoran
        print('Emos terminado el calculo')
        
    return funcion_Interior

@funcion_Decoradora
def suma(num1, num2):
    print(num1+num2)
@funcion_Decoradora
def resta(num1,num2,num3):
    print((num1-num2)-num3)
#Para utilizar la funcion decoradra se deve llamar a la funcion parametro (la que se va a decorar)  o llamando a la funcion decoradora y pasandole la funcion parametro como parametro
suma(12,34)
resta(23,45,67) 

#####################################################################################################################################################################

