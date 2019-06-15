import 'package:flutter/material.dart';
import '../widgets/addGrindWidget.dart';

class AddGrindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Grind"),
        backgroundColor: Colors.brown[600],
      ),
      body: AddGrindWidget()
    );
  }
}
