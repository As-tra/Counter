import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sami_version/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterIncrementState> {
  CounterCubit(super.initialState);

  int teamAPoints = 0;
  int teamBPoints = 0;

  void teamIncrement({required String team, required int points}) {
    if (team == 'A') {
      teamAPoints += points;
      emit(CounterAIncrementState());
    } else {
      teamBPoints += points;
      emit(CounterBIncrementState());
    }
  }
}
