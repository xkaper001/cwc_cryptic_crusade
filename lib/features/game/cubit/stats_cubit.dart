import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(const StatsInitial());

  void useHint() {
    if (state.hints > 0) {
      emit(StateUpdated(hints: state.hints - 1, hearts: state.hearts, level: state.level));
    }
  }

  void lostHeart() {
    if (state.hearts > 0) {
      emit(StateUpdated(hints: state.hints, hearts: state.hearts - 1, level: state.level));
    }
  }

  void changeLevel(int level) {
    emit(StateNextLevel(hints: state.hints, hearts: state.hearts, level: level));
  }
}
