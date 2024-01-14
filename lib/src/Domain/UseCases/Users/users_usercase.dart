import 'package:firebase/src/Domain/UseCases/users/get_userbyId_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

//@Injectable()
class UserUseCase {
  GetUserByID getByID;

  UserUseCase({ required this.getByID});
}
