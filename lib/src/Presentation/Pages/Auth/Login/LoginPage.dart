import 'package:firebase/src/Presentation/Pages/Auth/Login/LoginViewModel.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Login/login_response.dart';
import 'package:firebase/src/Presentation/Widgets/RoundBtn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase/src/Presentation/Widgets/TextForm.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Intancia del provider
    LoginViewModel vm = Provider.of<LoginViewModel>(context);

    //Este widget funciona para que no falla la app al cambiar de pantalla mientras esta el error
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {LoginResponse(context, vm);},
    );

    return Scaffold(
        body: Column(
      children: [
        //Title Welcome
        const Align(
          alignment: Alignment.centerLeft,
          child:
              //Title
              Padding(
            padding: EdgeInsets.only(top: 100, left: 20),
            child: Text(
              'Welcome',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                'To Firebase App',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            )),
        //Animation
        Center(
            child:
                //Lottie
                SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset('asset/Lottie/user.json'))),
        //Email Field
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextCaption(
              onChanged: (value) {
                //Manda llamar el metodo para guardar el email.
                vm.changeEmail(value);
              },
              txtType: TextInputType.emailAddress),
        ),
        //Password field
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextCaption(
              onChanged: (value) {
                //mandar llamar el metodo para guardar el passw
                vm.changePassword(value);
              },
              txtType: TextInputType.visiblePassword),
        ),
        //Sign in Button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: 140,
            child: RoundBtn(vm: vm),
          ),
        ),
        //Create an account text
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'Register');
            },
            child: Text(
              'Create an account',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[500],
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey[500]),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //Singup Text
        const Text(
          'Sign In with:',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        //SingUp Buttons
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Esquinas redondeadas
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'asset/google.png',
                          fit: BoxFit.cover,
                          width: 22,
                          height: 22,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Esquinas redondeadas
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'asset/apple.png',
                          fit: BoxFit.cover,
                          width: 22,
                          height: 22,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        //Powered by:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Powered By Firebase',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[350])),
            SizedBox(height: 20, child: Image.asset('asset/firebase.png'))
          ],
        )
      ],
    ));
  }
}
