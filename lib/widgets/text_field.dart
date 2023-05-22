import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MytextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscuringCharacter: '•',
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          hintText: hintText,
          fillColor: Colors.grey[200],
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true),
    );
  }
}
