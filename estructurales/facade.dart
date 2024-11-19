/*
FACADE
Proporciona una interfaz simplificada para un sistema
complejo, ocultando sus detalles internos y permitiendo
que los clientes interactúen con el sistema de forma
más sencilla
*/

// Clase compleja
class CPU {
  void encender() {
    print("CPU encendida");
  }
}

class Memoria {
  void cargar() {
    print("Memoria cargada.");
  }
}

class DiscoDuro {
  void leer() {
    print("Disco duro leyendo datos.");
  }
}

// Clase Facade

class ComputadoraFacade {
  final CPU cpu;
  final Memoria memoria;
  final DiscoDuro discoDuro;
  ComputadoraFacade(
    this.cpu,
    this.memoria,
    this.discoDuro,
  );

  // Método simple que envuelve la lógica compleja
  void encenderComputadora() {
    print("Encendiendo la computadora ...");
    cpu.encender();
    memoria.cargar();
    discoDuro.leer();
    print("Computadora encendida y lista para usar.");
  }
}

void main() {
  // Crear los componentes
  CPU cpu = CPU();
  Memoria memoria = Memoria();
  DiscoDuro discoDuro = DiscoDuro();

  //Crear el Facade que interactúa con los componentes
  ComputadoraFacade computadoraFacade = ComputadoraFacade(
    cpu,
    memoria,
    discoDuro,
  );

  computadoraFacade.encenderComputadora();
}
