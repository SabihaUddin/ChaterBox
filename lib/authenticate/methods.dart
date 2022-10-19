import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_design/authenticate/login_screen.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    UserCredential userCredential = (await auth.createUserWithEmailAndPassword(
        email: email, password: password));
    if (userCredential != null) {
      debugPrint("Account created Successfully");
      await firestore.collection('users').doc(auth.currentUser?.uid).set({
        "name":name,
        "email":email,
        "status":"unavailable",
      });
      return userCredential.user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> login(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (userCredential != null) {
      debugPrint('Login successfully');
      return userCredential.user;
    } else {
      ('Login failed');
    }
    return userCredential.user;
  } catch (e) {
    print(e);
  }
}

Future Logout(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    debugPrint('error');
  }
}
