void main () {
  
  print( greetEveryone() );
  print( greetEveryoneLambda() );

  print('Suma: ${addTwoNumbers(10, 20)}');
  print('Suma: ${addTwoNumbersLambda(10, 20)}');
  print('Suma: ${addTwoNumbersOptional(10)}');

  print(greetPerson(name: 'Alexis', message: 'Hi,'));

}

String greetEveryone() {
  return 'Hello everyone';
}

String greetEveryoneLambda() => 'Hello everyone!';

int addTwoNumbers(int a, int b) {
  return a + b;
}

int addTwoNumbersLambda(int a, int b) => a+b;

int addTwoNumbersOptional(int a, [int b = 0]){
  return  a+b;
}

// En lugar de asignar por posiciones, se asigna los parametros por nombre
String greetPerson({required String name, String message = 'Hola,'}) {
  return '$message $name';
}