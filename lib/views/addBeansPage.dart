import 'package:flutter/material.dart';
import '../widgets/addBeansWidget.dart';

class AddBeansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Beans"),
        backgroundColor: Colors.brown[600],
      ),
      body: AddBeansWidget()
    );
  }
}
