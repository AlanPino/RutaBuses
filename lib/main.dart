import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ruta_buses/firebase_options.dart';
import 'package:ruta_buses/view/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(useMaterial3: false, colorSchemeSeed: Colors.blue),
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
