import 'package:firebase/src/Presentation/Pages/Auth/Login/LoginViewModel.dart';
import 'package:flutter/material.dart';

class RoundBtn extends StatelessWidget {
  const RoundBtn({
    super.key,
    required this.vm,
  });

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        vm.login();
      },
      icon: const Icon(Icons.check_sharp, color: Colors.white),
      label: const Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blue)),
    );
  }
}