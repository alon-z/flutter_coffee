import 'beans.dart';
import 'grind.dart';
class Brew {
  Beans beans;
  Grind grind;
  DateTime brewingDate;
  Brew(this.beans, this.grind) {this.brewingDate = DateTime.now();}
}