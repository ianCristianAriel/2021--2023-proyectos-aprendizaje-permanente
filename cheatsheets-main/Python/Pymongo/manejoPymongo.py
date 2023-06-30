import pymongo
import pprint
from pymongo import MongoClient
from bson.objectid import ObjectId
from datetime import datetime



divisorPrints= '------------------------------------------------'

#Se inicia una instancia a mongoDB
cliente= MongoClient()#Sin colocar host ni puerto, se conectara a los predetermindados

#Se asigna una base de datos a una variable
db=cliente['ejAnotaciones_pymongo']#Si la base de datos no existe, se crea

#Se crea asigna una coleccion de la base de datos a una variable
coleccion=db['ejColeccion']#Si la coleccion no existe, se crea


#Se inserta documentos en la base de datos
documento= {
    'nombre':'Ian',
    'Apellido':'Yane'
}

#Se inserta un documento en la colleccion y se almacena en una vriable el id de retorno
idDocumento= coleccion.insert_one(documento).inserted_id
print(documento)
print(divisorPrints)

coleccion.insert_one({
    'Verdura':'Tomate',
    'Precio':23
    })

print(coleccion.find_one())
print(divisorPrints)

listaColeccion=coleccion.find()#Accede a todos los documentos de la coleccion y los almacena en una lista
print(list(listaColeccion))
print(divisorPrints)

print(coleccion.find_one({'nombre':'Ian'}))#Accede y se Imprime los datos de el primer documento que coincida con los datos pasados
print(divisorPrints)

#Obtiene el primer objeto que coincide con los valores pasados
idNumerico= ObjectId((coleccion.find_one({'nombre':'Ian'}))['_id'])#ObjectId se utiliza para obtener el id sin el formato string
print(idNumerico)
print(divisorPrints)

#Inserta una lista con varios documentos dentro de una coleccion
coleccion.insert_many([
    {
    'Fruta':'Pera',
    'Precio':20
},{
    'Bci':'mtb',
    'Marca':'Philco'
},{
    'Ropa':'Urbana',
    'Estilo':'Moderno'
}])
pprint.pprint(list(coleccion.find()))
print(divisorPrints)

listaDocumentos= [
    {
    'Fruta':'Pera',
    'Precio':20
},{
    'Bci':'mtb',
    'Marca':'Philco'
},{
    'Ropa':'Urbana',
    'Estilo':'Moderno'
}]
insercionMasivaDocumentos= coleccion.insert_many(listaDocumentos)
print(insercionMasivaDocumentos.inserted_ids)#Devuelve los ids de los documentos
print(divisorPrints)

#Busca la cantidad de documentos en una coleccion
contadorDocumentos= coleccion.count_documents({})
print(contadorDocumentos)
print(divisorPrints)

contadorDocumentosEspesifico= coleccion.count_documents({'nombre':'Ian'})#Cuenta la cantidad de documentos que coinciden con los valores que se le pasa
print(contadorDocumentosEspesifico)
print(divisorPrints)

coleccion2=db['ejColeccion2']

coleccion2.insert_many([{'author': 'Eliot','text': 'and pretty easy too!','title': 'MongoDB is fun'},{'author': 'Mike','tags': ['bulk', 'insert'],'text': 'Another post!'},{'author': 'Eliot'},{'author': 'Mike'}])
#ordena por un parametro que se le pase
documentoOrdenado=coleccion2.find({}).sort('author')

coleccion3_ejUsuarios= db['ejUsuarios']
#A la coleccion se le agrega un nuevo tipo de id
coleccion3_ejUsuarios.create_index([("user_id", pymongo.ASCENDING)], unique=True)
documento_ejUsuarios=[
    {'user_id': 211, 'name': 'Luke'},
    {'user_id': 212, 'name': 'Ziltoid'}]
print(list(documento_ejUsuarios))
print(divisorPrints)