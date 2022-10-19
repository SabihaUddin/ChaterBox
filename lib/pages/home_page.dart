import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_design/authenticate/login_screen.dart';
import 'package:lets_design/authenticate/methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final searEmailController = TextEditingController();

  void onSearch() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await firestore
        .collection('users')
        .where('email', isEqualTo: searEmailController.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () => Logout(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: isLoading
          ? Center(
              child: Container(
              height: size.height / 20,
              width: size.height / 20,
              child: const CircularProgressIndicator(),
            ))
          : Column(children: [
              SizedBox(
                height: size.height / 20,
              ),
              Container(
                height: size.height / 14,
                width: size.width,
                alignment: Alignment.center,
                child: Container(
                  height: size.height / 14,
                  width: size.width / 1.15,
                  child: TextField(
                    controller: searEmailController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              ElevatedButton(
                onPressed: onSearch,
                child: Text("Search"),
              ),
              userMap != null
                  ? ListTile(
                      onTap: () {},
                      leading:
                          const Icon(Icons.account_box, color: Colors.black),
                      title: Text(
                        userMap!['name'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(userMap!['email']),
                trailing: const Icon(Icons.chat, color: Colors.black),
                    )
                  : Container()
            ]),
    );
  }
}
