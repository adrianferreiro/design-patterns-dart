// PROTOTYPE
/*
Permite crear nuevos objetos clonando un objeto existente sin necesidad
de hacerlo desde cero.
*/

abstract class Prototype {
  Prototype clone();
}

class Tarjeta extends Prototype {
  String titulo;
  String color;

  Tarjeta({
    required this.titulo,
    required this.color,
  });

  @override
  Tarjeta clone() {
    return Tarjeta(
      titulo: this.titulo,
      color: this.color,
    );
  }

  @override
  String toString() {
    return "Tarjeta(titulo: $titulo, color: $color)";
  }
}

void main() {
  Tarjeta tarjetaOriginal = Tarjeta(titulo: 'Bienvenidos', color: 'Azul');
  print(tarjetaOriginal);
  Tarjeta tarjetaClonada = tarjetaOriginal.clone();
  tarjetaClonada.titulo = "chau";
  tarjetaClonada.color = "Verde";
  print(tarjetaClonada);
}
