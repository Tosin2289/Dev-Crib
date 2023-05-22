import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0,
        title: const Text(
          "Profile Page",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/pro.png",
            height: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue[800]),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              "My Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
          MyTextBox(
            sectionName: 'User Bio',
            text: "Pablo Gavi",
          )
        ],
      ),
    );
  }
}
