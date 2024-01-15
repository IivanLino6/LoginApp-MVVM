import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {

  String label;
  String error;
  String initialValue;
  IconData icon;
  bool obscureText;
  Function(String text) onChanged;

  DefaultTextField({
    required this.label,
    required this.icon,    
    required this.onChanged,
    this.error = '',
    this.initialValue = '',
    this.obscureText = false,        
  });

  @override
  Widget build(BuildContext context) {    
    return TextFormField(      
      initialValue: initialValue,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        errorText: error,   
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        )     
      ),
      style: TextStyle(
        color: Colors.white
      ),
      obscureText: obscureText,
      
    );
  }
}