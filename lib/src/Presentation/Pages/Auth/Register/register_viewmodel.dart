import 'package:firebase/src/Domain/UseCases/Auth/auth_usecase.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Register/register_state.dart';
import 'package:firebase/src/Presentation/Utils/validation_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel extends ChangeNotifier {
  //State
  RegisterState _state = RegisterState();
  //Getter
  RegisterState get state => _state;

  Resource _response = Init();
  Resource get response => _response;
  //UseCase
  AuthUseCases _authUseCases;
  RegisterViewModel(this._authUseCases);

  //Setter

  register() async {
    if (_state.isValid()) {
      //Initial State
      _response = Loading();
      notifyListeners();
      //Register State
      _response = await _authUseCases.register.launch(_state.toUser());
      notifyListeners();
      print('Form Values: ${_state}');
    } else {
      print('Error en el formulario');
    }
  }

  changeUsername(String value) {
    _state = _state.copyWith(username: ValidationItem(value: value));
    notifyListeners();
  }

  changeEmail(String value) {
    if (value.contains('@')) {
      _state = _state.copyWith(email: ValidationItem(value: value));
    } else {
      _state =
          _state.copyWith(email: ValidationItem(error: 'Is not a valid email'));
    }
    notifyListeners();
  }

  changePassword(String value) {
    _state = _state.copyWith(password: ValidationItem(value: value));
    notifyListeners();
  }

  changeValidPassword(String value) {
    _state = _state.copyWith(validPassword: ValidationItem(value: value));
    notifyListeners();
  }

  changeAge(String value) {
    //Convert the birthay and get the age
    
    _state = _state.copyWith(age: ValidationItem(value: value));
    notifyListeners();
  }

  changeNumber(String value) {
    _state = _state.copyWith(number: ValidationItem(value: value));
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }
}
