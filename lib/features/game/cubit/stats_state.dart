part of 'stats_cubit.dart';

@immutable
class StatsState {
  final int hints;
  final int onLevel;
  final int lives;
  final Map<String, DateTime> timestamps;

  const StatsState({
    required this.hints,
    required this.onLevel,
    required this.lives,
    required this.timestamps,
  });

  factory StatsState.initial() {
    return const StatsState(
      hints: 3,
      onLevel: 0,
      lives: 12,
      timestamps: {},
    );
  }


  StatsState copyWith({
    int? hints,
    int? onLevel,
    int? lives,
    Map<String, DateTime>? timestamps,
  }) {
    return StatsState(
      hints: hints ?? this.hints,
      onLevel: onLevel ?? this.onLevel,
      lives: lives ?? this.lives,
      timestamps: timestamps ?? this.timestamps,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hints': hints,
      'onLevel': onLevel,
      'lives': lives,
      'timestamps': timestamps,
    };
  }

  factory StatsState.fromMap(Map<String, dynamic> map) {
    return StatsState(
      hints: map['hints'] as int,
      onLevel: map['onLevel'] as int,
      lives: map['lives'] as int,
      timestamps: Map<String, DateTime>.from((map['timestamps'] as Map<String, DateTime>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatsState.fromJson(String source) => StatsState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StatsState(hints: $hints, onLevel: $onLevel, lives: $lives, timestamps: $timestamps)';
  }

  @override
  bool operator ==(covariant StatsState other) {
    if (identical(this, other)) return true;
  
    return 
      other.hints == hints &&
      other.onLevel == onLevel &&
      other.lives == lives &&
      mapEquals(other.timestamps, timestamps);
  }

  @override
  int get hashCode {
    return hints.hashCode ^
      onLevel.hashCode ^
      lives.hashCode ^
      timestamps.hashCode;
  }
}
