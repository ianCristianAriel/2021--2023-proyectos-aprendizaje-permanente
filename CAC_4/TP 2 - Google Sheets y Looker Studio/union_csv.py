#Script para crear uniones entre archivos CSV por medio de columnas con ID

#Importacion de las librerias
import pandas as pd


#Ruta de los archivos CSV
category_path = ("./Datos/category.csv")
final_path = ("./Datos/Final.csv")
services_path = ("./Datos/services.csv")
users_path = ("./Datos/users.csv")

#Lectura de los archivos CSV
category_df = pd.read_csv(category_path)
final_df = pd.read_csv(final_path)
services_df = pd.read_csv(services_path)
users_df = pd.read_csv(users_path)

#Union de CSV
#Union de dataframe de servicios con dataframe de categorias por medio de id
servicios_categorias_df = pd.merge(services_df, category_df, left_on= 'service_id', right_on= 'id')
#Union de dataframe de usuarios con dataframe resultante anterior
final_usuarios = pd.merge(servicios_categorias_df, users_df, left_on= 'service_id', right_on= 'service_id')
final_usuarios.id.drop

#Se exporta el dataframe a CSV
final_usuarios.to_csv('Usuarios_servicios_categorias.csv', encoding='utf-8')

