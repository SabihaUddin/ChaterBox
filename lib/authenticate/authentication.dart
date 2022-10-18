import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_design/authenticate/login_screen.dart';
import 'package:lets_design/pages/home_page.dart';

class Authentication extends StatelessWidget {
  final FirebaseAuth auth=FirebaseAuth.instance;

   Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(auth.currentUser!=null){
      return const HomePage();
    }else{
      return const LoginScreen();
    }
  }
}
