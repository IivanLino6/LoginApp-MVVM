import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/UseCases/Auth/auth_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Users/users_usercase.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  UserUseCase _userUseCase;
  AuthUseCases _authUseCases;

  ProfileViewModel(this._userUseCase, this._authUseCases){
    getUserByID();
  }

  Stream<Resource<UserData>> getUserByID() {
    final id = _authUseCases.getUser.userSession?.uid ?? '';
    return _userUseCase.getByID.launch(id);
  }
}