/*
BRIDGE:
Separa una abstracción de su implementación para que ambos puedan
variar de manera independiente.
Esto es útil cuando tenemos varias abstracciones y varias implementaciones,
y queremos combinarlas sin crear múltiples subclases.
 */

// Jerarquía de la implementación
// (La parte que define los colores)
abstract class Color {
  String pintar();
}

//Las clases concretas Rojo y Azul
//implementan el método pintar
class Rojo extends Color {
  @override
  String pintar() => "Rojo";
}

class Azul extends Color {
  @override
  String pintar() => "Azul";
}

// Jerarquía de la abstracción
// (La parte que define las formas)
abstract class Forma {
  final Color color;
  Forma(this.color);
  String dibujar();
}

// Las clases concretas Circulo y Cuadrado
// Implementan el método dibujar y delegan la lógica
// de color al objeto Color
class Circulo extends Forma {
  Circulo(Color color) : super(color);
  @override
  String dibujar() => "Circulo ${color.pintar()}";
}

class Cuadrado extends Forma {
  Cuadrado(Color color) : super(color);
  @override
  String dibujar() => "Cuadrado ${color.pintar()}";
}

// Forma y Color están desacoplados
// Podemos agregar más formas o más colores sin modificar las clases existentes.

void main() {
  // Crear colores.
  Color rojo = Rojo();
  Color azul = Azul();

  // Crear formas con difetentes colores.
  Forma circuloRojo = Circulo(rojo);
  Forma cuadradoAzul = Cuadrado(azul);

  print(circuloRojo.dibujar());
  print(cuadradoAzul.dibujar());

  // Cambiar el color de una forma
  Forma circuloAzul = Circulo(azul);
  print(circuloAzul.dibujar());
}
