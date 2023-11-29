import 'package:ai_driven_essay_application_flutter/essay_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI_Driven_Essay_Application_Flutter',
      theme: ThemeData(
        primaryColor: const Color(0xFF171717),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF171717),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
