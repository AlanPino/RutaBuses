import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String text;

  const CustomButton({super.key, required this.function, required this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () => function() , child: Text(text));
  }
}
