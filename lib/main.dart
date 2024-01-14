import 'package:firebase/firebase_options.dart';
import 'package:firebase/injection.dart';
import 'package:firebase/src/Domain/UsesCases/Auth/auth_usecase.dart';
import 'package:firebase/src/Domain/UsesCases/users/users_usercase.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Login/LoginViewModel.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Register/RegisterPage.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Register/register_viewmodel.dart';
import 'package:firebase/src/Presentation/Pages/Home/home_page.dart';
import 'package:firebase/src/Presentation/Pages/Home/home_viewmodel.dart';
import 'package:firebase/src/Presentation/Pages/Profile/Widgets/profile_viewmodel.dart';
import 'package:firebase/src/Presentation/Pages/firebaseScreen.dart';
import 'package:firebase/src/Presentation/Pages/Auth/Login/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //Initialize Firebase services
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => RegisterViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => HomeViewModel(locator<AuthUseCases>())),
         ChangeNotifierProvider(create: (context) => ProfileViewModel(locator<UserUseCase>(),locator<AuthUseCases>()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          initialRoute: 'login',
          routes: {
            'FirebasePage': (BuildContext context) => const MyHomePage(),
            'login': (BuildContext context) => const LoginPage(),
            'Register': (BuildContext context) => const RegisterPage(),
            'Home': (BuildContext context) => const HomePage(),
          }),
    );
  }
}
