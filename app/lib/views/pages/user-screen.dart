import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/models/firebase_utils.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:myapp/views/widgets/inputTextBoxWidget.dart';
import 'package:myapp/views/widgets/navBar.dart';
import 'package:myapp/views/widgets/rectangularButtonWidget.dart';
import 'package:myapp/views/widgets/selectionDropdownWidget.dart';
import 'package:myapp/views/pages/change-password-screen.dart';

import 'map-screen.dart';

class UserScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool java = false;
  bool javascript = false;
  bool python = false;
  bool remote = false;
  bool sql = false;
  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: const Key("userScreen"),
      bottomNavigationBar: const NavBar(pageNumber: 2),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            GradientBackground(
                screenHeight: screenHeight),
            Positioned(
              top: screenHeight * 0.1,
              left: 0,
              right: 0,
              child: Text(
                'As tuas informações pessoais:',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.20,
              left: screenWidth * 0.05,
              child: Text(
                'Password:',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Positioned(
                top: screenHeight * 0.25,
                left: screenWidth * 0.048,
                right: screenWidth * 0.35,
                child: RectangularButton(
                  text: 'Alterar password',
                  onPressed: () => changePassword(context),
                  horizontalMargin: 0,
                  backGroundColor: const Color.fromRGBO(102, 152, 173, 1),
                )),
            Positioned(
              top: screenHeight * 0.40,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LanguageSelectionDropdown(),
                  const SizedBox(height: 16),
                  // add some space between the widgets
                  RectangularButton(
                      text: 'Logout',
                      onPressed: () =>logOut(context),
                      horizontalMargin: screenWidth * 0.15,
                      backGroundColor: const Color.fromRGBO(102, 152, 173, 1)),
                ],
              ),
            )

          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
  Future<void> logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapScreen()),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  void changePassword(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String? email = user?.email;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserScreen()));
    } catch (e) {
      // Handle any errors during the password reset process
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to reset password.'),
          duration: Duration(seconds: 2),
        ),
      );
      print('Error while resetting password: $e');
    }
  }

  void getUserInfo() async {
    Map<String, dynamic>? userInfo = await readUserInfo(FirebaseAuth.instance.currentUser?.uid);
    if (userInfo != null) {
      python = userInfo['python'];
      java = userInfo['java'];
      javascript = userInfo['javascript'];
      sql = userInfo['sql'];
      remote = userInfo['remote'];
    } else {
      // User document does not exist
      print('User information not found');
    }    }

}
