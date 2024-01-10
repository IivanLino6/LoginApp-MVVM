import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  //Saber si el usuario esta loggeado
  User? get user;

  //Method
  Future<Resource> login({required String email, required String password});
  Future<Resource> register(UserData user);
  Future<void> logout();
}
