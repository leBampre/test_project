import 'package:flutter/material.dart';
import 'package:pro/bloc/bloc.dart';
import 'package:provider/provider.dart';

import 'package:pro/screens/age.dart';
import 'package:pro/screens/name.dart';
import 'package:pro/screens/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextBloc>(
      create: (_) => TextBloc(),
      child: MaterialApp(title: 'Some Text', home: HomePage(), routes: {
        'name_page': (BuildContext context) => NamePage(),
        'age_page': (BuildContext context) => AgePage(),
      }),
    );
  }
}
