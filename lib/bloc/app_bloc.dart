import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_events.dart';
import 'app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitAppState());

  int firstCounter = 0;
  int secondCounter = 0;

  int firstChoise = 0;
  int secondChoise = 0;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is FirstCounterEvent) {
      yield FirstCounterState(
          firstCounter = incrementCounter(event.firstCounter));
    } else if (event is SecondCounterEvent) {
      yield SecondCounterState(
          secondCounter = incrementCounter(event.secondCounter));
    } else if (event is FirstChoiseEvent) {
      yield FirstChoiseState(firstChoise = event.firstChoise);
    } else if (event is SecondChoiseEvent) {
      yield SecondChoiseState(secondChoise = event.secondChoise);
    }
  }

  int incrementCounter(int current) {
    current = current + 1;
    return current;
  }
}
