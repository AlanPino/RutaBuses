import 'package:flutter/material.dart';
import 'package:ruta_buses/services/auth_service.dart';
import 'package:ruta_buses/view/screens/signup_screen.dart';
import 'package:ruta_buses/view/wigdets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.account_circle,
                size: 200,
                color: Colors.blue,
              ),
              CustomTextfield("Correo electronico", email),
              CustomTextfield("Contraseña", password),
              const Text(
                "olvidé mi contraseña",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.blue, fontSize: 10),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    AuthService().loginUser(email.text, password.text);
                  },
                  child: const Text("iniciar sesión")),
              TextButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => SignupScreen());

                  Navigator.push(context, route);
                },
                child: const Text("registrarse",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "continuar sin cuenta",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.blue, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
