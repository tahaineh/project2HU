import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class dataref extends StatefulWidget {
  const dataref({Key? key}) : super(key: key);

  @override
  State<dataref> createState() => _datarefState();
}

class _datarefState extends State<dataref> {
  List Deliveryman = [];

  CollectionReference dileverymanref =
      FirebaseFirestore.instance.collection("Deliveryman");
  getData() async {
    var resposebody = await dileverymanref.get();
    resposebody.docs.forEach((element) {
      setState(() {
        Deliveryman.add(element.data());
      });
    });
  }

  @override
  void initState() {
    setState(() {
      getData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getData();
  }
}
