import 'package:firebase/src/Presentation/Utils/validation_item.dart';

class LoginState {
  ValidationItem email;
  ValidationItem password;

  //Contructor
  LoginState(
      {this.email = const ValidationItem(),
      this.password = const ValidationItem()});

  //Method
  //Asigna el valor de email y password
  LoginState copyWith({ValidationItem? email, ValidationItem? password}) =>
      LoginState(
          email: email ?? this.email, 
          password: password ?? this.password);

  bool isValid() {
    if (email.value.isNotEmpty && password.value.isNotEmpty && email.value.contains('@')) {
      return true;
    } else {
      return false;
    }
  }
}

