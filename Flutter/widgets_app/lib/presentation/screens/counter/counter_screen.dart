import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(child: Text('Valor: 10', style: textTheme.titleLarge)),
    );
  }
}
