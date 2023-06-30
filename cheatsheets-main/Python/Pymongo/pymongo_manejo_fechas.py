import pymongo
from pymongo import MongoClient
from datetime import datetime
from pprint import pprint

db= MongoClient('ejFechaHora')

coleccion= db['ejColeccionFechaHora']

hora= coleccion.objects.insert_one(
    {
        'nombre':'xyz',
        "last_modified": datetime.datetime.utcnow()}
)

pprint(hora)