import 'package:firebase/src/Domain/Repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

class LoginUseCase {
  AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  launch({required String email, required String password}) =>
      _authRepository.login(email: email, password: password);
}
