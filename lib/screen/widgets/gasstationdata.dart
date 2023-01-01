import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/report.dart';
import 'package:flutter_application_1/screen/component/addgasstation.dart';
import 'package:flutter_application_1/screen/component/adddeliveryman.dart';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class gasstationdata extends StatefulWidget {
  const gasstationdata({Key? key}) : super(key: key);

  @override
  State<gasstationdata> createState() => _gasstationdataState();
}

class _gasstationdataState extends State<gasstationdata> {
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
    return Stack(children: <Widget>[
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
          ))
    ]);
  }
}
