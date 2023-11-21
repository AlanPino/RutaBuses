import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ruta_buses/firebase_options.dart';
import 'package:ruta_buses/services/auth_service.dart';
import 'package:ruta_buses/view/screens/login_screen.dart';
import 'package:ruta_buses/view/screens/main_screen.dart';
import 'package:ruta_buses/view/screens/route_info_screen.dart';
import 'package:ruta_buses/view/screens/signup_screen.dart';
import 'package:ruta_buses/view/screens/user_profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _routes = {
    "/": (context) => const LoginScreen(),
    "/signup": (context) => const SignupScreen(),
    "/main": (context) => const MainScreen(),
    "/profile": (context) => const UserProfile()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      initialRoute: AuthService().checkUserLoggedIn() ? "/main" : "/",
      routes: _routes,
    );
  }
}
