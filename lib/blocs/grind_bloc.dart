import 'package:flutter/material.dart';
import '../models/grind.dart';

class GrindBloc extends ChangeNotifier {
  List<Grind> _dataGrinds = [
    Grind("Fine", 30, grinder: "KRUPS F203", image: "images/krups_grinder.jpg"),
    Grind("Hard", 15, grinder: "KRUPS F203", image: "images/krups_grinder.jpg"),
  ];

  List<Grind> get dataGrinds => _dataGrinds;
  void addGrind(Grind grind) {
    _dataGrinds.add(grind);
    notifyListeners();
  }
}