import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro/bloc/app_bloc.dart';
import 'package:pro/bloc/app_states.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/other_screens.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _screenStatistic(
                  context.watch<AppBloc>().firstCounter,
                  context.watch<AppBloc>().firstChoise,
                  'first',
                ),
                _screenStatistic(
                  context.watch<AppBloc>().secondCounter,
                  context.watch<AppBloc>().secondChoise,
                  'second',
                ),
                SizedBox(
                  width: 175,
                  height: 50,
                  child: _otherScreensButtonConstruct(
                    context,
                    'Home',
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _screenStatistic(int count, dynamic choise, String screenNumber) {
    return Column(
      children: [
        Container(
          width: 350,
          child: Text(
            'The $screenNumber was attended for $count times',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: 350,
          child: Text(
            'Last maded choise on the $screenNumber screen was: $choise',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _otherScreensButtonConstruct(
      BuildContext context, String buttonLabel) {
    return FloatingActionButton(
        heroTag: 'toHomeScreen',
        elevation: 0.0,
        backgroundColor: Colors.white,
        child: Container(
          width: 200,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(75, 75, 133, 1),
                Color.fromRGBO(134, 134, 174, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonLabel,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'home_screen');
        });
  }
}
