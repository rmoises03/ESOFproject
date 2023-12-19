import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import '../views/pages/map-screen.dart';

String errorMessage = '';

Future<void> firebaseSignIn(TextEditingController emailController, TextEditingController passwordController, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );
    errorMessage = "";
    changeErrorMessage();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      errorMessage = 'User not found';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'Password is incorrect.';
    }
  }
  changeErrorMessage();
}

Future<void> firebaseSignUp(TextEditingController emailController, TextEditingController passwordController, BuildContext context) async {

  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    ).then((value) {
      FirebaseFirestore.instance.collection("users").doc(value.user?.uid).set(
          {'java': false,
          'javascript': false,
            'python': false,
            'remote': false,
            'sql': false});
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      errorMessage = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      errorMessage = 'An account already exists for that email.';
    }
  } catch (e) {
    errorMessage = 'Invalid inputs';
  }
  changeErrorMessage();

}

Future<Map<String, dynamic>?> readUserInfo(String? userId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot snapshot = await firestore.collection('users').doc(userId).get();

  if (snapshot.exists) {
    return snapshot.data() as Map<String, dynamic>;
  } else {
    return null; // User document does not exist
  }
}

void fetchUserInfo(String userId) async {
  Map<String, dynamic>? userInfo = await readUserInfo(userId);

  if (userInfo != null) {
    bool java = userInfo['java'];
    bool javascript = userInfo['javascript'];
    bool python = userInfo['python'];
    bool sql = userInfo['sql'];
    bool remote = userInfo['remote'];
  } else {
    print('User information not found');
  }
}


String changeErrorMessage() {
  return errorMessage;
}

