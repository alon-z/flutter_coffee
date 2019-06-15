import 'package:flutter/material.dart';
import 'addBeansPage.dart';
import '../models/beans.dart';
import '../blocs/beans_bloc.dart';
import 'package:provider/provider.dart';

class BeansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BeansBloc beansBloc = Provider.of<BeansBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddBeansPage(),
              ));
            },
          )
        ],
        title: Text("Beans"),
        backgroundColor: Colors.brown[600],
      ),
      body: ListView(
        children: <Widget>[
          for(Beans beans in beansBloc.dataBeans)
          Card(child: Column(
            children: <Widget>[
              ListTile(
                title: Text(beans.name),
                subtitle: Text(beans.shortInfo),
                leading: beans.image != null ? Image.asset(beans.image) : Image.asset("images/beans.jpg"),
              ),
              if(beans.tags != null)
              Padding(
                child: Row(
                  children: <Widget>[
                    for(String tag in beans.tags)
                      Padding(padding: EdgeInsets.only(left: 5),child: Chip(label: Text(tag),),)
                  ],
                ),
                padding: EdgeInsets.only(left: 8, right: 8),
              )
            ],
          ),)
        ],
      ),
    );
  }
}
