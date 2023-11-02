import 'package:flutter/material.dart';

class BusesScreen extends StatelessWidget {
  BusesScreen({super.key});

  final List<String> imgs =
      List.filled(20, "https://pbs.twimg.com/media/DZrXVXCX4AEzotW.jpg", );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Card(
          child: Image.network(imgs[index]),
        );
      },
      itemCount: imgs.length,
    );
  }
}
