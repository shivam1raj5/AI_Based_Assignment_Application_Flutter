// ignore_for_file: library_private_types_in_public_api

import 'package:ai_driven_essay_application_flutter/essay_home_page.dart';
import 'package:ai_driven_essay_application_flutter/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
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
                  buildTextField(
                      "E-Mail / Phone", screenWidth, emailController),
                  buildTextField2("Password", screenWidth, passwordController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildOutlinedButton("Login", () {
                        handleLogin();
                      }),
                      const SizedBox(width: 20),
                      buildOutlinedButton("Signup", () {
                        navigateToSignup();
                      }),
                    ],
                  ),
                  const SizedBox(width: 20),
                  buildOutlinedButton2("Login with Google", () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Google function not available.'),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, double screenWidth, TextEditingController controller) {
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
            controller: controller,
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

  Widget buildTextField2(
      String label, double screenWidth, TextEditingController controller) {
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
            controller: controller,
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

  Widget buildOutlinedButton2(String label, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 275,
      height: 35,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 255, 174),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.google,
              color: Colors.black,
            ),
            const SizedBox(width: 15),
            Text(
              label,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void handleLogin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
    } else {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EssayMyHomePage(),
        ));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error - Username/Password not matched."),
          ),
        );
      });
    }
  }

  void navigateToSignup() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Signup(),
    ));
  }
}
