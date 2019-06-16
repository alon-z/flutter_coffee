import 'package:flutter/material.dart';
import 'addBrewPage.dart';
import '../models/brew.dart';
import '../blocs/brew_bloc.dart';
import 'package:provider/provider.dart';
//import 'grindDetailsPage.dart';

class BrewingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BrewBloc brewBloc = Provider.of<BrewBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddBrewPage(),
              ));
            },
          )
        ],
        title: Text("Brewing"),
        backgroundColor: Colors.brown[600],
      ),
      body: ListView(
        children: <Widget>[
          for(Brew brew in brewBloc.dataBrews)
            Card(child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => GrindDetailsPage(grind)));
                  },
                  child: ListTile(
                    title: Text(brew.beans.name + " - " + brew.grind.name),
                    subtitle: Text("Seconds: " + brew.grind.seconds.toString() + " Grinder: " + brew.grind.grinder),
                    leading: brew.beans.image != null ? Image.asset(brew.beans.image) : Image.asset("images/beans.jpg"),
                  ),
                ),
              ],
            ),)
        ],
      ),
    );
  }
}