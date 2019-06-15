import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/grind_bloc.dart';
import '../models/grind.dart';
import 'package:numberpicker/numberpicker.dart';

class AddGrindWidget extends StatefulWidget {

  @override
  _AddGrindWidgetState createState() => _AddGrindWidgetState();
}

class _AddGrindWidgetState extends State<AddGrindWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final GrindBloc grindBloc = Provider.of<GrindBloc>(context);
    String _name;
    int _seconds = 10;
    String _grinder;
    final FocusNode _nameFocus = FocusNode();
    final FocusNode _grinderFocus = FocusNode();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              focusNode: _nameFocus,
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (term) {
                _nameFocus.unfocus();
                FocusScope.of(context).requestFocus(_grinderFocus);
              },
              textInputAction: TextInputAction.next,
              validator: (value) { if (value.isEmpty) { return 'Enter Grind Name'; } return null;},
              onSaved: (value) => _name = value,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Grind Name"
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: <Widget>[
                  Text("Seconds: "),
                  NumberPicker.integer(initialValue: _seconds, minValue: 1, maxValue: 120, onChanged: (num) {
                    setState(() {
                      _seconds = num;
                    });
                  },),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFormField(
                focusNode: _grinderFocus,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (term) {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    grindBloc.addGrind(Grind(_name, _seconds, grinder: _grinder));
                    Navigator.pop(context);
                  }
                },
                textCapitalization: TextCapitalization.words,
                validator: (value) { if (value.isEmpty) { return 'Enter Grinder Name'; } return null;},
                onSaved: (value) => _grinder = value,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Grinder Name"
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  grindBloc.addGrind(Grind(_name, _seconds, grinder: _grinder));
                  Navigator.pop(context);
                }
              },
              textTheme: ButtonTextTheme.primary,
              child: Text("Create"),
            )
          ],
        ),
      ),
    );
  }
}