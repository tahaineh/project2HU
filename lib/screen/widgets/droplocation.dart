import 'package:flutter/material.dart';

var locations;

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: DropdownButton(
          isExpanded: true,
          hint: Text(
            " Locations",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          items: {'Amman', 'Zarqa'}
              .map((e) => DropdownMenuItem(
                    child: Text('$e'),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              locations = val;
            });
          },
          value: locations,
        ),
      ),
    );
  }
}
