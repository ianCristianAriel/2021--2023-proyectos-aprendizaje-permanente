# Bash cheat sheet

## Navegación de Directorios
- `pwd`: Muestra el directorio actual.
- `ls`: Lista los archivos y directorios en el directorio actual.
- `cd`: Cambia de directorio.
- `cd ..`: Navega al directorio padre.

## Operaciones de Archivos y Directorios
- `touch archivo`: Crea un archivo vacío.
- `mkdir directorio`: Crea un directorio.
- `rm archivo`: Elimina un archivo.
- `rm -r directorio`: Elimina un directorio y su contenido (recursivamente).

## Copiar, Mover y Renombrar
- `cp origen destino`: Copia un archivo o directorio.
- `mv origen destino`: Mueve o renombra un archivo o directorio.

## Ver Contenido de Archivos
- `cat archivo`: Muestra el contenido de un archivo.
- `less archivo`: Muestra el contenido de un archivo página por página.

## Editar Archivos
- `nano archivo`: Abre el archivo en el editor de texto Nano.
- `vim archivo`: Abre el archivo en el editor de texto Vim.

## Redirección y Tuberías
### Redirección de E/S
- `> archivo_salida`: Redirige la salida estándar a un archivo (sobrescribe).
- `>> archivo_salida`: Redirige la salida estándar a un archivo (añade al final).
- `< archivo_entrada`: Redirige la entrada estándar desde un archivo.

### Tuberías (Pipes)
- `comando1 | comando2`: Permite pasar la salida de un comando como entrada a otro.

## Variables y Variables de Entorno
### Declarar y Usar Variables
- `variable="valor"`: Asigna un valor a una variable.
- `echo $variable`: Muestra el valor de una variable.

### Variables de Entorno
- `export NOMBRE_VARIABLE="valor"`: Define una variable de entorno.
- `env`: Muestra las variables de entorno.

## Control de Flujo
### Estructuras de Control
- `if`
- `for`
- `while`

### Comparaciones
- `-eq`: Igual a
- `-ne`: No igual a
- `-lt`: Menor que
- `-le`: Menor o igual que
- `-gt`: Mayor que
- `-ge`: Mayor o igual que

## Ayuda y Documentación
### Manuales
- `man comando`: Muestra el manual del comando.

### Ayuda Rápida
- `comando --help`: Muestra información de ayuda para el comando.

## Comandos Adicionales
- **Ejecución de Comandos en Segundo Plano**: Agrega `&` al final del comando.
- **Ejecución de Comandos en Primer Plano y en Segundo Plano**: Usa `fg` para cambiar un comando en segundo plano a primer plano.
- **Detener la Ejecución de un Comando**: Presiona `Ctrl + C`.
- **Redirección de Salida a un Archivo con Append**: Usa `>>` para redirigir la salida de un comando y agregarla a un archivo existente.
- **Redirección de Errores Estándar a un Archivo**: Redirige errores estándar a un archivo con `comando2 2> errores.txt`.
- **Redirección de Salida y Errores Estándar a un Archivo**: Redirige salida y errores a un archivo con `comando3 &> salida_y_errores.txt`.
- **Redirección de Salida y Errores Estándar a un Archivo en Tiempo Real**: Usa `tee` para ver la salida y los errores en tiempo real mientras los rediriges a un archivo.
- **Pipelines Avanzados**: Combina múltiples comandos en un pipeline complejo.