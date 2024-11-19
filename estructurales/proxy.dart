/*
PROXY
permite proporcionar un sustituto o marcador de
posición para otro objeto.
Controla el acceso al objeto original, permitiéndote hacer algo antes o
después de que la solicitud llegue al objeto original.

Se utiliza para proporcionar un intermediario que controle el acceso
a un objeto real.
Puede ser útil para agregar funcionalidades como conrol de acceso,
almacenamiento en caché, o iniciación diferida.

EJEMPLO
Servicio para descargar archivos de internet.
Usaremos un proxy para restringir el acceso solo a usuarios autenticados.
*/

// Interfaz que define el contrato para el servicio de descargas
abstract class FileDownloader {
  void downloadFile(String url);
}

// Implementación real del servicio de descargas
class RealFileDownloader implements FileDownloader {
  @override
  void downloadFile(String url) {
    print("Descargando archivo desde: $url");
  }
}

// Proxy que controla el acceso al  servicio de descargas
class FileDownloaderProxy implements FileDownloader {
  final RealFileDownloader _realDownloader;
  final bool _isAuthenticated;
  FileDownloaderProxy(this._realDownloader, this._isAuthenticated);

  @override
  void downloadFile(String url) {
    if (_isAuthenticated) {
      print("Acceso autorizado. Procediendo con la descarga...");
      _realDownloader.downloadFile(url);
    } else {
      print("Acceso denegado. Usuario no autenticado.");
    }
  }
}

void main() {
  // Servicio real de descargas
  var realDownloader = RealFileDownloader();

  // Proxy para un usuario autenticado
  var authenticatedProxy = FileDownloaderProxy(realDownloader, true);
  authenticatedProxy.downloadFile("http://example.com/archivo.pdf");

  // Proxy para un usuario no autenticado
  var unauthenticatedProxy = FileDownloaderProxy(realDownloader, false);
  unauthenticatedProxy.downloadFile('http://www.expample.com/archivo.pdf');
}
