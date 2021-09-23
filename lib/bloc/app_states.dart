class AppState {
  const AppState();

  int get props => 0;
}

class InitAppState extends AppState {}

class FirstCounterState extends AppState {
  final int firstCounter;

  FirstCounterState(this.firstCounter);

  @override
  int get props => firstCounter;
}

class SecondCounterState extends AppState {
  final int secondCounter;

  SecondCounterState(this.secondCounter);

  @override
  int get props => secondCounter;
}

class FirstChoiseState extends AppState {
  final int firstChoise;

  FirstChoiseState(this.firstChoise);

  @override
  int get props => firstChoise;
}

class SecondChoiseState extends AppState {
  final int secondChoise;

  SecondChoiseState(this.secondChoise);

  @override
  int get props => secondChoise;
}
