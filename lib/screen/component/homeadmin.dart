import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/report.dart';
import 'adddeliveryman.dart';
import 'addgasstation.dart';

class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: <Widget>[
        // Add background
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/gas1.png"),
              fit: BoxFit.fill,
              opacity: 0.75,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(100, 0, 0, 0), BlendMode.color),
            ),
          ),
        ),
        Scaffold(
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
        ),
        Column(children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(76, 226, 204, 37),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: 400,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 208),
            padding: EdgeInsets.only(top: 25, bottom: 25, right: 5, left: 5),
            child: TextButton(
              child: Text(
                'Add Gas Station',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              // Action the button
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const station()),
                ),
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(76, 226, 204, 37),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: 400,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 25),
            padding: EdgeInsets.only(top: 25, bottom: 25, right: 5, left: 5),
            child: TextButton(
              child: Text(
                'Add Delivery Man',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              // Action the button
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const deliver()),
                ),
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(76, 226, 204, 37),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: 400,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 1),
            padding: EdgeInsets.only(top: 25, bottom: 25, right: 75, left: 75),
            child: TextButton(
              child: Text(
                'Reports',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              // Action the button
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const report()),
                ),
              },
            ),
          ),
        ]),
      ],
    ));
  }
}
