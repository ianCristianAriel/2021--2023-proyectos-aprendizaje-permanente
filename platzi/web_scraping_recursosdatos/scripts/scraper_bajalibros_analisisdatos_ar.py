from scrapy.item import Field, Item
from scrapy.spiders import CrawlSpider, Rule
from scrapy.selector import Selector
from scrapy.loader import ItemLoader
from scrapy.linkextractors import LinkExtractor

class Libro(Item):
    # Definición de los campos de datos a extraer
    titulo = Field()
    precio = Field()
    descripcion = Field()

class BajalibrosARSpider(CrawlSpider):
    name = 'bajalibros_ar'
    custom_settings = {
        "DOWNLOADER_MIDDLEWARES": {
            'scrapy.downloadermiddlewares.useragent.UserAgentMiddleware': None,
            'scrapy_useragents.downloadermiddlewares.useragents.UserAgentsMiddleware': 500,
        },
        "USER_AGENTS": [
            ('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36'),  # chrome
            ('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36'),  # chrome
            ('Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0'),  # firefox
            ('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.91 Safari/537.36'),  # chrome
            ('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36'),  # chrome
            ('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36'),  # chrome
        ],
        'CLOSESPIDER_PAGECOUNT': 20,
        'CONCURRENT_REQUESTS': 3
    }

    allowed_domains = ['bajalibros.com']

    start_urls = ['https://bajalibros.com/AR/Buscar?field=all&q=analisis+de+datos']

    download_delay = 2
    rules = (
        Rule(
            LinkExtractor(allow=r'page='),  # Regla de horizontalidad para paginación
            follow=True
        ),
        Rule(
            LinkExtractor(allow=r'-eBook-'),  # Regla de verticalidad para detalles de productos
            follow=True,
            callback='parse_libro'
        ),
    )

    def parse_libro(self, response):
        item = ItemLoader(item=Libro(), response=response)
        
        # Extracción de datos utilizando expresiones XPath
        item.add_xpath('titulo', '//div[@class="detail-ebook desktop"]//h2[@class="title-book-mobile"]//text()')
        item.add_xpath('precio', '//div[@class="detail-ebook desktop"]//div[@class="col-detail price hide-on-med-and-up"]//h4[@class="ammount"]/span//text()')
        item.add_xpath('descripcion', '//div[@class="resena-detail"]//span//text()')
        
        yield item.load_item()

        
# EJECUCION
# scrapy runspider scraper_bajalibros_analisisdatos_ar.py -o '../datos/crudos/bajalibros.csv':csv