import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/grind_bloc.dart';
import '../blocs/beans_bloc.dart';
import '../models/beans.dart';
import '../models/grind.dart';

class AddBrewWidget extends StatefulWidget {
  @override
  _AddBrewWidgetState createState() => _AddBrewWidgetState();
}

class _AddBrewWidgetState extends State<AddBrewWidget> {
  Beans _selectedBeans;
  Grind _selectedGrind;

  @override
  Widget build(BuildContext context) {
    final GrindBloc grindBloc = Provider.of<GrindBloc>(context);
    final BeansBloc beansBloc = Provider.of<BeansBloc>(context);
    _selectedBeans = _selectedBeans == null ? beansBloc.dataBeans[0] : _selectedBeans;
    _selectedGrind = _selectedGrind == null ? grindBloc.dataGrinds[0] : _selectedGrind;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: <Widget>[
          DropdownButton<Beans>(
            value: _selectedBeans,
            onChanged: (Beans newSelected) {
              setState(() {
                _selectedBeans = newSelected;
              });
            },
            items: [
              for(Beans beans in beansBloc.dataBeans)
                DropdownMenuItem<Beans>(
                  value: beans,
                  child: Text(beans.name),
                )
            ],
          ),
          DropdownButton<Grind>(
            value: _selectedGrind,
            onChanged: (Grind newSelected) {
              setState(() {
                _selectedGrind = newSelected;
              });
            },
            items: [
              for(Grind grind in grindBloc.dataGrinds)
                DropdownMenuItem<Grind>(
                  value: grind,
                  child: Text(grind.name),
                )
            ],
          )
        ],
      )
    );
  }
}