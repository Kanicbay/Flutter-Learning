void main() async {

  print('Inicio del programa');

  try {
    final value = await httpGet('http://localhost/cursos/');
    print('Exito: $value');
  } on Exception catch(err) {
    print('Tenemos una Exception: $err');
  } catch (e) {
    print('OPS!! Algo terrible paso: $e');
  } finally {
    print('Fin del try y catch');
  }

  print('Fin del programa');
}


Future<String> httpGet(String url) async {

  await Future.delayed( const Duration(seconds: 1));
  
  throw Exception('No hay parámetros en el URL');
}