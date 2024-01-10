import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {

    final double screenSize = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: const Color.fromARGB(255, 3, 162, 248),
          ),
        ),
        Positioned(
          top: screenSize * .2,
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
        Center(
          child: Positioned(
            top: 100,
            child: Center(child: Text('User Profile', style:TextStyle(fontSize: 20)))),
        ),
        Positioned(
          top: 30,
          child: Image.asset('asset/user.png',height: 100,colorBlendMode: BlendMode.darken,color: Colors.black12,))
      ],
    );
  }
}