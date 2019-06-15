import 'package:flutter/material.dart';
import 'addGrindPage.dart';
import '../models/grind.dart';
import '../blocs/grind_bloc.dart';
import 'package:provider/provider.dart';
import 'grindDetailsPage.dart';

class GrindsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GrindBloc grindBloc = Provider.of<GrindBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddGrindPage(),
              ));
            },
          )
        ],
        title: Text("Grinds"),
        backgroundColor: Colors.brown[600],
      ),
      body: ListView(
        children: <Widget>[
          for(Grind grind in grindBloc.dataGrinds)
          Card(child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GrindDetailsPage(grind)));
                },
                child: ListTile(
                  title: Text(grind.name),
                  subtitle: Text("Seconds: " + grind.seconds.toString() + " Grinder: " + grind.grinder),
                  leading: grind.image != null ? Image.asset(grind.image) : Image.asset("images/grounded_coffee.jpg"),
                ),
              ),
            ],
          ),)
        ],
      ),
    );
  }
}
