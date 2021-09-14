import 'package:flutter/cupertino.dart';

class TextBloc with ChangeNotifier {
  dynamic _age;
  dynamic _name;

  dynamic get enteredAge => _age;
  dynamic get enteredName => _name;

  updateAge(String? value) {
    (value == null || value == "") ? _age = ("no age added!") : _age = value;
    notifyListeners();
  }

  updateName(String? value) {
    (value == null || value == "") ? _name = "no name added!" : _name = value;
    notifyListeners();
  }
}
