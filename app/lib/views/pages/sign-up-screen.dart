import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/firebase_utils.dart';
import 'package:myapp/views/pages/map-screen.dart';
import 'package:myapp/views/pages/sign-in-screen.dart';

import '../widgets/inputTextBoxWidget.dart';
import '../widgets/gradientBackground.dart';
import '../widgets/rectangularButtonWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    confirmEmailController.dispose();

    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      key: const Key("signUpScreen"),
      body:Stack(
          children: [
            GradientBackground(screenHeight: screenHeight),
            Positioned(
                top: 0.10 * screenHeight,
                left: 0,
                right: 0,
                child:
                const Center(
                  child:  SizedBox(
                    child:  Text(
                      "Sign Up",
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
              top: 0.15 * screenHeight,
              left: 0,
              right: 0,
              height: 0.5 * screenHeight,
              child:
              InputTextBox(
                  controller: emailController,
                  topText: "",
                  hintText: "Email",
                  obsText: false),
            ),
            Positioned(
              top: 0.25 * screenHeight,
              left: 0,
              right: 0,
              height: 0.5 * screenHeight,
              child:
              InputTextBox(
                  controller: confirmEmailController,
                  topText: "",
                  hintText: "Confirm Email",
                  obsText: false),
            ),

            Positioned(
              top: 0.38 * screenHeight,
              left: 0,
              right: 0,
              child: InputTextBox(
                  controller: passwordController,
                  topText: "",
                  hintText: "Password",
                  obsText: true),
            ),

            Positioned(
              top: 0.48 * screenHeight,
              left: 0,
              right: 0,
              child: InputTextBox(
                  controller: confirmPasswordController,
                  topText: "",
                  hintText: "Confirm Password",
                  obsText: true),
            ),
            Positioned(
              top: 0.65 * screenHeight,
              left: 0,
              right: 0,
              child: RectangularButton(
                text: "Sign Up",
                backGroundColor: const Color.fromRGBO(102, 152, 173, 1),
                onPressed: () => signUp(emailController, confirmEmailController, passwordController, confirmPasswordController, context)  ,
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
            ),
            Positioned(
              top: 0.615 * screenHeight,
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
          ]
      ),
      backgroundColor: Colors.black,
    );
  }

  String errorMessage = '';

  Future<void> signUp(TextEditingController emailController, TextEditingController confirmEmailController, TextEditingController passwordController, TextEditingController confirmPasswordController, BuildContext context) async {
    if (emailController.text.trim() != confirmEmailController.text.trim()) {
      errorMessage = 'Emails must match';
      return;
    }
    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      errorMessage = 'Passwords must match';
      return;
    }

    firebaseSignUp(emailController,  passwordController, context);
    errorMessage = changeErrorMessage();

    setState(() {}); // update the widget tree with the error message
  }


}

