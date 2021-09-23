import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro/bloc/app_bloc.dart';
import 'package:pro/bloc/app_events.dart';
import 'package:pro/bloc/app_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/main_screen.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 100,
              child: BlocBuilder<AppBloc, AppState>(
                  builder: (context, firstCounterState) {
                int fCounter = context.watch<AppBloc>().firstCounter;
                return FloatingActionButton.extended(
                  heroTag: 'toTheFirstScreen',
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  label: _mainScreenButtonConstruct(
                    'Track my period',
                    'contraception and wellbeing',
                    Icons.arrow_forward_ios_rounded,
                  ),
                  onPressed: () {
                    context.read<AppBloc>().add(FirstCounterEvent(fCounter));
                    Navigator.pushNamed(context, 'first_screen');
                  },
                );
              }),
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.12,
              ),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: BlocBuilder<AppBloc, AppState>(
                  builder: (context, secondCounterState) {
                int sCounter = context.watch<AppBloc>().secondCounter;
                return FloatingActionButton.extended(
                  heroTag: 'toTheSecondScreen',
                  backgroundColor: Color.fromRGBO(255, 239, 239, 1),
                  elevation: 0.0,
                  label: _mainScreenButtonConstruct(
                      'Get pregnant',
                      'learn about reproductive health',
                      Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    context.read<AppBloc>().add(SecondCounterEvent(sCounter));
                    Navigator.pushNamed(context, 'second_screen');
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainScreenButtonConstruct(
      String uppertext, String bottomText, IconData data) {
    return Container(
      height: 100,
      width: 300,
      padding: EdgeInsetsDirectional.only(
        start: 10,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 239, 239, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  uppertext,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Container(
                child: Text(
                  bottomText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(75, 75, 133, 1),
            ),
            margin: EdgeInsetsDirectional.only(
              end: 15,
            ),
            padding: EdgeInsetsDirectional.all(1),
            child: Icon(
              data,
              color: Color.fromRGBO(255, 239, 239, 1),
            ),
          )
        ],
      ),
    );
  }
}
