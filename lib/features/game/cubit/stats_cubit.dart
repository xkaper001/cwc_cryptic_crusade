import 'package:cwc_cryptic_crusade/core/models/teamstats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stats_state.dart';

final teamId = FirebaseAuth.instance.currentUser!.displayName!;

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(StatsInitial(teamId));

  void useHint() {
    if (state.teamStats.hints > 0) {
      emit(StateUpdated(
          teamStats:
              state.teamStats.copyWith(hints: state.teamStats.hints - 1)));
    }
  }

  void lostHeart() {
    if (state.teamStats.lives > 0) {
      emit(StateUpdated(
          teamStats:
              state.teamStats.copyWith(lives: state.teamStats.lives - 1)));
    }
  }

  void setLevelCompletedTime(String level, DateTime time) {
    switch (level) {
      case "level1":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 1,
            timestamps: state.teamStats.timestamps.copyWith(
              level1: time,
            ),
          ),
        ));
        break;
      case "level2":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 2,
            timestamps: state.teamStats.timestamps.copyWith(
              level2: time,
            ),
          ),
        ));
        break;
      case "level3":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 3,
            timestamps: state.teamStats.timestamps.copyWith(
              level3: time,
            ),
          ),
        ));
        break;
      case "sidequest":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 4,
            timestamps: state.teamStats.timestamps.copyWith(
              sidequest: time,
            ),
          ),
        ));
        break;
      case "level4":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 5,
            timestamps: state.teamStats.timestamps.copyWith(
              level4: time,
            ),
          ),
        ));
        break;
      case "level5":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 6,
            timestamps: state.teamStats.timestamps.copyWith(
              level5: time,
            ),
          ),
        ));
        break;
      case "level6":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 7,
            timestamps: state.teamStats.timestamps.copyWith(
              level6: time,
            ),
          ),
        ));
        break;
      case "level7":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 8,
            timestamps: state.teamStats.timestamps.copyWith(
              level7: time,
            ),
          ),
        ));
        break;
    }
  }
}
