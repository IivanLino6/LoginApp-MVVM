import 'package:firebase/src/Domain/UseCases/Auth/login_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Auth/logout_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Auth/register_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Auth/user_session_usecase.dart';
import 'package:injectable/injectable.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  UserSessionUseCase getUser;
  LogoutUseCase logout;

  AuthUseCases(
      {required this.login, required this.register, required this.getUser, required this.logout});
}
