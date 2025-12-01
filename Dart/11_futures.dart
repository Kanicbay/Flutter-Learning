void main() {

  print('Inicio del programa');

  httpGet('http://localhost/cursos/').then(
    (value) {
    print(value);
  }).catchError((err) {
    print(err);
  });

  print('Fin del programa');
}


Future<String> httpGet(String url) async {

  await Future.delayed( const Duration(seconds: 1));

  return Future.delayed( const Duration(seconds: 1), () {

    throw 'Error en la petición http';
    // return 'Respuesta de la petición http';

  });
}