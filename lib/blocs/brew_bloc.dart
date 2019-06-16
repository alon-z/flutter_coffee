import 'package:flutter/material.dart';
import '../models/brew.dart';

class BrewBloc extends ChangeNotifier {
  List<Brew> _dataBrews = [];

  List<Brew> get dataBrews => _dataBrews;
  void addBrew(Brew brew) {
    _dataBrews.add(brew);
    notifyListeners();
  }
}