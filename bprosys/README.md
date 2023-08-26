## Descripción
Este repositorio contiene soluciones para la prueba técnica de la empresa Bprosys. En esta prueba, se abordan consultas SQL diseñadas para enfrentar el desafío de conciliación de transacciones entre la empresa hipotética CLAP y su aliado SIMETRIK. El proceso crítico consiste en verificar y comparar transacciones registradas en las bases de datos de CLAP y su banco asociado, BANSUR.

### Estado del Proyecto
**Finalizado**

### Estructura de Directorios y Archivos

    Prueba Técnica Bprosys
    │
    ├── datos
    │   ├── csv                <- Archivos .csv
    │   │   ├── brutos         <- Archivos base
    │   │   └── procesados     <- Archivos limpios
    │   └── sql                <- Bases de datos y queries DDL
    │
    ├── notebooks              <- Notebooks divididos por etapas del proyecto
    |
    ├── .gitignore             <- Archivos ignorados por Git
    │
    ├── requerimientos.txt     <- Paquetes y dependencias
    │   
    └── README.md              <- Detalles por escrito

### Funciones y Aplicaciones
- **Limpieza**
- **Valores nulos**
- **Consultas SQL:**
  - **DDL**
  - **DML**

### Tecnologías Utilizadas
- Python
  - Numpy
  - Pandas
  - Matplotlib
  - Sqlite3

#### Instalación de Paquetes

`pip3 install requerimientos.txt`
