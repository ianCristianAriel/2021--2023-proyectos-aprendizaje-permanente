from time import sleep
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import pandas as pd

# Definimos el User Agent en Selenium utilizando la clase Options
opts = Options()
opts.add_argument("--headless") # Headless Mode
opts.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36")
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=opts)

# URL SEMILLA
driver.get('https://platzi.com/escuela/datos/')

sleep(20)
# Obtener los links de las rutas
links_rutas = driver.find_elements(By.XPATH, '//div[@id="Routes"]//a[contains(@class, "RoutesCard_RoutesCardLink")]')
links_de_las_rutas = [link.get_attribute("href") for link in links_rutas]

# Recorrer cada una de las rutas
cursos = []

for link in links_de_las_rutas:
    sleep(9)  # Prevenir baneos de IP
    try:
        # Voy a cada uno de los links de los detalles de los productos
        driver.get(link)
        bloque_cursos = driver.find_elements(By.XPATH, '//div[contains(@class, "Course_CourseInformation")]')
        cursos.extend([curso.find_element(By.XPATH, './/h3').text for curso in bloque_cursos])
        # Aplasto el botón de retroceso
        driver.back()

    except Exception as e:
        print(e)
        # Si sucede algún error dentro del detalle, no me complico. Regreso a la lista y sigo con otro producto.
        driver.back()

# Cerrar todas las ventanas
driver.quit()

#Convierto la lista a un dataframe y lo almaceno en un .CSV
df_cursos = pd.DataFrame(cursos)
df_cursos.to_csv('../datos/crudos/platzi_escueladatos_cursos.csv', index=True)