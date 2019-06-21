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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[400],
        elevation: 3.0,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => AddBrewPage(),
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("Brewing"),
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