import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/pages/user-screen.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:myapp/views/widgets/inputTextBoxWidget.dart';
import 'package:myapp/views/widgets/rectangularButtonWidget.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController passwordAtualController = TextEditingController();
  final TextEditingController passwordNovaController = TextEditingController();
  final TextEditingController confirmarPasswordNovaController = TextEditingController();

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(screenHeight: screenHeight),
          Positioned(
            top: screenHeight * 0.08,
            left: 0,
            right: 0,
            child: Text(
              'Alterar password:',
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
              top: screenHeight * 0.15,
              left: 0,
              right: 0,
              child: InputTextBox(
                  controller: passwordAtualController,
                  topText: 'Password atual',
                  hintText: '',
                obsText: true,)),
          Positioned(
              top: screenHeight * 0.35,
              left: 0,
              right: 0,
              child: InputTextBox(
                  controller: passwordNovaController,
                  topText: 'Password nova',
                  hintText: '',
                  obsText: true,)),
          Positioned(
              top: screenHeight * 0.55,
              left: 0,
              right: 0,
              child: InputTextBox(
                  controller: confirmarPasswordNovaController,
                  topText: 'Confirmar password nova',
                  hintText: '',
                obsText: true,)),
          Positioned(
            top: screenHeight * 0.8,
            left: 0,
            right: 0,
            child: RectangularButton(
                text: 'Alterar password',
                onPressed: () =>changePassword(context),
                horizontalMargin: screenWidth * 0.18,
                backGroundColor: const Color.fromRGBO(102, 152, 173, 1)),
          ),
          Positioned(
            top: screenHeight * 0.9,
            left: 0,
            right: 0,
            child: RectangularButton(
                text: 'Cancelar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserScreen()),
                  );
                },
                horizontalMargin: screenWidth * 0.18,
                backGroundColor: const Color.fromRGBO(173, 102, 102, 1)),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
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
}
