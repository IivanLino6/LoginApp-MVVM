import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:injectable/injectable.dart';

abstract class UsersRepository {
  Stream<Resource<UserData>> getUserID(String id) {}
}
