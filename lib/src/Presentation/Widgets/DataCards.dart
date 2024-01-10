import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({
    super.key,
    required this.screenSize,
    required this.screenWidth,
    required Stream<QuerySnapshot<Object?>> cardStream,
  }) : _cardStream = cardStream;

  final double screenSize;
  final double screenWidth;
  final Stream<QuerySnapshot<Object?>> _cardStream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          screenSize * .15, // Ajusta el tamaño del contenedor
      width: screenWidth,
      child: StreamBuilder<QuerySnapshot>(
        stream: _cardStream,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Algo salió mal');
          }
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  color: Colors.black,
                  elevation: 5,
                  child: SizedBox(
                    width:
                        120, // Ajusta el ancho de las tarjetas
                    child: ListTile(
                        title: Text(
                            data['peopleName'] ?? 'Sin nombre',
                            style: const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Edad: ${data['peopleAge'] ?? 'Sin edad'}\n'
                          'Phone: ${data['peopleNumber'] ?? 'Sin ID'}\n'
                          'ID: ${data['peopleID'] ?? 'Sin email'}',
                          style: const TextStyle(fontSize: 10,color: Colors.white),
                        )),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

