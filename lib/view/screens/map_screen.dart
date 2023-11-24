import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ruta_buses/directions_provider.dart';
import 'package:ruta_buses/view/wigdets/custom_button.dart';
import 'package:ruta_buses/view/wigdets/custom_textfield.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController _origin = TextEditingController();
  final TextEditingController _goal = TextEditingController();

  late LatLng origin;
  late LatLng goal;

  Set<Marker> markers = {};
  Set<Polyline> polyline = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextfield("dirección de origen", _origin),
        CustomTextfield("dirección destino", _goal),
        SizedBox(
          height: 300,
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
                target: LatLng(11.240035, -74.200189), zoom: 12),
            compassEnabled: false,
            zoomControlsEnabled: false,
            onTap: (point) {
              setState(() {
                setPoints(point);
              });
            },
            markers: markers,
            polylines: polyline,
          ),
        ),
        CustomButton(function: () => {}, text: "buscar ruta")
      ],
    );
  }

  void setPoints(LatLng point) {
    final coordinate = "(${point.latitude},${point.longitude})";
    if (_origin.text.isEmpty) {
      _createMarker(point, "origin");
      _origin.text = coordinate;
      origin = point;
    } else {
      _createMarker(point, "goal");
      _goal.text = coordinate;
      goal = point;
      createPolyline();
    }
  }

  void createPolyline() async{
    polyline.add(await DirectionProvider().findDirections(origin, goal));
  }

  void _createMarker(LatLng point, String id) {
    markers.add(Marker(markerId: MarkerId(id), position: point));
  }
}
