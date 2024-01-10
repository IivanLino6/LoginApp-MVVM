import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Presentation/Utils/validation_item.dart';

class RegisterState {
  ValidationItem email;
  ValidationItem password;
  ValidationItem username;
  ValidationItem validPassword;
  ValidationItem age;
  ValidationItem number;
  //Constructor
  RegisterState(
      {this.email = const ValidationItem(),
      this.password = const ValidationItem(),
      this.username = const ValidationItem(),
      this.validPassword = const ValidationItem(),
      this.age = const ValidationItem(),
      this.number = const ValidationItem()});

  //Check the values en the error
  bool isValid() {
    if (username.value.isEmpty ||
        username.error.isNotEmpty ||
        email.value.isEmpty ||
        email.error.isNotEmpty ||
        password.value.isEmpty ||
        password.error.isNotEmpty ||
        validPassword.value.isEmpty ||
        validPassword.error.isNotEmpty ||
        (password.value != validPassword.value)) {
      return false;
    }
    return true;
  }

  toUser() => UserData(
      email: this.email.value,
      username: this.username.value,
      password: this.password.value,
      phone: this.number.value,
      age: this.age.value);

  getAge() => UserData(age: this.age.value);

  //Asigna el valor de los campos
  RegisterState copyWith(
          {ValidationItem? email,
          ValidationItem? password,
          ValidationItem? username,
          ValidationItem? validPassword,
          ValidationItem? age,
          ValidationItem? number}) =>
      RegisterState(
          email: email ?? this.email,
          password: password ?? this.password,
          username: username ?? this.username,
          validPassword: validPassword ?? this.validPassword,
          age: age?? this.age,
          number: number ?? this.number);
}
