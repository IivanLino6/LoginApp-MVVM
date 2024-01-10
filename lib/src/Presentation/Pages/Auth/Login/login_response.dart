import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Login/LoginViewModel.dart';
import 'package:firebase/src/Presentation/Utils/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Mandamos llamar la clase LoginViewModel para tener acceso a los States
//Pasamos el build context

class LoginResponse {
  LoginViewModel vm;
  BuildContext context;

  //Constructor
  LoginResponse(this.context, this.vm) {
    if (vm.response is Loading) {
      buildShowDialog(context);
    } else if (vm.response is Error) {
      final data = vm.response as Error;
      Navigator.pop(context,true);
      Fluttertoast.showToast(
        msg: 'Invalid User',
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.BOTTOM,
      );
      vm.resetResponse();
    } else if (vm.response is Success) {
      vm.resetResponse();
      Navigator.pop(context);
      //Manda llamar la pantalla y borra todo el historial de pantallas
      Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
    }
  }
}
