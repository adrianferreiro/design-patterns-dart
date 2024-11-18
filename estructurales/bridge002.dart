abstract class Accion {
  String ejecutar();
}

class Encender extends Accion {
  @override
  String ejecutar() => "Encender";
}

class Apagar extends Accion {
  @override
  String ejecutar() => "Apagar";
}

abstract class Dispositivo {
  final Accion accion;
  Dispositivo(this.accion);
  String realizarAccion();
}

class Televisor extends Dispositivo {
  Televisor(Accion accion) : super(accion);

  @override
  String realizarAccion() => "Televisor: ${accion.ejecutar()}";
}

class Radio extends Dispositivo {
  Radio(Accion accion) : super(accion);
  @override
  String realizarAccion() => "Radio: ${accion.ejecutar()}";
}

void main() {
  Accion encender = Encender();
  Accion apagar = Apagar();

  Dispositivo televisorEncendido = Televisor(encender);
  Dispositivo radioEncendida = Radio(encender);
  Dispositivo televisorApagado = Televisor(apagar);

  print(televisorEncendido.realizarAccion());
  print(radioEncendida.realizarAccion());
  print(televisorApagado.realizarAccion());
}
