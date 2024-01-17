import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Presentation/Pages/Profile/update/profile_update_viewmodel.dart';
import 'package:firebase/src/Presentation/Pages/Profile/update/widgets/profile_update_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileUpdateViewModel vm = Provider.of<ProfileUpdateViewModel>(context);
    UserData userDataArg =
        ModalRoute.of(context)?.settings.arguments as UserData;

    return ProfileUpdateContent(vm,userDataArg);
  }
}
