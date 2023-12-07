import 'package:ai_driven_essay_application_flutter/widgets/appbar.dart';
import 'package:ai_driven_essay_application_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:ai_driven_essay_application_flutter/chat_page.dart';

class LatterMyHomePage extends StatefulWidget {
  const LatterMyHomePage({
    super.key,
  });

  @override
  State<LatterMyHomePage> createState() => _LatterMyHomePageState();
}

class _LatterMyHomePageState extends State<LatterMyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String s1 = 'Write a latter to ',
      s2 = ' and tell ',
      s3 = ' include ',
      s4 = ' in ',
      s5 = ' language in ',
      s6 = ' words.',
      title = 'Subject :- ';

  final TextEditingController _toController = TextEditingController();
  String to = '';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            onProfilePressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          drawer: const MyDrawer(),
          body: Container(
            color: const Color(0xFF171717),
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 18),
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'Write ',
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Latter ',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Color.fromRGBO(0, 255, 194, 1),
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nwith Powered AI',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.065,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(11, 240, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: TextField(
                        controller: _toController,
                        onChanged: (value) {
                          setState(() {
                            to = value;
                          });
                        },
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'To -',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(112, 108, 108, 39),
                            fontFamily: 'Poppins',
                          ),
                          contentPadding: EdgeInsets.all(12.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(11, 240, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
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
                          hintText: 'Description of latter',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(112, 108, 108, 39),
                            fontFamily: 'Poppins',
                          ),
                          contentPadding: EdgeInsets.all(12.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.065,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(11, 240, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
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
                          hintText: 'Add Tags, Keywords (Use, to add)',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(112, 108, 108, 39),
                            fontFamily: 'Poppins',
                          ),
                          contentPadding: EdgeInsets.all(12.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Text(
                            '  Choose Language',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 100,
                            height: 36,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(11, 240, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
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
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                              dropdownColor:
                                  const Color.fromRGBO(35, 35, 35, 1),
                              iconSize: 30,
                              underline: Container(
                                height: 0,
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromRGBO(11, 240, 255, 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Text(
                            '  Word Count',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Container(
                            width: 100,
                            height: 36,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(11, 240, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextField(
                              controller: _wordsizeController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  wordsize = value;
                                });
                              },
                              maxLines: null,
                              expands: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Eg-75',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(112, 108, 108, 39),
                                  fontFamily: 'Poppins',
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 3),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Expanded(
                        child: Align(
                            child: SizedBox(
                      width: screenWidth * 0.9,
                      height: 50,
                      child: OutlinedButton(
                          onPressed: () {
                            if (_questionController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please Add Subject.')),
                              );
                            } else {
                              setState(() {
                                finalQuestion =
                                    "$s1$to$s2$question$s3$tags$s4$language$s5$wordsize$s6";
                                title = "$title$question";
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                      finalQuestion: finalQuestion,
                                      question: title),
                                ));
                              });
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(0, 255, 194, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text('Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ))),
                    ))),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
