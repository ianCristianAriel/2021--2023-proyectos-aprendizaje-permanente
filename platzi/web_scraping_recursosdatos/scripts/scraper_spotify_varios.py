import requests
import base64
import json

# Obtención del token de Spotify
def get_token(cliente_id, client_secret):
    client_encode = base64.b64encode(bytes(f"{cliente_id}:{client_secret}", 'utf-8')).decode('utf-8')
    token_spotify = 'https://accounts.spotify.com/api/token'
    params = {'grant_type': 'client_credentials'}
    headers = {'Authorization': f'Basic {client_encode}'}
    
    respuesta = requests.post(token_spotify, data=params, headers=headers)
    
    if respuesta.status_code == 200:
        print(f"Token generado por {respuesta.json()['expires_in']} segundos")
        return respuesta.json()['access_token']
    else:
        raise Exception(f"Error en la generación del token. Error: {respuesta.status_code}")


# Genera los headers con el token de acceso
def header(url_base, access_token):
    """
    Genera y devuelve los encabezados para una solicitud HTTP con el token de acceso.

    Args:
        url_base (str): URL base de la solicitud.
        access_token (str): Token de acceso.

    Returns:
        dict: Encabezados de la solicitud HTTP con el token de acceso.
    """
    headers = {'Authorization': f'Bearer {access_token}'}
    return headers


# Obtiene información de los álbumes de un artista
def get_artista_albums_json(access_token, artista_id):
    url_artista = f'https://api.spotify.com/v1/artists/{artista_id}'
    headers = header(url_artista, access_token)
    artista_response = requests.get(url_artista, headers=headers)
    
    if artista_response.status_code == 200:
        print('Json generado con éxito.')
        return artista_response.json()
    else:
        raise Exception('Error en la obtención del artista.')

# Realiza una búsqueda en Spotify
def get_busqueda_json(busqueda, access_token):
    url_search = 'https://api.spotify.com/v1/search'
    params = {'q': busqueda, 'type': 'artist', 'market': 'AR', 'limit': '10'}
    headers = header(url_search, access_token)
    search_response = requests.get(url_search, params=params, headers=headers)

    if search_response.status_code == 200:
        print('Búsqueda realizada con éxito.')
        return search_response.json()
    else:
        raise Exception('Error en la obtención de la búsqueda.')

# Obtiene información de un álbum específico
def get_album_json(access_token, album_id):
    url_album = f'https://api.spotify.com/v1/albums/{album_id}'
    headers = header(url_album, access_token)
    album_response = requests.get(url_album, headers=headers)
    
    if album_response.status_code == 200:
        print('Álbum obtenido con éxito.')
        return album_response.json()
    else:
        raise Exception(f"Error en la obtención del álbum. Código de estado: {album_response.status_code}")

# Obtiene información de una playlist específica
def get_playlist_json(playlist_id, access_token):
    url_playlist = f'https://api.spotify.com/v1/playlists/{playlist_id}'
    headers = header(url_playlist, access_token)
    playlist_response = requests.get(url_playlist, headers=headers)
    
    if playlist_response.status_code == 200:
        print('Información del playlist obtenida con éxito.')
        return playlist_response.json()
    else:
        raise Exception(f"Error en la obtención de la información de la playlist. Código de estado: {playlist_response.status_code}")

# Ruta y nombre de archivo donde deseas guardar el JSON
ruta_archivo = 'ruta/del/archivo.json'

# Guardar el JSON en el archivo
def guardar_json(json_a, ruta_archivo):
    with open(ruta_archivo, 'w') as archivo:
        json.dump(json_a, archivo)

#generando token
token = get_token('cliente_id', 'client_secret')

#guardando json del album
album = get_album_json(token, '4ANGjPsWOjxKutiQ10YBKL')
ruta_guardado_album = '../datos/crudos/album_strangefruits.json'
guardar_json(album, ruta_guardado_album)

#guardando json de la playlist
playlist = get_playlist_json('4QjYVKQOi6WzYlfCiqGEag',token)
ruta_guardado_playlist = '../datos/crudos/playlist_electrohouse.json'
guardar_json(playlist, ruta_guardado_playlist)


print('JSON guardado con éxito.')
