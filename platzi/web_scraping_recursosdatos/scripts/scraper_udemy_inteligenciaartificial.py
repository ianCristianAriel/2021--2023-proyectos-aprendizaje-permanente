from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

# Configuración del driver de Selenium
opts = Options()
opts.add_argument("--headless") # Headless Mode
opts.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36")
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=opts)

# Navegación a la página de Udemy
driver.get('https://www.udemy.com/courses/search/?src=ukw&q=inteligencia+artificial')


# Realizar clics en el botón "Cargar más" tres veces
for i in range(3):
    # Espera hasta que se cargue la página completamente
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, '//h3[contains(@class, "ud-heading-md course-card--course-title")]/a')))
    boton = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, '//nav[contains(@class, "pagination-module--container")]//svg[@data-testid="next-page"]/use')))
    boton.click()


    # Obtener todos los cursos en la página
    cursos = driver.find_elements(By.XPATH, '//div[contains(@class, "course-list--container")]')

    # Recorrer cada curso y extraer la información deseada
    for curso in cursos:
        precio_element = curso.find_element(By.XPATH, './/div[@data-purpose="course-price-text"]//span')
        precio = precio_element.text if precio_element else 'NO DISPONIBLE'
        print(precio)
        
        titulo_element = curso.find_element(By.XPATH, './/div[@data-purpose="course-title-url"]//a')
        titulo = titulo_element.text if titulo_element else 'NO DISPONIBLE'
        print(titulo)
        
        descripcion_element = curso.find_element(By.XPATH, './/p[contains(@class, "ud-text-sm course-card--course-headline")]')
        descripcion = descripcion_element.text if descripcion_element else 'NO DISPONIBLE'
        print(descripcion)
        
        autor_element = curso.find_element(By.XPATH, './/div[contains(@class, "course-card--instructor-list")]')
        autor = autor_element.text if autor_element else 'NO DISPONIBLE'
        print(autor)

# Cerrar el navegador
driver.quit()
