import 'package:appmovilclass/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Primer Proyecto',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 20, 147, 20)),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Mi Primer APP',
        edad: 100,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final int edad;

  const MyHomePage({super.key, required this.title, required this.edad});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return UserScreen();
  }
}
