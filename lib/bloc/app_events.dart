abstract class AppEvent {
  const AppEvent();

  int get props => 0;
}

class InitMainEvent extends AppEvent {}

class FirstCounterEvent extends AppEvent {
  final int firstCounter;
  FirstCounterEvent(this.firstCounter);
}

class SecondCounterEvent extends AppEvent {
  final int secondCounter;
  SecondCounterEvent(this.secondCounter);
}

class FirstChoiseEvent extends AppEvent {
  final int firstChoise;
  FirstChoiseEvent(this.firstChoise);
}

class SecondChoiseEvent extends AppEvent {
  final int secondChoise;
  SecondChoiseEvent(this.secondChoise);
}
