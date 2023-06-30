import pymongo
import pprint
from pymongo import MongoClient
from decimal import Decimal
from bson.decimal128 import Decimal128
from bson.codec_options import TypeCodec
from bson.codec_options import TypeRegistry
from bson.codec_options import CodecOptions

db= MongoClient('ej_Numeros_Codificacion_Decodificacion')
coleccion= db['ejemplo']

class conversorTipoNumerico:
    def aValorBson(self, valor):
        return Decimal128(valor) 
    def aValorDecimal(self, valor):
        return Decimal(valor)
aConvertir= conversorTipoNumerico()


#ejemplo
valor=Decimal("1222.1212")
bson=aConvertir.aValorBson(valor)

type_registry= TypeRegistry([aConvertir])
codec_options = CodecOptions(type_registry)

