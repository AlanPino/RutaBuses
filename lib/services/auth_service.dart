import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruta_buses/models/user_model.dart';
import 'package:ruta_buses/services/database_service.dart';

class AuthService {
  final auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> registerUser(
      UserModel user, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: password);
      DatabaseService().registerUser(user);
      return {"success": true};
    } on FirebaseAuthException catch (e) {
      return {"error": e.message, "success": false};
    }
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return {"success": true};
    } on FirebaseAuthException catch (e) {
      return {"error": e.message, "success": false};
    }
  }
}
