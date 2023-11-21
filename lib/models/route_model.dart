import 'package:ruta_buses/models/coordinate_model.dart';

class RouteModel {
  String name;
  String imageUrl;
  int travelTime;
  List<Coordinate> coordinates;

  RouteModel(
      {required this.name,
      required this.imageUrl,
      required this.travelTime,
      required this.coordinates});
}
