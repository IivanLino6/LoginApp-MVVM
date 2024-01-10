import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onFctn;
  final String txt;
  final IconData icon;
  const CustomBtn({
    super.key,
    required this.onFctn,
    required this.txt, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
            onPressed: () {
              onFctn();
            },
            backgroundColor: Colors.white,
            child:Icon(icon)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(txt),
      )
    ]);
  }
}
