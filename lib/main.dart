import 'package:ai_driven_essay_application_flutter/api/chat_api.dart';
import 'package:ai_driven_essay_application_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp(chatApi: ChatApi()));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.chatApi, super.key});

  final ChatApi chatApi;

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
      home: MyHomePage(title: 'WELCOME', chatApi: chatApi),
    );
  }
}
