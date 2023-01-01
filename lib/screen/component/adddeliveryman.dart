import 'dart:async' show Stream;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/screen/component/homeadmin.dart';

class deliver extends StatefulWidget {
  const deliver({Key? key}) : super(key: key);

  @override
  State<deliver> createState() => _deliverState();
}

class _deliverState extends State<deliver> {
  late String name_delivery, email, phonenumber, password, orders;
  CollectionReference users =
      FirebaseFirestore.instance.collection('Deliveryman');
  CollectionReference users1 = FirebaseFirestore.instance.collection('Report');
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('Deliveryman');
  List Deliveryman = [];
  var index = 0;
  CollectionReference dileverymanref =
      FirebaseFirestore.instance.collection("Deliveryman");

  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  Stream documentStream =
      FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  getData() async {
    var resposebody = await dileverymanref.get();
    for (var element in resposebody.docs) {
      setState(() {
        Deliveryman.add(element.data());
      });
      if (kDebugMode) {}
    }
  }

  @override
  void initState() {
    getData();
    getData1();
    super.initState();
  }

  getData1() async {
    var resposebody1 = await dileverymanref.get();
    for (var element1 in resposebody1.docs) {
      setState(() {
        Deliveryman.add(element1.data());
      });
      if (kDebugMode) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/gas1.png"),
              fit: BoxFit.fill,
              opacity: 0.55,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(99, 60, 53, 53), BlendMode.color),
            ),
          ),
        ),
        Scaffold(
            body: FutureBuilder<QuerySnapshot>(
              future: dileverymanref.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        index = i + 1;
                        return Container(
                          margin: EdgeInsets.all(12),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 5, left: 5)),
                                Text(
                                  "Delivery Man $index",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Delivery Man Name :${snapshot.data?.docs[i]['Name']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Phone Number :${snapshot.data?.docs[i]['phonenumber']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Email : ${snapshot.data?.docs[i]['Email']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Password :${snapshot.data?.docs[i]['password']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        );
                      });
                }

                if (snapshot.hasError) {
                  return Text("ERROR");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                return Text("hi");
              },
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: Image(
                image: AssetImage(
                  "images/logo.png",
                ),
              ),
              title: Title(
                color: Colors.white,
                child: Text('Gas Stations'),
              ),
              backgroundColor: Color.fromARGB(190, 31, 37, 43),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const Text(
                                'Enter Delivery Man Information',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 20),
                              ),
                              SizedBox(
                                width: 400,
                                height: 50,
                                child: TextField(
                                  selectionHeightStyle:
                                      BoxHeightStyle.includeLineSpacingBottom,
                                  decoration: InputDecoration(
                                    labelText: ' Delivery Man Name',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    name_delivery = text;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 400,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: ' Email ',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    email = text;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 400,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: ' Phone Number ',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    phonenumber = text;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 400,
                                height: 50,
                                child: TextField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    labelText: ' Password ',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    password = text;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 55,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 35,
                                      child: TextButton(
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          setState(() async {
                                            await users.add({
                                              'Email': email,
                                              'Name': name_delivery,
                                              'phonenumber': phonenumber,
                                              'password': password,
                                              'orders': [],
                                            }).whenComplete(
                                                () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const home1()),
                                                    ));
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 35,
                                      child: TextButton(
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.add),
            )),
      ],
    );
  }
}
