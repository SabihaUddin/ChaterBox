import 'package:flutter/material.dart';
import 'package:lets_design/authenticate/login_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final nameController =TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: size.width / 1.1,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))),
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
                'Create account to continue!',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, 'Name', Icons.person,nameController),
            ),
           const  SizedBox(
              height:10,
            ),
            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, 'Email', Icons.account_box,emailController),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, 'Password', Icons.lock,passwordController),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            customButton(size),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const LoginScreen())),
              child:const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Login',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color:Colors.blue,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: const Text(
          'Create Account',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget field(Size size, String hintText, IconData icon,TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.2,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
