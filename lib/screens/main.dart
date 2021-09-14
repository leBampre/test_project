import 'package:flutter/material.dart';
import 'package:pro/bloc/bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тестовое задание'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Consumer<TextBloc>(builder: (context, text, child) {
            return Text(
              'Вас зовут: ${context.watch<TextBloc>().enteredName} и Ваш возраст: ${context.watch<TextBloc>().enteredAge}',
              style: TextStyle(
                fontSize: 36,
                color: Colors.blue[600],
              ),
            );
          }),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 75,
              width: 150,
              child: FloatingActionButton.extended(
                heroTag: 'name',
                onPressed: () {
                  Navigator.pushNamed(context, 'name_page');
                },
                label: Text('Имя'),
              )),
          SizedBox(
            width: 50,
          ),
          Container(
              height: 75,
              width: 150,
              child: FloatingActionButton.extended(
                heroTag: 'age',
                onPressed: () {
                  Navigator.pushNamed(context, 'age_page');
                },
                label: Text('Возраст'),
              )),
        ],
      ),
    );
  }
}
