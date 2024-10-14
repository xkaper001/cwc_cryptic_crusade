// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TeamStats {
  final String teamId;
  final int lives;
  final int hints;
  final int onLevel;
  final TimeStamps timestamps;
  TeamStats({
    required this.teamId,
    required this.lives,
    required this.hints,
    required this.onLevel,
    required this.timestamps,
  });

  TeamStats copyWith({
    String? teamId,
    int? lives,
    int? hints,
    int? onLevel,
    TimeStamps? timestamps,
  }) {
    return TeamStats(
      teamId: teamId ?? this.teamId,
      lives: lives ?? this.lives,
      hints: hints ?? this.hints,
      onLevel: onLevel ?? this.onLevel,
      timestamps: timestamps ?? this.timestamps,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teamId': teamId,
      'lives': lives,
      'hints': hints,
      'onLevel': onLevel,
      'timestamps': timestamps.toMap(),
    };
  }

  factory TeamStats.fromMap(Map<String, dynamic> map) {
    return TeamStats(
      teamId: map['teamId'] as String,
      lives: map['lives'] as int,
      hints: map['hints'] as int,
      onLevel: map['onLevel'] as int,
      timestamps: TimeStamps.fromMap(map['timestamps'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamStats.fromJson(String source) =>
      TeamStats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeamStats(teamId: $teamId, lives: $lives, hints: $hints, onLevel: $onLevel, timestamps: $timestamps)';
  }

  @override
  bool operator ==(covariant TeamStats other) {
    if (identical(this, other)) return true;

    return other.teamId == teamId &&
        other.lives == lives &&
        other.hints == hints &&
        other.onLevel == onLevel &&
        other.timestamps == timestamps;
  }

  @override
  int get hashCode {
    return teamId.hashCode ^
        lives.hashCode ^
        hints.hashCode ^
        onLevel.hashCode ^
        timestamps.hashCode;
  }
}

class TimeStamps {
  final DateTime? startedAt;
  final DateTime? level1;
  final DateTime? level2;
  final DateTime? level3;
  final DateTime? sidequest;
  final DateTime? level4;
  final DateTime? level5;
  final DateTime? level6;
  final DateTime? level7;
  TimeStamps({
    this.startedAt,
    this.level1,
    this.level2,
    this.level3,
    this.sidequest,
    this.level4,
    this.level5,
    this.level6,
    this.level7,
  });

  TimeStamps copyWith({
    DateTime? startedAt,
    DateTime? level1,
    DateTime? level2,
    DateTime? level3,
    DateTime? sidequest,
    DateTime? level4,
    DateTime? level5,
    DateTime? level6,
    DateTime? level7,
  }) {
    return TimeStamps(
      startedAt: startedAt ?? this.startedAt,
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      sidequest: sidequest ?? this.sidequest,
      level4: level4 ?? this.level4,
      level5: level5 ?? this.level5,
      level6: level6 ?? this.level6,
      level7: level7 ?? this.level7,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startedAt': startedAt,
      'level1': level1,
      'level2': level2,
      'level3': level3,
      'sidequest': sidequest,
      'level4': level4,
      'level5': level5,
      'level6': level6,
      'level7': level7,
    };
  }

  factory TimeStamps.fromMap(Map<String, dynamic> map) {
    return TimeStamps(
      startedAt: map['startedAt'] as DateTime,
      level1: map['level1'] as DateTime,
      level2: map['level2'] as DateTime,
      level3: map['level3'] as DateTime,
      sidequest: map['sidequest'] as DateTime,
      level4: map['level4'] as DateTime,
      level5: map['level5'] as DateTime,
      level6: map['level6'] as DateTime,
      level7: map['level7'] as DateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeStamps.fromJson(String source) =>
      TimeStamps.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TimeStamps(startedAt: $startedAt, level1: $level1, level2: $level2, level3: $level3, sidequest: $sidequest, level4: $level4, level5: $level5, level6: $level6, level7: $level7)';
  }

  @override
  bool operator ==(covariant TimeStamps other) {
    if (identical(this, other)) return true;

    return other.startedAt == startedAt &&
        other.level1 == level1 &&
        other.level2 == level2 &&
        other.level3 == level3 &&
        other.sidequest == sidequest &&
        other.level4 == level4 &&
        other.level5 == level5 &&
        other.level6 == level6 &&
        other.level7 == level7;
  }

  @override
  int get hashCode {
    return startedAt.hashCode ^
        level1.hashCode ^
        level2.hashCode ^
        level3.hashCode ^
        sidequest.hashCode ^
        level4.hashCode ^
        level5.hashCode ^
        level6.hashCode ^
        level7.hashCode;
  }
}
