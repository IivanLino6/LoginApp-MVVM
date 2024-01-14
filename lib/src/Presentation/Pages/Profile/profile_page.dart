import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Domain/Utils/resources.dart';
import 'package:firebase/src/Presentation/Pages/Profile/Widgets/profile_content.dart';
import 'package:firebase/src/Presentation/Pages/Profile/Widgets/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileViewModel vm = Provider.of<ProfileViewModel>(context);

    return Scaffold(
        //body: ProfileContent(),
        body: StreamBuilder(
      stream: vm.getUserByID(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final response = snapshot.data;
        if (response is Error) {
          final data = response as Error;
          return Text('Error: ${data.error}');
        }
        final success = response as Success<UserData>;
        return ProfileContent(success.data);
      }),
    ));
  }
}
