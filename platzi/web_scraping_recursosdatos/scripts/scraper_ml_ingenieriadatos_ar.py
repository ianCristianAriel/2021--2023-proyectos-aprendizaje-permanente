from scrapy.item import Field, Item
from scrapy.spiders import CrawlSpider, Rule
from scrapy.selector import Selector
from scrapy.loader.processors import MapCompose
from scrapy.linkextractors import LinkExtractor
from scrapy.loader import ItemLoader

class Articulo(Item):
    titulo = Field()  # Campo para almacenar el título del artículo
    precio = Field()  # Campo para almacenar el precio del artículo
    descripcion = Field()  # Campo para almacenar la descripción del artículo

class MercadoLibreARSpider(CrawlSpider):
    name = 'mercado_libre'  # Nombre del spider
    custom_settings = {
        "DOWNLOADER_MIDDLEWARES": {
            'scrapy.downloadermiddlewares.useragent.UserAgentMiddleware': None,
            'scrapy_useragents.downloadermiddlewares.useragents.UserAgentsMiddleware': 500,
        },
        "USER_AGENTS": [
            'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',  # Chrome
            'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36',  # Chrome
            'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0',  # Firefox
            'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.91 Safari/537.36',  # Chrome
            'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36',  # Chrome
            'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36',  # Chrome
        ],
        'CLOSESPIDER_PAGECOUNT': 20,
        'CONCURRENT_REQUESTS': 3
    }

    allowed_domains = ['articulo.mercadolibre.com.ar', 'listado.mercadolibre.com.ar']

    start_urls = ['https://listado.mercadolibre.com.ar/fundamentos-de-ingenieria-de-datos']

    download_delay = 2

    rules = (
        Rule(  # Regla #1: Horizontalidad por paginación
            LinkExtractor(
                allow=r'_Desde_'  # Patrón que permite encontrar enlaces de paginación
            ), follow=True),
        Rule(  # Regla #2: Verticalidad al detalle de los productos
            LinkExtractor(
                allow=r'/MLA-'
            ), follow=True, callback='parse_articulo'),  # Al entrar al detalle de los productos, se llama al callback 'parse_articulo' con la respuesta al requerimiento
    )

    def parse_articulo(self, response):
        sel = Selector(response)
        item = ItemLoader(Articulo(), sel)
        item.add_xpath('titulo', '//h1[@class="ui-pdp-title"]//text()')  # Extraer el título del artículo
        item.add_xpath('precio', '//div[@id="description"]//span[@class="andes-visually-hidden"]//text()')  # Extraer el precio del artículo
        item.add_xpath('descripcion', '//div[@id="description"]//p//text()')  # Extraer la descripción del artículo
        
        yield item.load_item()

        
# EJECUCION
# scrapy runspider scraper_ml_ingenieriadatos_ar.py -o '../datos/crudos/mercado_libre.csv':csv