import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/homePage.dart';
import 'package:provider/provider.dart';
import 'blocs/beans_bloc.dart';
import 'blocs/grind_bloc.dart';
import 'blocs/brew_bloc.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BrewBloc>.value(
      value: BrewBloc(),
      child: ChangeNotifierProvider<GrindBloc>.value(
        value: GrindBloc(),
        child: ChangeNotifierProvider<BeansBloc>.value(
          value: BeansBloc(),
          child: MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: Colors.brown[600]
              )
            ),
            title: 'Coffee',
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}