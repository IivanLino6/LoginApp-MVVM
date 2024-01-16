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

    return Scaffold(
      body: Stack(
        children: [
          
          //Blue background
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 3, 162, 248),
            ),
          ),
          //Goback button
          Positioned(
            top: 75,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),
                   ),
            ),
          ),
          //Welcome title
          const Positioned(
              left: 0,
              right: 0,
              top: 90,
              child: Align(
                  alignment: Alignment.center,
                  child: Text('Edit Profile',
                      style: TextStyle(
                          fontSize: 20,
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
              child:   //Name field
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: DefaultFormField(
                    txt: 'Username',
                    onChanged: (value) {}),
              ),
               //Edit profile button
          Positioned(
              top: 850,
              left: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultWidget(
                    icon: Icons.edit, onFctn: () {}, txt: 'Update Info'),
              ))
            ],
          ),
            ),
          ),
        ],
      ),
    );
  }
}


