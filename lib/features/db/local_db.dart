import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwc_cryptic_crusade/features/game/cubit/stats_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferencesAsync _sharedPreferencesAsync = SharedPreferencesAsync();

void initDb(String teamId) {
  log('DB Initialized');
  _sharedPreferencesAsync.setStringList(
    'timestamps',
    [
      '', // Started
      '', // 1
      '', // 2
      '', // 3
      '', // Side Quest
      '', // 4
      '', // 5
      '', // 6
      '', // 7
    ],
  );
  _sharedPreferencesAsync.setString('teamId', teamId);
  _sharedPreferencesAsync.setInt('currentLevel', 0);
}


Future<int?> getCurrentLevel() async {
  log('Current Level Requested');
  final currentLevel = await _sharedPreferencesAsync.getInt('currentLevel');
  log("Current Level is ${currentLevel.toString()}");
  return currentLevel;
}

setStart(BuildContext context) async {
  log('Game Started');
  final currentLevel = await getCurrentLevel();
  context.read<StatsCubit>().updateLevel(1);
  if (currentLevel == null) {
    _sharedPreferencesAsync.setInt('currentLevel', 1);
  }
}

Future<void> setLevelCompleted(int level, String time) async {
  if (level == 3) {
    log('Level 3 Started');
    log('Side Quest Started');
    log('Current Level Set to Side Quest');
    await _sharedPreferencesAsync.setInt('currentLevel', -1);
  } else if (level == -1) {
    log('Side Quest Completed');
    log('Current Level Set to 4');
    await _sharedPreferencesAsync.setInt('currentLevel', 4);
  } else {
    log('Level $level Completed');
    log('Current Level Set to ${level + 1}');
    await _sharedPreferencesAsync.setInt('currentLevel', level + 1);
    await _sharedPreferencesAsync.setString('level$level', time);
  }
}

Future<void> setTimeStamps(int level, String time) async {
  if (level == 3) {
    log('Side Quest Started');
    log('Current Level Set to Side Quest');
    await _sharedPreferencesAsync.setInt('currentLevel', -1);
  } else if (level == 4) {
    log('Side Quest Completed');
    log('Current Level Set to 4');
    await _sharedPreferencesAsync.setInt('currentLevel', 4);
  } else {
    log('TimeStamp Set for Level $level to $time');
    final List<String>? oldTimeStamps =
        await _sharedPreferencesAsync.getStringList('timestamps');
    oldTimeStamps![level] = time;

    _sharedPreferencesAsync.setStringList(
      'timestamps',
      oldTimeStamps,
    );
  }
}

Future<String?> getTeamId() async {
  log('TeamId Requested');
  return _sharedPreferencesAsync.getString('teamId');
}

Future<List<String>?> getTimeStamps() async {
  log('TimeStamps Requested');
  return _sharedPreferencesAsync.getStringList('timestamps');
}
