import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCaption extends StatefulWidget {
  final Function(String) onChanged;
  final TextInputType txtType;
  final String error;

  const TextCaption({
    super.key,
    required this.onChanged,
    this.txtType = TextInputType.text,this.error='',
  });

  @override
  State<TextCaption> createState() => _TextCaptionState();
}

class _TextCaptionState extends State<TextCaption> {
  //Crea variable de tipo controlador para acceder a las propiedades del field
  final TextEditingController _txtController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _passwController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final focusNode = FocusNode();

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Warning"),
              content: const Text("Only numbers accepted"),
              actions: [
                TextButton(
                    onPressed: () {
                      print('Accept');
                      Navigator.pop(context);
                    },
                    child: const Text('Accept')),
              ],
            ));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
         // Calcula la edad
      DateTime today = DateTime.now();
      int age = today.year - picked.year;
      if (today.month < picked.month || (today.month == picked.month && today.day < picked.day)) {
        age--;
      }

        //envia el dato a traves de la funcion onChanged
        widget.onChanged(age.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.txtType) {
      case TextInputType.number:
        return TextFormField(
          controller: _numController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Write your number',
              enabledBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
          onChanged: (value) {
            widget.onChanged(value);
            final n = num.tryParse(value);
            if (widget.txtType == TextInputType.number) {
              if (n == null) {
                //Manda una alerta para indicar que el dato no es de tipo num
                showAlert(context);
              }
            }
          },
          onTapOutside: (event) {
            //Cierra el teclado si el usuario presiona afuera
            focusNode.unfocus();
          },
        );
      case TextInputType.datetime:
        return TextFormField(
          controller: _dateController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Birthay',
              hintText: 'Select your birthay',
              enabledBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            _selectDate(context);
          },
          onTapOutside: (event) {
            //Cierra el teclado si el usuario presiona afuera
            focusNode.unfocus();
          },
        );
      case TextInputType.emailAddress:
        return TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Write your Email',
              enabledBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
          onChanged: (value) {
            widget.onChanged(value);
          },
          onTapOutside: (event) {
            //Cierra el teclado si el usuario presiona afuera
            focusNode.unfocus();
          },
        );
      case TextInputType.visiblePassword:
        return TextFormField(
          obscureText: true,
          controller: _passwController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Write your password',
              enabledBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
          onChanged: (value) {
            widget.onChanged(value);
          },
          onTapOutside: (event) {
            //Cierra el teclado si el usuario presiona afuera
            focusNode.unfocus();
          },
        );
      default:
        return TextFormField(
          controller: _txtController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Write your name',
              enabledBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: UnderlineInputBorder(
                  //Crea una variable para asginar propiedades de decoracion  al TextField
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
          onChanged: (value) {
            widget.onChanged(value);
          },
          onTapOutside: (event) {
            //Cierra el teclado si el usuario presiona afuera
            focusNode.unfocus();
          },
        );
    }
  }
}
