import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/Repository/user_repository.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

//@Injectable(as:UserRepository )
class UserRepositoryImpl implements UserRepository {
  CollectionReference _userRef;

  UserRepositoryImpl(this._userRef);

  @override
  Stream<Resource<UserData>> getUserByID(String id) {
    try {
      final data = _userRef.doc(id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map((doc) =>
          Success(UserData.fromJson(doc.data() as Map<String, dynamic>)));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Unknow Error');
    }
  }
}
