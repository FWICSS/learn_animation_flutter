import 'package:flutter/material.dart';
import 'package:learn_animation/main_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.blue,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: const SquarSize(),
      ),
    );
  }
}

