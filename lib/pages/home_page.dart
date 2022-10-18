import 'package:flutter/material.dart';
import 'package:lets_design/authenticate/login_screen.dart';
import 'package:lets_design/authenticate/methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: TextButton(
          onPressed: ()=>Logout(context),
          child: Text('logout'),
        ),
      ),
    );
  }
}
