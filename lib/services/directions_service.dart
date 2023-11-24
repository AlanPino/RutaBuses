import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/directions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

class DirectionProvider {
  GoogleMapsDirections directions =
      GoogleMapsDirections(apiKey: Platform.environment["API-KEY"]);

  Future<maps.Polyline> findDirections(maps.LatLng origin, maps.LatLng goal) async {
    final Location start = Location(lat: origin.latitude, lng: origin.longitude);
    final Location end = Location(lat: goal.latitude, lng: goal.longitude);

    var result = await directions.directionsWithLocation(start, end);

    var route = result.routes[0];
    List<maps.LatLng> points = [];

    for (var step in route.legs[0].steps) {
      points.add(maps.LatLng(step.startLocation.lat, step.startLocation.lng));
      points.add(maps.LatLng(step.endLocation.lat, step.endLocation.lng));
    }

    maps.Polyline line = maps.Polyline(
      points: points,
      polylineId: const maps.PolylineId("bestRoute"),
      color: Colors.red, 
      width: 3
    );

    return line;
  }
}
