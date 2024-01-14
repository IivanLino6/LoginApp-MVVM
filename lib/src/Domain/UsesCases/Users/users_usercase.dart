import 'package:firebase/src/Domain/UsesCases/users/get_userbyId_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

//@Injectable()
class UserUseCase {
  GetUserbyID getByID;

  UserUseCase({ required this.getByID});
}
