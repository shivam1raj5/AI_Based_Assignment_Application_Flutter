import 'package:ai_driven_essay_application_flutter/landing_page.dart';
import 'package:ai_driven_essay_application_flutter/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(35, 35, 35, 5),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF171717),
              ),
              child: Text(
                'CHAT MATE',
                style: TextStyle(
                  color: Color.fromRGBO(0, 255, 194, 1),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(LandingPageState.KEYLOGIN, false);
                await _googleSignIn.signOut();
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Signin(),
                  ));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
