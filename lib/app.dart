import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pro/screens/first_screen.dart';
import 'package:pro/screens/info_screen.dart';
import 'package:pro/screens/second_screen.dart';
import 'package:pro/screens/main.dart';

import 'bloc/app_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: MaterialApp(title: 'Some Text', home: HomePage(), routes: {
        'first_screen': (BuildContext context) => FirstScreen(),
        'second_screen': (BuildContext context) => SecondScreen(),
        'info_screen': (BuildContext context) => InfoScreen(),
        'home_screen': (BuildContext context) => HomePage(),
      }),
    );
  }
}
