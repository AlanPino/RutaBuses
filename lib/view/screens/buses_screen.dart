import 'package:flutter/material.dart';
import 'package:ruta_buses/models/route_model.dart';
import 'package:ruta_buses/services/api_service.dart';
import 'package:ruta_buses/view/screens/route_info_screen.dart';

class BusesScreen extends StatefulWidget {
  BusesScreen({super.key});

  @override
  State<BusesScreen> createState() => _BusesScreenState();
}

class _BusesScreenState extends State<BusesScreen> {
  late Future<List<RouteModel>> routes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    routes = ApiService().getRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: routes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RouteInfoScreen(
                                  route: snapshot.data![index])));
                    },
                    child: Card(
                      child: Image.network(snapshot.data![index].imageUrl),
                    ));
              },
            );
          }
        });

    /*;*/
  }
}
