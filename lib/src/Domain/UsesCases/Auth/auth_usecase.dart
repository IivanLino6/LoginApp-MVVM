import 'package:firebase/src/Domain/UsesCases/Auth/login_usecase.dart';
import 'package:firebase/src/Domain/UsesCases/Auth/logout_usecase.dart';
import 'package:firebase/src/Domain/UsesCases/Auth/register_usecase.dart';
import 'package:firebase/src/Domain/UsesCases/Auth/user_session_usecase.dart';
import 'package:injectable/injectable.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  UserSessionUseCase getUser;
  LogoutUseCase logout;

  AuthUseCases(
      {required this.login, required this.register, required this.getUser, required this.logout});
}
