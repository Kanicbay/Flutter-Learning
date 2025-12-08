import 'package:flutter/material.dart';
import 'package:toktik/config/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toktik',
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Material App Bar'))),

        body: const Center(child: Text('Hello World')),
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
