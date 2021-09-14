import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pro/bloc/bloc.dart';

class NamePage extends StatelessWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Введите имя'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 75,
          child: Consumer<TextBloc>(builder: (context, name, child) {
            return TextField(
              onChanged: (text) => context.read<TextBloc>().updateName(text),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    width: 1.0,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
            );
          }),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 75,
              width: 150,
              child: FloatingActionButton.extended(
                heroTag: 'age_acceptance',
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                label: Text('Подтвердить'),
              )),
        ],
      ),
    );
  }
}
