//Services dependencies
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/D_I/firebase_service.dart';
import 'package:firebase/src/Data/Repository/auth_repository_implement.dart';
import 'package:firebase/src/Data/Repository/user_repository_impl.dart';
import 'package:firebase/src/Domain/Repository/auth_repository.dart';
import 'package:firebase/src/Domain/Repository/user_repository.dart';
import 'package:firebase/src/Domain/UseCases/Auth/auth_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Auth/login_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Auth/logout_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Auth/register_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Auth/user_session_usecase.dart';
import 'package:firebase/src/Domain/UseCases/Users/users_usercase.dart';
import 'package:firebase/src/Domain/UseCases/users/get_userbyId_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

//Everytime yo add a new injectable you need execute:
//flutter packages pub run build_runner build

@module
abstract class AppModule {
  //Services init
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  //Firebase Auth
  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  //Firebase Cloud
  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  //Colection Reference
  @injectable
  CollectionReference get usersCollection =>
      firebaseFirestore.collection("Users");
 
  @Environment('Repositories')
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(firebaseAuth, usersCollection);
  
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(
        authRepository,
      ),
      getUser: UserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository));
  
  @Environment('repositories')
  @injectable
  UserRepository get userRepository => UserRepositoryImpl(usersCollection);

  @Environment('use_cases')
  @injectable
  UserUseCase get userUseCase =>
      UserUseCase(getByID: GetUserbyID(userRepository));
}

