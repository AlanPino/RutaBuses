import 'package:flutter/material.dart';
import 'package:ruta_buses/view/wigdets/custom_button.dart';
import 'package:ruta_buses/view/wigdets/custom_textfield.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final TextEditingController _origin = TextEditingController();
  final TextEditingController _goal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextfield("dirección de origen", _origin),
        CustomTextfield("dirección destino", _goal),
        SizedBox(
          height: 300,
          child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/A_large_blank_world_map_with_oceans_marked_in_blue.svg/1200px-A_large_blank_world_map_with_oceans_marked_in_blue.svg.png", fit: BoxFit.cover),
        ),
        CustomButton(function: () => {}, text: "buscar ruta")
      ],
    );
  }
}
