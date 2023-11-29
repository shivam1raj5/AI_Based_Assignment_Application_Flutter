import 'package:ai_driven_essay_application_flutter/signin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xFF171717),
          child: Center(
            child: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double screenWidth = constraints.maxWidth;
                  double screenHeight = constraints.maxHeight;

                  return Column(
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
                            vertical: screenHeight > 600 ? 12 : 7),
                        height: screenHeight > 600 ? 30 : 20,
                        child: const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                      buildTextField("Name", screenWidth),
                      buildTextField("E-Mail / Phone", screenWidth),
                      buildTextField("Password", screenWidth),
                      buildTextField("Confirm Password", screenWidth),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildOutlinedButton1("Register", () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Register function not available.'),
                              ),
                            );
                          }),
                          const SizedBox(width: 20),
                          buildOutlinedButton2("Sign up with Google", () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Google function not available.'),
                              ),
                            );
                          }),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already a customer ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Signin(),
                                ));
                              },
                              child: const Text(
                                " Log in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
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
          margin: const EdgeInsets.only(top: 5.0, bottom: 10),
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

  Widget buildOutlinedButton1(String label, VoidCallback onPressed) {
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
}
