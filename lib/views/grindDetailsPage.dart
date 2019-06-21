import 'package:flutter/material.dart';
import '../models/grind.dart';
import 'dart:async';

class UITimer extends StatefulWidget {
  int _secondsLeft = 0;
  final int _seconds;
  UITimer(this._seconds);

  @override
  _UITimerState createState() => _UITimerState();
}

class _UITimerState extends State<UITimer> {
  Timer timer;
  @override
  void dispose() {
    if (timer != null) timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: widget._secondsLeft == 0 ? () {
        setState(() {
          widget._secondsLeft = widget._seconds;
        });
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          if (widget._secondsLeft == 0) {
            timer.cancel();
          } else {
            setState(() {
              widget._secondsLeft--;
            });
          }
        });
      } : null,
      child: Text(widget._secondsLeft != 0 ? widget._secondsLeft.toString() : "Start Timer"),
    );
  }
}


class GrindDetailsPage extends StatelessWidget {
  final Grind grind;

  GrindDetailsPage(this.grind) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text(grind.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(child: grind.image != null ? Image.asset(grind.image) : Image.asset("images/grounded_coffee.jpg"),
                  width: 80,
                ),
                Text("Grinder: " + grind.grinder),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Time in Seconds: " + grind.seconds.toString()),
              ],
            ),
            UITimer(grind.seconds)
          ],
        ),
      ),
    );
  }
}