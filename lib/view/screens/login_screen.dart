import 'package:flutter/material.dart';
import 'package:ruta_buses/services/auth_service.dart';
import 'package:ruta_buses/view/wigdets/custom_button.dart';
import 'package:ruta_buses/view/wigdets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.account_circle,
                size: 200,
                color: Theme.of(context).primaryColor,
              ),
              CustomTextfield("Correo electronico", email),
              CustomPasswordTextField("Contraseña", password),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "olvidé mi contraseña",
                        style: TextStyle(fontSize: 10),
                      )),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(_error, style: const TextStyle(color: Colors.red)),
              CustomButton(function: login, text: "iniciar sesión"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/signup");
                },
                child: const Text(
                  "registrarse",
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/main");
                  },
                  child: const Text("continuar sin cuenta",
                      style: TextStyle(fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }

  login() async{
    AuthService().loginUser(email.text, password.text).then((map) {
      if (map["success"]) {
        Navigator.pushReplacementNamed(context, "/main");
      } else {
        setState(() {
          _error = "Invalid credentials";
        });
      }
    });
  }
}
