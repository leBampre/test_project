import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro/bloc/app_bloc.dart';
import 'package:pro/bloc/app_events.dart';
import 'package:pro/bloc/app_states.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static List<int> wheelYears = List.generate(100, (index) => index + 1950);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/other_screens.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 80,
            ),
            _explanationToChoise('Log in your date of birth'),
            BlocBuilder<AppBloc, AppState>(
                builder: (context, firstChoiseState) {
              return _yearPicker(context);
            }),
            SizedBox(
              height: 30,
            ),
            _otherScreensButtonConstruct(
              context,
              'Next',
              Icons.arrow_forward_ios_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _explanationToChoise(String explanation) {
    return Container(
      child: Text(
        explanation,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _yearPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: 300,
          child: CupertinoPicker(
            itemExtent: 50,
            onSelectedItemChanged: (int index) {
              context.read<AppBloc>().add(FirstChoiseEvent(wheelYears[index]));
            },
            children: <Widget>[
              for (var i = 0; i < wheelYears.length; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${wheelYears[i]}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _otherScreensButtonConstruct(
      context, String buttonLabel, IconData data) {
    return SizedBox(
      width: 175,
      height: 50,
      child: FloatingActionButton(
        heroTag: 'fromFirstToTheLastScreen',
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                buttonLabel,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                margin: EdgeInsetsDirectional.only(start: 30, end: 15),
                child: Icon(
                  data,
                  color: Color.fromRGBO(75, 75, 133, 1),
                ),
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'info_screen');
        },
      ),
    );
  }
}
