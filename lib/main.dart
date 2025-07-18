import 'package:flutter/material.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vintage Photo App',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
