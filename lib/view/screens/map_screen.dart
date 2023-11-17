import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
        const SizedBox(
          height: 300,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(11.240035, -74.200189), zoom: 12),
            compassEnabled: false,
            zoomControlsEnabled: false,
          ),
        ),
        CustomButton(function: () => {}, text: "buscar ruta")
      ],
    );
  }
}
