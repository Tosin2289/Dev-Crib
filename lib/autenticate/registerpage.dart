import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Let's create an account for you",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MytextField(
                    controller: namecontroller,
                    hintText: 'Name',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MytextField(
                    controller: emailcontroller,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MytextField(
                    controller: passwordcontroller,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MytextField(
                    controller: confirmpasswordcontroller,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    onTap: () {},
                    text: 'Sign up',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
