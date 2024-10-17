import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TeamStats {
  final String teamId;
  final int lives;
  final int hints;
  final int onLevel;

  TeamStats({
    required this.teamId,
    required this.lives,
    required this.hints,
    required this.onLevel,
  });

  TeamStats copyWith({
    String? teamId,
    int? lives,
    int? hints,
    int? onLevel,
  }) {
    return TeamStats(
      teamId: teamId ?? this.teamId,
      lives: lives ?? this.lives,
      hints: hints ?? this.hints,
      onLevel: onLevel ?? this.onLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teamId': teamId,
      'lives': lives,
      'hints': hints,
      'onLevel': onLevel,
    };
  }

  factory TeamStats.fromMap(Map<String, dynamic> map) {
    return TeamStats(
      teamId: map['teamId'] as String,
      lives: map['lives'] as int,
      hints: map['hints'] as int,
      onLevel: map['onLevel'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamStats.fromJson(String source) => TeamStats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeamStats(teamId: $teamId, lives: $lives, hints: $hints, onLevel: $onLevel)';
  }

  @override
  bool operator ==(covariant TeamStats other) {
    if (identical(this, other)) return true;
  
    return 
      other.teamId == teamId &&
      other.lives == lives &&
      other.hints == hints &&
      other.onLevel == onLevel;
  }

  @override
  int get hashCode {
    return teamId.hashCode ^
      lives.hashCode ^
      hints.hashCode ^
      onLevel.hashCode;
  }
}
