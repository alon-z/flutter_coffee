import 'package:flutter/material.dart';
import '../models/beans.dart';

class BeansBloc extends ChangeNotifier {
  List<Beans> _dataBeans = [
    Beans("Sweet Love - AVA", shortInfo: "Arabica Beans With Italian Style Roasting", image: "images/ava_coffee_sweet_love.jpg", tags: ["Arabica",]),
    Beans("Hazelnut - Wood Roast - AVA", shortInfo: "Arabica Beans Roasted Over Hazelnut Wood", image: "images/ava_hazelnut_wood_roast.jpg", tags: ["Arabica","Hazeknut"]),
    Beans("Kona - Peaberry", shortInfo: "High Aroma 100% Kona Beans", image: "images/kona_peaberry.jpg", tags: ["Kona","Aroma"]),
  ];

  List<Beans> get dataBeans => _dataBeans;
  void addBeans(Beans beans) {
    _dataBeans.add(beans);
    notifyListeners();
  }
}