import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/Repository/user_repository.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:injectable/injectable.dart';

//@Injectable()
class GetUserByID {
  UserRepository _repository;
  GetUserByID(this._repository);

  Stream<Resource<UserData>> launch(String id) => _repository.getUserByID(id);
}
