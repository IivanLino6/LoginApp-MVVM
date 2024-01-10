import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/Presentation/Widgets/DataCards.dart';
import 'package:firebase/src/Presentation/Widgets/Table.dart';
import 'package:firebase/src/Presentation/Widgets/TextForm.dart';
import 'package:firebase/src/Presentation/Widgets/customBtn.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  //Constructor
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String peopleName = '';
  String peopleID = '';
  String peopleEmail = '';
  String peopleAge = '';
  String peopleNumber = '';
  
  //Decleare Stream
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('People').snapshots();
  final Stream<QuerySnapshot> _cardStream =
      FirebaseFirestore.instance.collection('People').snapshots();

  //Methods
  getName(name) {
    peopleName = name;
  }

  getID(id) {
    peopleID = id;
  }

  getAge(age) {
    peopleAge = age;
  }

  getNumber(number) {
    peopleNumber = number;
  }

  getEmail(email) {
    peopleEmail = email;
  }

  //Actions
  Future<void> insertData() async {
    print('Insert data');

    CollectionReference docReference =
        FirebaseFirestore.instance.collection('People');

    //Mapping
    Map<String, dynamic> people = {
      "peopleName": peopleName,
      "peopleAge": peopleAge,
      "peopleNumber": peopleNumber,
      "peopleID": peopleID,
      "peopleEmail": peopleEmail
    };

    //Send data
    try {
      await docReference
          .doc(peopleID)
          .set(people)
          .timeout(const Duration(seconds: 10));
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Message"),
                content: const Text("User Registered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Accept')),
                ],
              ));
    } on TimeoutException catch (_) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Error"),
                content: const Text(
                    'Unable to register, check your internet connection.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Accept')),
                ],
              ));
    }
  }
  deleteData() {
    CollectionReference docReference =
        FirebaseFirestore.instance.collection('People');

    //Crear referencia al documento
    DocumentReference docToDelete = docReference.doc(peopleID);

    //Eliminar doc
    docToDelete.delete().whenComplete(() {
      print('User deleted');
    });
  }
  readData() {}
  updateData() {}

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 162, 248),
        ),
        drawer: const Drawer(
          backgroundColor: Color.fromARGB(255, 3, 162, 248),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              //Blue Background
              Positioned.fill(
                child: Container(
                  color: const Color.fromARGB(255, 3, 162, 248),
                ),
              ),

              //White Backgorund and TextField
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Column(children: <Widget>[
                      Row(
                        children: [
                          const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 32),
                                child: Text(
                                  'Users',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 32),
                                  child: Text(
                                    'Added',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              '50',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: CircularProgressIndicator(
                              value: 0.8, // Progreso actual (0.0 - 1.0)
                              strokeWidth: 10,
                              backgroundColor: Colors.grey[300],
                              color: Colors.orange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: CircularProgressIndicator(
                              value: 0.8, // Progreso actual (0.0 - 1.0)
                              strokeWidth: 10,
                              backgroundColor: Colors.grey[300],
                              color: Colors.blue[900],
                            ),
                          )
                        ],
                      ),
                      //Buttons
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomBtn(
                                onFctn: () {
                                  //insertData();
                                  showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Column(
                                          children: [
                                            //Title
                                            const Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Text(
                                                'Add User',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            //Name Field
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: TextCaption(
                                                  onChanged: (name) {
                                                    getName(name);
                                                  },
                                                )),
                                            //Age Field
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: TextCaption(
                                                  txtType:
                                                      TextInputType.datetime,
                                                  onChanged: (datetime) {
                                                    getAge(datetime);
                                                  },
                                                )),
                                            //Phone Number
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: TextCaption(
                                                  txtType: TextInputType.number,
                                                  onChanged: (number) {
                                                    getNumber(number);
                                                  },
                                                )),
                                            //Email Field
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: TextCaption(
                                                  onChanged: (email) {
                                                    getEmail(email);
                                                  },
                                                  txtType: TextInputType
                                                      .emailAddress,
                                                )),
                                            //ID Field
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                      labelText: 'ID',
                                                      hintText: 'Write your ID',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              //Crea una variable para asginar propiedades de decoracion  al TextField
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              //Crea una variable para asginar propiedades de decoracion  al TextField
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.grey[100],
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 5,
                                                              horizontal: 10)),
                                                  onChanged: (id) {
                                                    getID(id);
                                                  },
                                                )),
                                            //Register user button
                                            TextButton.icon(
                                              onPressed: () {
                                                insertData();
                                              },
                                              icon: const Icon(
                                                  Icons.check_sharp,
                                                  color: Colors.white),
                                              label: const Text(
                                                'Register',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.green)),
                                            )
                                          ],
                                        );
                                      });
                                },
                                txt: 'Add User',
                                icon: Icons.add),
                          ),
                          //Delete Data
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomBtn(
                                  onFctn: () {
                                    deleteData();
                                  },
                                  txt: 'Delete',
                                  icon: Icons.delete,
                                )),
                          ),
                          //update
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomBtn(
                                  onFctn: () {
                                    updateData();
                                  },
                                  txt: 'Update',
                                  icon: Icons.update,
                                )),
                          ),
                        ],
                      ),
                      //Show cards
                      Positioned(
                        top: screenSize *
                            .5, // Ajusta esta posición según sea necesario
                        child: ShowCard(
                            screenSize: screenSize,
                            screenWidth: screenWidth,
                            cardStream: _cardStream),
                      ),
                      //Show Table                      // Botón Show Table
                      ShowTable(
                          screenWidth: screenWidth, usersStream: _usersStream),
                    ]),
                  ),
                ),
              ),
              //Firebase Image
              Positioned(
                  top: 100,
                  left: 280,
                  child: Image.asset(
                    'asset/firebase.png',
                    height: 135,
                    //width: 50,
                  )),
              //Title
              const Positioned(
                  top: 140,
                  left: 45,
                  child: SizedBox(
                      child: Text(
                    'F I R E B A S E',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ))),
              //Greeting
              const Positioned(
                  top: 5,
                  left: 25,
                  child: SizedBox(
                      child: Text(
                    'Hi, Ivan!',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )))
            ],
          ),
        ));
  }
}
