import 'package:firebase/src/Domain/Models/user_data.dart';
import 'package:firebase/src/Presentation/Pages/Profile/Widgets/profile_viewmodel.dart';
import 'package:firebase/src/Presentation/Widgets/RoundBtn.dart';
import 'package:firebase/src/Presentation/Widgets/customBtn.dart';
import 'package:firebase/src/Presentation/Widgets/defaultBtn.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  UserData userData;
  ProfileContent(this.userData);

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        //Blue background
        Positioned.fill(
          child: Container(
            color: const Color.fromARGB(255, 3, 162, 248),
          ),
        ),
        //Welcome title
        const Positioned(
            left: 0,
            right: 0,
            child: Align(
                alignment: Alignment.center,
                child: Text('Welcome!',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)))),
        //White background
        Positioned(
          top: screenSize * .15,
          child: Container(
            height: screenSize,
            width: screenWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                color: Colors.white),
          ),
        ),
        //User profile text
         Positioned(
            left: 0,
            right: 0,
            top: 200,
            child: Align(
                alignment: Alignment.center,
                child: Text(userData.username,
                    style: TextStyle(fontSize: 20, color: Colors.black)))),
        //Email Text
         Positioned(
            left: 0,
            right: 0,
            top: 230,
            child: Align(
              
                alignment: Alignment.center,
                child: Text(userData.email,
                    style: TextStyle(fontSize: 12, color: Colors.black54)))),
        //Image
        Positioned(
            left: 0,
            right: 0,
            top: 80,
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'asset/user.png',
                  height: 100,
                ))),
        //Edit profile button
        Positioned(
            top: 650,
            left: 65,
            child: DefaultWidget(
                icon: Icons.edit, onFctn: () {}, txt: 'Edit profile'))
      ],
    );
  }
}
