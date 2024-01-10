import 'package:flutter/material.dart';

buildShowDialog(BuildContext context){
  return showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context){
      return Center(child: CircularProgressIndicator());
    }
  );
}