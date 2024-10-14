import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwc_cryptic_crusade/core/models/teamstats.dart';
import 'package:cwc_cryptic_crusade/features/db/local_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'stats_state.dart';

final _teamId = FirebaseAuth.instance.currentUser!.displayName!;

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(StatsInitial(_teamId));

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

  void setLevelCompletedTime(String level, Timestamp time) {
    DateTime dateTime = time.toDate();
    String onlyTime = DateFormat('HH:mm:ss').format(dateTime);

    switch (level) {
      case "level1":
        setLevelCompleted(1, onlyTime);
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 1,
            timestamps: state.teamStats.timestamps.copyWith(
              level1: time.toDate(),
            ),
          ),
        ));
        break;
      case "level2":
        setTimeStamps(2, onlyTime);
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 2,
            timestamps: state.teamStats.timestamps.copyWith(
              level2: time.toDate(),
            ),
          ),
        ));
        break;
      case "level3":
        setTimeStamps(3, onlyTime);
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 3,
            timestamps: state.teamStats.timestamps.copyWith(
              level3: time.toDate(),
            ),
          ),
        ));
        break;
      case "sidequest":
        setTimeStamps(4, onlyTime);
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: -1,
            timestamps: state.teamStats.timestamps.copyWith(
              sidequest: time.toDate(),
            ),
          ),
        ));
        break;
      case "level4":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 4,
            timestamps: state.teamStats.timestamps.copyWith(
              level4: time.toDate(),
            ),
          ),
        ));
        break;
      case "level5":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 5,
            timestamps: state.teamStats.timestamps.copyWith(
              level5: time.toDate(),
            ),
          ),
        ));
        break;
      case "level6":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 6,
            timestamps: state.teamStats.timestamps.copyWith(
              level6: time.toDate(),
            ),
          ),
        ));
        break;
      case "level7":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 7,
            timestamps: state.teamStats.timestamps.copyWith(
              level7: time.toDate(),
            ),
          ),
        ));
        break;
      case "completed":
        emit(StateNextLevel(
          teamStats: state.teamStats.copyWith(
            onLevel: 100,
          ),
        ));
        break;
    }
  }
}
