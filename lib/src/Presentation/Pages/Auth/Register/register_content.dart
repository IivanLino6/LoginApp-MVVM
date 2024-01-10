import 'package:firebase/src/Presentation/Pages/Auth/Register/register_viewmodel.dart';
import 'package:firebase/src/Presentation/Widgets/TextForm.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterContent extends StatelessWidget {
  RegisterViewModel vm;

  RegisterContent({super.key, required this.vm});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Animation
        SizedBox(
            height: 250,
            width: 250,
            child: Lottie.asset('asset/Lottie/user.json')),
        //Title
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Add User',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        //Name Field
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextCaption(
              onChanged: (name) {
                vm.changeUsername(name);
              },
            )),
        //Age Field
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextCaption(
              txtType: TextInputType.datetime,
              onChanged: (datetime) {
                vm.changeAge(datetime);
              },
            )),
        //Phone Number
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextCaption(
              txtType: TextInputType.number,
              onChanged: (number) {
                vm.changeNumber(number);
              },
            )),
        //Email Field
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextCaption(
              onChanged: (email) {
                vm.changeEmail(email);
              },
              txtType: TextInputType.emailAddress,
            )),
        //Password
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextCaption(
              onChanged: (password) {
                vm.changePassword(password);
              },
              txtType: TextInputType.visiblePassword,
            )),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextCaption(
              onChanged: (confirmPassword) {
                vm.changeValidPassword(confirmPassword);
              },
              txtType: TextInputType.visiblePassword,
            )),
        //Register user button
        TextButton.icon(
          onPressed: () {
            vm.register();
          },
          icon: const Icon(Icons.check_sharp, color: Colors.white),
          label: const Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        )
      ],
    );
  }
}
