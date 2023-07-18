from scrapy import Field, Item
from scrapy.spiders import CrawlSpider, Rule
from scrapy.loader import ItemLoader
from scrapy.linkextractors import LinkExtractor

class Libro(Item):
    titulo = Field()  # Campo para almacenar el título del libro
    descripcion = Field()  # Campo para almacenar la descripción del libro

class BuscalibreARSpyder(CrawlSpider):
    name = 'buscalibre_ar'  # Nombre del spider
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
    allowed_domains = ['www.buscalibre.com.ar']

    start_urls = ['https://www.buscalibre.com.ar/libros/search?q=ingenieria+de+datos']

    download_delay = 2

    rules = (
        Rule(
            LinkExtractor(allow=r'/p/'),  # Regla para extraer enlaces de detalles de libros
            follow=True,
            callback='parse_libro'  # Método a llamar para procesar los detalles de los libros
        ),
    )

    def parse_libro(self, response):
        item = ItemLoader(Libro(), response)
        item.add_xpath('titulo', '//*[@id="data-info-libro"]/div/div/p[1]//text()')  # Extraer el título del libro
        item.add_xpath('descripcion', '//*[@id="data-info-libro"]/div/div/div[8]/div[1]//text()')  # Extraer la descripción del libro
        
        yield item.load_item()

# EJECUCION
# scrapy runspider scraper_buscalibre_ingenieriadatos_ar.py -o '../datos/crudos/buscalibre.csv':csv