import 'package:flutter/material.dart';

var services;

class dropservice extends StatefulWidget {
  const dropservice({Key? key}) : super(key: key);

  @override
  State<dropservice> createState() => _dropserviceState();
}

class _dropserviceState extends State<dropservice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DropdownButton(
        isExpanded: true,
        hint: Text(
          " Services",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        items: {
          'Gasoline and diesel filling for heating systems and cars.',
          'Car wash and dry clean.',
          'Flat tires change.',
          'Oil change',
          'Battery change.'
        }
            .map((e) => DropdownMenuItem(
                  child: Text('$e'),
                  value: e,
                ))
            .toList(),
        onChanged: (val) {
          setState(() {
            services = val;
          });
        },
        value: services,
      ),
    );
  }
}
