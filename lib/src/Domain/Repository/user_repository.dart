import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';

abstract class UserRepository {
  Stream<Resource<UserData>> getUserByID(String id);
}
