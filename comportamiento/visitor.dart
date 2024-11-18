/*
VISITOR
Permite agregar nuevas operaciones a estructuras de datos complejas sin modificar sus clases.
Se logra separando las operaciones en una clase independiente llamada Visitor
 */

/*
Permite separar algoritmos de los objetos sobre los que operan.
 */

/*
CONCLUSIÓN: usamos visitor cuando tenemos clases ya existentes con sus 
propios métodos y propiedades pero queremos crear métodos externos
para poder operar sobre ellos sin modificarlas.
*/

// La interfaz Visitor define operaciones para cada tipo de
// elemento que puede visitar

abstract class Visitor {
  double visitarCirculo(Circulo circulo);
  double visitarCuadrado(Cuadrado cuadrado);
  double visitarRectangulo(Rectangulo rectangulo);
}

// La interfaz Element define un método para aceptar a un visitante
abstract class Figura {
  double aceptar(Visitor visitor);
}

// Clase concreta de Figura
class Circulo implements Figura {
  final double radio;
  Circulo(this.radio);

  @override
  double aceptar(Visitor visitor) {
    return visitor.visitarCirculo(this);
  }
}

class Cuadrado implements Figura {
  final double lado;
  Cuadrado(this.lado);
  @override
  double aceptar(Visitor visitor) {
    return visitor.visitarCuadrado(this);
  }
}

class Rectangulo implements Figura {
  final double ancho;
  final double alto;
  Rectangulo(this.ancho, this.alto);
  @override
  double aceptar(Visitor visitor) {
    return visitor.visitarRectangulo(this);
  }
}

// Implementación del visitor para calcular áreas
class CalcularAreaVisitor implements Visitor {
  @override
  double visitarCirculo(Circulo circulo) {
    return 3.14 * circulo.radio * circulo.radio;
  }

  @override
  double visitarCuadrado(Cuadrado cuadrado) {
    return cuadrado.lado * cuadrado.lado;
  }

  @override
  double visitarRectangulo(Rectangulo rectangulo) {
    return rectangulo.alto * rectangulo.ancho;
  }
}

void main() {
  //crear figuras
  Figura circulo = Circulo(5.0);
  Figura cuadrado = Cuadrado(4.0);
  Figura rectangulo = Rectangulo(3.0, 6.0);

  //crear un visitor para calcular áreas
  Visitor areaVisitor = CalcularAreaVisitor();

  //Calcular áreas usando el visitor
  print("Área del círculo: ${circulo.aceptar(areaVisitor)}");
  print("Área del cuadrado: ${cuadrado.aceptar(areaVisitor)}");
  print("Área del rectángulo: ${rectangulo.aceptar(areaVisitor)}");
}
