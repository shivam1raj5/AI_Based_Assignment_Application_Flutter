import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Essay App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AI_Driven_Essay_Application_Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _questionController = TextEditingController();
  String question = '';

  final TextEditingController _tagsController = TextEditingController();
  String tags = '';

  String language = 'English';
  List<String> dropdownItems = ['English', 'Hindi', 'Punjabi'];

  final TextEditingController _wordsizeController = TextEditingController();
  String wordsize = '';

  String finalQuestion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: 
          ),
        ]));
  }
}
