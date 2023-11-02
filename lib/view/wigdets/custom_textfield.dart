import 'package:flutter/material.dart';


class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextfield(this.labelText, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: labelText),
      controller: controller,
    );
  }
}

class CustomPasswordTextField extends CustomTextfield {
  const CustomPasswordTextField(super.labelText, super.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: labelText),
      obscureText: true,
      controller: controller,
    );
  }
}
