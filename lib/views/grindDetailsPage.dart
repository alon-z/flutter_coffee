import 'package:flutter/material.dart';
import '../models/grind.dart';

class GrindDetailsPage extends StatelessWidget {
  Grind grind;

  GrindDetailsPage(this.grind) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text(grind.name),
      ),
      body: Row(
        children: <Widget>[
          grind.image != null ? Image.asset(grind.image) : Image.asset("images/grounded_coffee.jpg"),
          Text(grind.grinder)
        ],
      ),
    );
  }
}