import 'package:flutter/material.dart';
class Dashbaord extends StatefulWidget {
  @override
  _DashbaordState createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SizedBox(height: 20,),
      ),
      appBar: AppBar(
        title: Text("App Bar"),
      ),
    );
  }
}
