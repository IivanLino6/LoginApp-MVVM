import 'package:firebase/src/Domain/UseCases/Auth/auth_usecase.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:firebase/src/Presentation/Utils/validation_item.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Login/loginState.dart';
import 'package:flutter/material.dart';

//Mediante el provider permite mandar los datos a la vista
class LoginViewModel extends ChangeNotifier {
  //States
  LoginState _state = LoginState();
  Resource _response = Init();

  //Getter
  LoginState get state => _state;
  Resource get response => _response;

  //UseCases
  AuthUseCases _authUseCases;

  //Contructor
  LoginViewModel(this._authUseCases) {
    final user = this._authUseCases.getUser.userSession;
    if (user != null) {
      //El usuario ya esta logeado
      _response = Success(user);
    }
    print('User Session: ${this._authUseCases.getUser.userSession}');
  }

  //Setter
  void changeEmail(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(email: ValidationItem(value: value));
    } else {
      _state = _state.copyWith(
          email: const ValidationItem(error: 'Al menos 3 caaracteres'));
    }
    //Notifica al provider del cambio
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6) {
      _state = _state.copyWith(password: ValidationItem(value: value));
    } else {
      _state = _state.copyWith(
          password: const ValidationItem(error: 'Al menos 6 caracteres'));
    }
    //Notifica al provider del cambio
    notifyListeners();
  }

  void login() async {
    if (_state.isValid()) {
      //Esperando la respuesta
      _response = Loading();
      notifyListeners();
      _response = await _authUseCases.login
          .launch(email: _state.email.value, password: _state.password.value);
      notifyListeners();
      print('Data ${_response}');
    } else {
      print('Formulario no valido');
    }
  }

  //Resetea la variable reponse despues del error
  resetResponse() {
    _response = Init();
    notifyListeners();
  }
}
