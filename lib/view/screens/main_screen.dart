import 'package:flutter/material.dart';
import 'package:ruta_buses/services/auth_service.dart';
import 'package:ruta_buses/view/screens/buses_screen.dart';
import 'package:ruta_buses/view/screens/map_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _screens = [MapScreen(), BusesScreen()];
  int _screenSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final bool isLoggedIn = AuthService().checkUserLoggedIn();

                if (isLoggedIn) {
                  Navigator.pushNamed(context, "/profile");
                } else {
                  Navigator.pushNamed(context, "/");
                }
              },
              icon: Icon(
                Icons.account_circle,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: _screens[_screenSelected]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _screenSelected = value;
          });
        },
        currentIndex: _screenSelected,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.route_sharp), label: "generar ruta"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus), label: "ver tablillas")
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
