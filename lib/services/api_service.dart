import 'dart:convert';

import 'package:ruta_buses/models/coordinate_model.dart';
import 'package:http/http.dart' as http;
import 'package:ruta_buses/models/route_model.dart';

class ApiService {
  Future<List<RouteModel>> getRoutes() async {
    List<RouteModel> routes = [];

    final response = await http.get(
        Uri.parse("https://rutas-buses-api.onrender.com/api/routes/findAll"));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var route in jsonData) {
        List<Coordinate> coordinates = [];
        for (var coordinate in route["coordinates"]) {
          coordinates.add(Coordinate(
              latitude: coordinate["latitude"],
              longitude: coordinate["longitude"]));
        }
        routes.add(RouteModel(
            name: route["name"],
            imageUrl: route["imageUrl"],
            travelTime: route["travelTime"],
            coordinates: coordinates));
      }
    }
    return routes;
  }
}
