import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screen/component/homeadmin.dart';
import 'package:flutter_application_1/screen/widgets/droplocation.dart';
import 'package:flutter_application_1/screen/widgets/dropservice.dart';

class station extends StatefulWidget {
  const station({Key? key}) : super(key: key);

  @override
  State<station> createState() => _stationState();
}

class _stationState extends State<station> {
  List gasstationn = [];
  late String ID, email, phone, password, workTime;
  CollectionReference users =
      FirebaseFirestore.instance.collection('GasStations');

  DatabaseReference ref = FirebaseDatabase.instance.ref('GasStations');

  List GasStations = [];
  var index = 0;
  CollectionReference GasStationsref =
      FirebaseFirestore.instance.collection("GasStations");

  Stream collectionStream =
      FirebaseFirestore.instance.collection('GasStations').snapshots();
  Stream documentStream =
      FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  getData() async {
    var resposebody = await GasStationsref.get();
    for (var element in resposebody.docs) {
      setState(() {
        GasStations.add(element.data());
      });
      if (kDebugMode) {}
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
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
              future: GasStationsref.get(),
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
                                  "Gas Station $index",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Gas Station Name :${snapshot.data?.docs[i]['ID']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Locations :${snapshot.data?.docs[i]['locations']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Services :${snapshot.data?.docs[i]['services']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Phone Number :${snapshot.data?.docs[i]['phone']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Email : ${snapshot.data?.docs[i]['email']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Work Time :${snapshot.data?.docs[i]['workTime']}",
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

// Example
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                services = null;
                locations = null;
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const Text(
                                'Enter Gas Station Information',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 20),
                              ),
                              SizedBox(
                                width: 500,
                                height: 50,
                                child: TextField(
                                  selectionHeightStyle:
                                      BoxHeightStyle.includeLineSpacingBottom,
                                  decoration: InputDecoration(
                                    labelText: ' Gas Station ID',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    ID = text;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                height: 50,
                                child: dropdown(),
                              ),
                              SizedBox(
                                width: 400,
                                height: 40,
                                child: dropservice(),
                              ),
                              SizedBox(
                                width: 500,
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
                                width: 500,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: ' Phone Number',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    phone = text;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 500,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: ' Work Time ',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    workTime = text;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 500,
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
                                              'email': email,
                                              'ID': ID,
                                              'phone': phone,
                                              'password': password,
                                              'locations': locations,
                                              'services': services,
                                              'workTime': workTime,
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

class alart extends StatefulWidget {
  const alart({Key? key}) : super(key: key);

  @override
  State<alart> createState() => _alartState();
}

class _alartState extends State<alart> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    ;
  }
}
