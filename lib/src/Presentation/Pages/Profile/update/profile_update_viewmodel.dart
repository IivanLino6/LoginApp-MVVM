import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/UseCases/Users/users_usercase.dart';
import 'package:firebase/src/Presentation/Pages/Profile/update/widgets/profile_update_state.dart';
import 'package:firebase/src/Presentation/Utils/validation_item.dart';
import 'package:flutter/material.dart';

class ProfileUpdateViewModel extends ChangeNotifier {
  UserUseCase _userUseCase;

  ProfileUpdateState _state = ProfileUpdateState();
  ProfileUpdateState get state => _state;

  ProfileUpdateViewModel(this._userUseCase);

  changeUsername(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(username: ValidationItem(value: value));
    } else {
      _state = _state.copyWith(
          username: ValidationItem(error: 'At least 3 caracters'));
    }
    notifyListeners();
  }

  loadData(UserData userData) {
    _state = _state.copyWith(
        id: ValidationItem(value: userData.id),
        username: ValidationItem(value: userData.username),
        image: ValidationItem(value: userData.image));
    notifyListeners();
  }
}
