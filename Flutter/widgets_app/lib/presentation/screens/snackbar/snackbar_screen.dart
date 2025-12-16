import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás Seguro?'),
        content: Text(
          'Parrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafo',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Parrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafoParrafor parrafo parrafo parrafo parrafo parrafo parrafo parrafo',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar diállogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
