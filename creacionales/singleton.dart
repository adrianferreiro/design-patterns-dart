class Singleton {
  //crear instancia estática privada
  static final Singleton _instance = Singleton._internal();

  //propiedad del ejemplo
  String valor = "Valor inicial";

  //constructor privado para evitar creación de instancias desde fuera
  Singleton._internal();

  //método estático para obtener la instancia única
  static Singleton getInstance() {
    return _instance;
  }
}

void main() {
  //obtener la instancia única
  Singleton instancia1 = Singleton.getInstance();
  Singleton instancia2 = Singleton.getInstance();

  //modificamos la propiedad a traves de una de las instancias
  print("Instancia 001: ${instancia1.valor}");
  print("Instancia 002: ${instancia2.valor}");

  instancia1.valor = "Nuevo valor asignado";

  print("Instancia 001: ${instancia1.valor}");
  print("Instancia 002: ${instancia2.valor}");

  //imprimir las propiedades desde ambas instancias
}
