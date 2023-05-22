import 'package:flutter/material.dart';

import 'autenticate/auth.dart';

class splash extends StatefulWidget {
  splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return AuthPage();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/dev.png',
                  height: 200,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Made By Phenomes",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
