import 'package:ai_driven_essay_application_flutter/firebase_options.dart';
import 'package:ai_driven_essay_application_flutter/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const LandingPage(),
    );
  }
}
