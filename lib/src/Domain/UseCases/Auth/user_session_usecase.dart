import 'package:firebase/src/Domain/Repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSessionUseCase {
  AuthRepository _repository;
  UserSessionUseCase(this._repository);

  //Getter
  User? get userSession => this._repository.user;
}
