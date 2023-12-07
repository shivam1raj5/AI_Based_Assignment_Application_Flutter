// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, camel_case_types

import 'package:ai_driven_essay_application_flutter/home_page.dart';
import 'package:ai_driven_essay_application_flutter/landing_page.dart';
import 'package:ai_driven_essay_application_flutter/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _isRegistering = false;

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
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [Colors.blue, Colors.green],
                              tileMode: TileMode.clamp,
                            ).createShader(bounds);
                          },
                          child: const Center(
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                color: Color.fromRGBO(11, 240, 255, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),
                            ),
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
                      buildTextField1("Name", screenWidth, nameController),
                      buildTextField1(
                          "E-Mail / Phone", screenWidth, emailController),
                      buildTextField2(
                          "Password", screenWidth, passwordController),
                      buildTextField2("Confirm Password", screenWidth,
                          confirmpasswordController),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildOutlinedButton1("Register", _registerUser),
                          const SizedBox(width: 20),
                          buildOutlinedButton2("Signup with Google", () {
                            signInWithGoogle();
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
                                " Login",
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

  Widget buildTextField1(
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
          margin: const EdgeInsets.only(top: 5.0, bottom: 10),
          width: screenWidth * 0.7,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(11, 240, 255, 1),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            obscureText: !_passwordVisible,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Type your text here',
              hintStyle: const TextStyle(
                color: Color.fromRGBO(112, 108, 108, 39),
                fontFamily: 'Poppins',
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              contentPadding: const EdgeInsets.all(12.0),
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
        onPressed: _isRegistering
            ? null
            : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 255, 174),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: _isRegistering
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
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

  void _registerUser() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
    } else {
      if (passwordController.text == confirmpasswordController.text) {
        setState(() {
          _isRegistering = true;
        });

        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Signin(),
          ));
        }).onError((error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error- All ready registerd or cridential issue."),
            ),
          );
        }).whenComplete(() {
          setState(() {
            _isRegistering = false;
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Both Passwords should be the same."),
          ),
        );
      }
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: ['email'],
      ).signIn();

      if (googleUser == null) {
        return;
      }

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (user.user != null) {
        changevalSharedPreferences();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        print("User signed in: ${user.user!.displayName}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-in failed')),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign-in failed.")),
      );
    }
  }

  void changevalSharedPreferences() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(LandingPageState.KEYLOGIN, true);
  }
}
