import 'package:flutter/material.dart';
import 'package:ruta_buses/models/user_model.dart';
import 'package:ruta_buses/services/auth_service.dart';
import 'package:ruta_buses/view/wigdets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController name = TextEditingController();

  final TextEditingController birthDate = TextEditingController();

  final TextEditingController phoneNumber = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController passwordConfirm = TextEditingController();

  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextfield("Nombre", name),
            CustomTextfield("Fecha de nacimiento", birthDate),
            CustomTextfield("Número de celular", phoneNumber),
            CustomTextfield("Correo electrónico", email),
            CustomTextfield("Contraseña", password),
            CustomTextfield("Confirmar contraseña", passwordConfirm),
            const Row(
              children: [
                Checkbox(value: true, onChanged: null),
                Text("acepto los terminos y condiciones")
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  UserModel user = UserModel(
                      name: name.text,
                      birthDate: birthDate.text,
                      phoneNumber: phoneNumber.text,
                      email: email.text);

                  AuthService().registerUser(user, password.text).then((map) {
                    if (map["success"]) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        _error = map["error"].toString();
                      });
                    }
                  });
                },
                child: const Text("Registrarse")),
            Text(
              _error,
              style: const TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
