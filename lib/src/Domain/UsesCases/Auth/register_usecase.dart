import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/Repository/auth_repository.dart';
import 'package:injectable/injectable.dart';


class RegisterUseCase {
  AuthRepository _repository;

  //Contructor
  RegisterUseCase(this._repository);

  //Method
  launch(UserData user) => _repository.register(user);
}
