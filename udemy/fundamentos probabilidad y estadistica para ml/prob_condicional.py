# <---- Libraries ------>
import pandas as pd

dict_fast_food = {
    1: [2,7,4],
    2: [5,6,1],
    3: [25,9,0],
    4: [3,14,0]
}

df_fast_food = pd.DataFrame(dict_fast_food, index = ['hot_dog', 'burger', 'pizza'])
print(df_fast_food)

# 1: Calcula la probabilidad marginal de y en el ejemplo de la comida rápida.
total_valores = df_fast_food.values.sum()
prob_marginal_y = df_fast_food.sum() / total_valores

print(f'La probabiidad marginal de "y" es: {prob_marginal_y}')


# 2: ¿Qué es P (tipo de carta = persona, color de la carta = negro)?
print('Es la probabilidad conjunta de que dado una carta de persona esta sea de color negra')

# 3: Sin reemplazo, ¿qué es P (carta 2 = persona | carta 1 = persona)?
print('Es la probabilidad condicional de que la carta dos sea persona, dado que la primer carta salio persona (en este ejemplo si importa el orden)')