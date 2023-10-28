import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruta_buses/models/user_model.dart';

class DatabaseService {
  final db = FirebaseFirestore.instance;

  registerUser(UserModel user) async {
    await db.collection("Users").doc(user.email).set({
      "name": user.name,
      "birthDate": user.birthDate,
      "phoneNumber": user.phoneNumber,
      "email": user.email
    });
  }
}
