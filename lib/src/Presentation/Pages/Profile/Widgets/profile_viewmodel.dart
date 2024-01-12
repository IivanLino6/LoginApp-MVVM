import 'package:firebase/src/Domain/UsesCases/Auth/auth_usecase.dart';
import 'package:firebase/src/Domain/UsesCases/Users/users_usercase.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  UserUseCase _userUseCase;
  AuthUseCases _authUseCases;

  ProfileViewModel(this._userUseCase, this._authUseCases);

  getUserByID() {
    final id = _authUseCases.getUser.userSession?.uid;
    _userUseCase.getByID.launch(id).listen((Resource<UserData) { });
  }
}
