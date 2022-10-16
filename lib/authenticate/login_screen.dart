import 'package:flutter/material.dart';
import 'package:lets_design/authenticate/create_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController =TextEditingController();
  final passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
              alignment: Alignment.centerLeft,
              width: size.width / 1.1,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_ios))),
          SizedBox(
            height: size.height / 50,
          ),
          Container(
            width: size.width / 1.2,
            child: const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: size.width / 1.2,
            child: const Text(
              'Sign in to continue',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.grey),
            ),
          ),
          SizedBox(height: size.height/10,),
          Container(
            width: size.width,
            alignment: Alignment.center,
            child: field(size, 'Email', Icons.account_box,emailController),
          ),
          const SizedBox(height: 10,),
          Container(
            width: size.width,
            alignment: Alignment.center,
            child: field(size, 'Password', Icons.lock,passwordController),
          ),
          SizedBox(height: size.height/10,),

          customButton(size),
          SizedBox(height: size.height/20,),
          GestureDetector(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreateAccount())),
            child:const Text('Create Account?',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
          )
        ],
      ),
    );
  }
  Widget customButton(Size size){
    return Container(
      height: size.height/14,
      width: size.width/1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
      ),
      alignment: Alignment.center,
      child:const Text(
        'login',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );

  }

  Widget field(Size size, String hintText,IconData icon,TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.2,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }
}
