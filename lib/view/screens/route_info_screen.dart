import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ruta_buses/models/route_model.dart';

class RouteInfoScreen extends StatefulWidget {
  final RouteModel route;
  const RouteInfoScreen({super.key, required this.route});

  @override
  State<RouteInfoScreen> createState() => _RouteInfoScreenState();
}

class _RouteInfoScreenState extends State<RouteInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(widget.route.name, style: const TextStyle(fontSize: 30),),
            const SizedBox(
              height: 500,
              child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: LatLng(11.240035, -74.200189), zoom: 12), compassEnabled: false, zoomControlsEnabled: false),
            ),
            const Text("tiempo estimado"),
            Text("${widget.route.travelTime} min", style: TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),)
          ],
        )),
      ),
    );
  }
}
