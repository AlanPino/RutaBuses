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

  Future<UserModel> getUser(String email) async {
    Map<String, dynamic> data = {};
    await db.collection("Users").doc(email).get().then((DocumentSnapshot doc){
      data = doc.data() as Map<String, dynamic>;

    });
    return UserModel(name: data["name"], birthDate: data["birthDate"], phoneNumber: data["phoneNumber"], email: email);
  }
}
