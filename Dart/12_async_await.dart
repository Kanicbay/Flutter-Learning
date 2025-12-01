void main() async {

  print('Inicio del programa');

  try {
    final value = await httpGet('http://localhost/cursos/');
    print('Exito: $value');
  } catch (e) {
    print('Tenemos un error: $e');
  } finally {
    print('Fin del try y catch');
  }
  
  print('Fin del programa');
}


Future<String> httpGet(String url) async {

  await Future.delayed( const Duration(seconds: 1));
  throw 'Error en la petición';
  // return 'Tenemos un valor de la petición';
}