import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'stats_state.dart';

final _teamId = FirebaseAuth.instance.currentUser!.displayName!;

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(StatsState.initial()) {
    _loadStats();
  }

  void useHint() {
    final newState = state.copyWith(hints: state.hints - 1);
    emit(newState);
    _saveStats(newState);
  }

  void lostHeart() {
    final newState = state.copyWith(lives: state.lives - 1);
    emit(newState);
    _saveStats(newState);
  }

  void updateLevel(int level) {
    emit(state.copyWith(onLevel: level));
  }

  // void update(int level, ) {    DateTime dateTime = time.toDate();
  //   String onlyTime = DateFormat('HH:mm:ss').format(dateTime);

  //   if (level == -1) {
  //     setTimeStamps(4, onlyTime);
  //     emit(state.copyWith(onLevel: -1));
  //   } else if (level > 3) {
  //     setTimeStamps(level + 1, onlyTime);
  //     emit(state.copyWith(onLevel: level));
  //   } else {
  //     setTimeStamps(level, onlyTime);
  //     emit(state.copyWith(onLevel: level));
  //   }

  // switch (level) {
  //   case "level1":
  //     setLevelCompleted(1, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 1,
  //       ),
  //     ));
  //     break;
  //   case "level2":
  //     setTimeStamps(2, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 2,
  //       ),
  //     ));
  //     break;
  //   case "level3":
  //     setTimeStamps(3, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 3,
  //       ),
  //     ));
  //     break;
  //   case "sidequest":
  //     setTimeStamps(4, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: -1,
  //       ),
  //     ));
  //     break;
  //   case "level4":
  //     setTimeStamps(5, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 4,
  //       ),
  //     ));
  //     break;
  //   case "level5":
  //     setTimeStamps(6, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 5,
  //       ),
  //     ));
  //     break;
  //   case "level6":
  //     setTimeStamps(7, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 6,
  //       ),
  //     ));
  //     break;
  //   case "level7":
  //     setTimeStamps(8, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 7,
  //       ),
  //     ));
  //     break;
  //   case "completed":
  //     setTimeStamps(100, onlyTime);
  //     emit(StateNextLevel(
  //       teamStats: state.teamStats.copyWith(
  //         onLevel: 100,
  //       ),
  //     ));
  //     break;
  // }
  // }

  Future<void> _saveStats(StatsState stats) async {
    final prefs = SharedPreferencesAsync();
    log('Saving stats: ${stats.toJson()}');
    await prefs.setString('statsState', jsonEncode(stats.toJson()));
  }

  Future<void> _loadStats() async {
    final prefs = SharedPreferencesAsync();
    final statsJson = await prefs.getString('statsState');
    if (statsJson != null) {
      // final stats = TeamStats.fromJson(jsonDecode(statsJson));
      final jsonMap = jsonDecode(statsJson);
      emit(StatsState.fromJson(jsonMap));
    }
  }
}
