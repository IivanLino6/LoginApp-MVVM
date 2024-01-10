import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowTable extends StatelessWidget {
  const ShowTable({
    super.key,
    required this.screenWidth,
    required Stream<QuerySnapshot<Object?>> usersStream,
  }) : _usersStream = usersStream;

  final double screenWidth;
  final Stream<QuerySnapshot<Object?>> _usersStream;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text('Show Table',
          style:
              TextStyle(color: Colors.grey[600], fontSize: 18)),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 700,
                width: screenWidth,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Algo salió mal');
                    }
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const SizedBox(
                        height: 15,
                        width: 15,
                        child:
                            CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data == null ||
                        snapshot.data!.docs.isEmpty) {
                      return const Text(
                          "No hay datos disponibles");
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Age')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('ID')),
                          ],
                          rows: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document
                                .data()! as Map<String, dynamic>;
                            return DataRow(
                              cells: [
                                DataCell(Text(
                                    data['peopleName'] ??
                                        'Sin nombre')),
                                DataCell(Text(data['peopleAge'] ??
                                    'Sin edad')),
                                DataCell(Text(
                                    data['peopleNumber'] ??
                                        'Sin numero')),
                                DataCell(Text(
                                    data['peopleEmail'] ??
                                        'Sin email')),
                                DataCell(Text(data['peopleID'] ??
                                    'Sin ID')),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              );
            });
      },
      icon: const Icon(Icons.table_rows, color: Colors.grey),
      style: TextButton.styleFrom(shape: StadiumBorder()),
    );
  }
}
