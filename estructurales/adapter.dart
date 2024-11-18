/*
El patrón adapter se utiliza para permitir que dos clases incompatibles
trabajen juntas al crear una interfaz intermedia.
*/

// Interfaz que el cliente espera usar
abstract class JsonParser {
  String parseJson();
}

// Clase existente que utiliza JSON
class JsonService implements JsonParser {
  @override
  String parseJson() {
    return '{"mensaje": "Hola desde JSON"}';
  }
}

// Clase incompatible que trabaja con XML
class XmlService {
  String getXml() {
    return '<mensaje>Hola desde XML</mensaje>';
  }
}

// Adaptador que hace compatible XmlService con JsonParser
class XmlToJsonAdapter implements JsonParser {
  final XmlService xmlService;

  XmlToJsonAdapter(this.xmlService);

  @override
  String parseJson() {
    String xml = xmlService.getXml();

    // Lógica simple para convertir XML a JSON (solo como ejemplo)
    String json =
        '{"mensaje": "${xml.replaceAll(RegExp(r'<\/?mensaje>'), '')}"}';

    return json;
  }
}

void main() {
  // Usar el servicio JSON directamente
  JsonParser jsonService = JsonService();
  print("JSON Service: ${jsonService.parseJson()}");

  // Usar el servicio XML a través del adaptador
  XmlService xmlService = XmlService();
  JsonParser adapter = XmlToJsonAdapter(xmlService);
  print("XML through Adapter: ${adapter.parseJson()}");
}
