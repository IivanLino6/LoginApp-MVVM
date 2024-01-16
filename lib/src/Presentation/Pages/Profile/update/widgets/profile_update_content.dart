import 'package:firebase/src/Presentation/Widgets/TextForm.dart';
import 'package:firebase/src/Presentation/Widgets/defaultBtn.dart';
import 'package:firebase/src/Presentation/Widgets/default_text.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {
  const ProfileUpdateContent({super.key});

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
            top: 130,
            child: Align(
                alignment: Alignment.center,
                child: Text('Edit Profile',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)))),
        //White background
        Positioned(
          top: screenSize * .20,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),
               ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: DefaultTextField(
              label: 'Username',
              icon: Icons.person_2_outlined,
              onChanged: (value) {}),
        ),
        //Edit profile button
        Positioned(
            top: 850,
            left: 65,
            child: DefaultWidget(
                icon: Icons.edit, onFctn: () {}, txt: 'Update Info'))
      ],
    );
  }
}
