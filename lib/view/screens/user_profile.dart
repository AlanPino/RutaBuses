import 'package:flutter/material.dart';
import 'package:ruta_buses/models/user_model.dart';
import 'package:ruta_buses/services/auth_service.dart';
import 'package:ruta_buses/view/wigdets/custom_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<UserModel> user;

  @override
  void initState() {
    super.initState();
    user = AuthService().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ))
          ],
        ),
        body: FutureBuilder(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 200,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          snapshot.data!.name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "informacion personal",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("correo electrónico:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.email),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("fecha de nacimiento:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.birthDate),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("numero de celular",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.phoneNumber),
                        const SizedBox(
                          height: 60,
                        ),
                        CustomButton(function: logout, text: "cerrar sesión")
                      ],
                    ),
                  ),
                );
              }
            }));
  }

  logout() async {
    AuthService().logoutUser();
    Navigator.pop(context);
  }
}
