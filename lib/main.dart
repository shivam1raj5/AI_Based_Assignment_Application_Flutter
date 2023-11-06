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
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Write Essays with Powered AI",
                  style: TextStyle(
                    fontSize: 28,
                    color: Color.fromARGB(255, 0, 128, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 370,
                  height: 180,
                  child: TextField(
                    controller: _questionController,
                    onChanged: (value) {
                      setState(() {
                        question = value;
                      });
                    },
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      hintText: 'Write a best match title/prompt',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 370,
                  height: 80,
                  child: TextField(
                    controller: _tagsController,
                    onChanged: (value) {
                      setState(() {
                        tags = value;
                      });
                    },
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      hintText: 'Add Tags, Keywords (Use, to add)',
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 125,
                    ),
                    const Text(
                      '  Choose Language',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 128, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 90,
                      height: 50,
                      child: DropdownButton<String>(
                        value: language,
                        onChanged: (newValue) {
                          setState(() {
                            language = newValue!;
                          });
                        },
                        items: dropdownItems.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      '  Word Count',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 128, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    SizedBox(
                      width: 90,
                      height: 60,
                      child: TextField(
                        controller: _wordsizeController,
                        onChanged: (value) {
                          setState(() {
                            wordsize = value;
                          });
                        },
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          hintText: 'Eg-75',
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 380,
                          height: 65,
                          child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  finalQuestion =
                                      "$question$tags$language$wordsize";
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                    255, 210, 187, 255), // Background color
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 128, 255)),
                              )),
                        ))),
              ],
            ),
          ),
        ]));
  }
}
