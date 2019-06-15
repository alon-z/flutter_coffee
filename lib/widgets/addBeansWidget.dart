import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/beans_bloc.dart';
import '../models/beans.dart';

class AddBeansWidget extends StatefulWidget {

  @override
  _AddBeansWidgetState createState() => _AddBeansWidgetState();
}

class _AddBeansWidgetState extends State<AddBeansWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final BeansBloc beansBloc = Provider.of<BeansBloc>(context);
    String _name;
    String _description;
    final FocusNode _nameNode = FocusNode();
    final FocusNode _descriptionNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              focusNode: _nameNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                _nameNode.unfocus();
                FocusScope.of(context).requestFocus(_descriptionNode);
              },
              textCapitalization: TextCapitalization.words,
              validator: (value) { if (value.isEmpty) { return 'Enter The Product Name'; } return null;},
              onSaved: (value) => _name = value,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Product Name"
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFormField(
                focusNode: _descriptionNode,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (term) {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    beansBloc.addBeans(Beans(_name, shortInfo: _description));
                    Navigator.pop(context);
                  }
                },
                textCapitalization: TextCapitalization.words,
                validator: (value) { if (value.isEmpty) { return 'Enter A Short Description'; } return null;},
                onSaved: (value) => _description = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Product Description"
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  beansBloc.addBeans(Beans(_name, shortInfo: _description));
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