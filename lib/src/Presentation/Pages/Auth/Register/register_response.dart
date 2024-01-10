import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Register/register_viewmodel.dart';
import 'package:firebase/src/Presentation/Utils/show_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterResponse {
  RegisterViewModel vm;
  BuildContext context;

 //Constructor
  RegisterResponse(this.context, this.vm) {
    if (vm.response is Loading) {
      buildShowDialog(context);
    } else if (vm.response is Error) {
      final data = vm.response as Error;
      Navigator.pop(context,true);
      Fluttertoast.showToast(
        msg: data.error,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.BOTTOM,
      );
      vm.resetResponse();
    } else if (vm.response is Success) {
      Navigator.pop(context);
      //Manda llamar la pantalla y borra todo el historial de pantallas
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    }
  }
}
