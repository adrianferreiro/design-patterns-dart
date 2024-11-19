/*
OBSERVER
Establece una relación de uno a muchos entre objetos, de modo que cuando uno
cambia de estado, todos sus dependientes son notificados y actualizados
automáticamente.
EJEMPLO
Implementamos un sistema donde los "suscriptores" se notifican automáticamente
cuando una fuente de noticias publica algo nuevo.
*/

// Interfaz para los observadores (suscriptores)
abstract class Observer {
  void actualizar(String mensaje);
}

// Interfaz para el sujeto (fuente de noticias)
abstract class Sujeto {
  void agregarObserver(Observer observer);
  void removerObserver(Observer observer);
  void notificarObservers();
}

// Clase concreta del sujeto (Fuente de Noticias)
class FuenteDeNoticias implements Sujeto {
  final List<Observer> _observers = [];
  String _noticia = "";

  // Método para publicar una nueva noticia
  void nuevaNoticia(String noticia) {
    _noticia = noticia;
    notificarObservers();
  }

  @override
  void agregarObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void removerObserver(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notificarObservers() {
    for (var observer in _observers) {
      observer.actualizar(_noticia);
    }
  }
}

// Clase concreta de Observer (Suscriptor)
class Suscriptor implements Observer {
  final String nombre;
  Suscriptor(this.nombre);

  @override
  void actualizar(String mensaje) {
    print("Notificación para $nombre: $mensaje");
  }
}

void main() {
  // Crear la fuente de noticias
  FuenteDeNoticias fuente = FuenteDeNoticias();

  // Crear suscriptores
  Observer suscriptor1 = Suscriptor('Alice');
  Observer suscriptor2 = Suscriptor('Bob');
  Observer suscriptor3 = Suscriptor('Charlie');

  // Agregar suscriptores a la fuente de noticias
  fuente.agregarObserver(suscriptor1);
  fuente.agregarObserver(suscriptor2);
  fuente.agregarObserver(suscriptor3);

  // Publicar una noticia
  fuente.nuevaNoticia('Dart 3.0 está disponible!');

  // Remover un suscriptor
  fuente.removerObserver(suscriptor2);

  // Publicar otra noticia
  fuente.nuevaNoticia('Dart 4.0 está disponible');
}
