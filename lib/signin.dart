import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xFF171717),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Color.fromRGBO(11, 240, 255, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    child: Text(
                      'Your all in one A.I Assistant',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: screenHeight > 600 ? 20 : 10),
                    height: screenHeight > 600 ? 100 : 50,
                    child: const Center(
                      child: Text(
                        'CHAT MATE',
                        style: TextStyle(
                          color: Color.fromRGBO(11, 240, 255, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  buildTextField("E-Mail / Phone", screenWidth),
                  buildTextField("Password", screenWidth),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildOutlinedButton("Log in", () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Edit function not available.')),
                        );
                      }),
                      const SizedBox(width: 20),
                      buildOutlinedButton("Sign up", () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Plagiarism function not available.')),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 25),
          width: screenWidth * 0.7,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(11, 240, 255, 1),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {});
            },
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Type your text here',
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
      ],
    );
  }

  Widget buildOutlinedButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: 125,
      height: 40,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 255, 174),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
