import 'package:flutter/material.dart';

class DefaultWidget extends StatelessWidget {
  final String txt;
  final VoidCallback onFctn;
  final IconData icon;
  const DefaultWidget({
    super.key,
    required this.txt,
    required this.onFctn,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton.icon(
        icon: Icon(icon), // Icono del botón
        label: Text(txt), // Texto del botón
        onPressed: () {
          // Acción al presionar el botón
          onFctn();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black45,
          backgroundColor: Colors.white, // Color del texto e icono
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
          ),
          padding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Espaciado
        ),
      ),
    );
  }
}