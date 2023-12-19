import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/pages/map-screen.dart';
import 'package:myapp/views/pages/sign-up-screen.dart';
import 'package:myapp/models/firebase_utils.dart';

import '../widgets/inputTextBoxWidget.dart';
import '../widgets/gradientBackground.dart';
import '../widgets/rectangularButtonWidget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: const Key("signInScreen"),
      body:Stack(
        children: [
          GradientBackground(screenHeight: screenHeight),
          Positioned(
              top: 0.15 * screenHeight,
              left: 0,
              right: 0,
              child:
              const Center(
                child:  SizedBox(
                  child:  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              )
          ),
          Positioned(
            top: 0.25 * screenHeight,
            left: 0,
            right: 0,
            height: 0.5 * screenHeight,
            child:
                InputTextBox(
                controller: emailController,
                    topText: "",
                    hintText: "email",
                    obsText: false),
          ),

            Positioned(
              top: 0.35 * screenHeight,
              left: 0,
              right: 0,
              child: InputTextBox(
                  controller: passwordController,
                  topText: "",
                  hintText: "password",
                  obsText: true),
            ),
            Positioned(
              top: 0.52 * screenHeight,
              left: 0,
              right: 0,
              child: RectangularButton(
                key: const Key('loginButton'),
                text: "Login",
                backGroundColor: const Color.fromRGBO(102, 152, 173, 1),
                onPressed: () => signIn(emailController, passwordController, context),
                horizontalMargin: 0.03 * screenWidth,
                    ),
            ),
          Positioned(
              top: 0.73 * screenHeight,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/page-1/images/loginScreenImg.png",
              ),
          ),
          Positioned(
            top: 0.485 * screenHeight,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // your other widgets here
                if (errorMessage.isNotEmpty) // display the error message if it's not empty
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red,
                    fontSize: 18)

                  ),
              ],
            ),
          ),
          Positioned(
            top: 0.60 * screenHeight,
            left: 0,
            right: 0,
              child: TextButton(
                key: const Key('noAccount'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Don't have an account?\n Sign Up here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    height: 1.3,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
          ),
          Positioned(
              key: const Key("arrowBackButton"),
              top: 0.07 * screenHeight,
              left: 0.06 *screenWidth,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 35,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) => MapScreen()),
                  );
                },
              )
          )
            ]
      ),
      backgroundColor: Colors.black,
    );
  }
  Future<void> signIn(TextEditingController emailController, TextEditingController passwordController, BuildContext context) async {
    firebaseSignIn(emailController, passwordController, context);
    errorMessage = changeErrorMessage();
    setState(() {});
  }




}

