import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;

  const CustomTextfield(this.labelText, this.controller, {super.key });

  @override
  Widget build(BuildContext context){
    return TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: labelText),
                    controller: controller,
              );
  }
}