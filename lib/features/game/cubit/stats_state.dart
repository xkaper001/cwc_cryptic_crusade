part of 'stats_cubit.dart';

@immutable
sealed class StatsState {
  final int hints;
  final int hearts;
  final int level;

  const StatsState({required this.hints, required this.hearts, required this.level});
}

final class StatsInitial extends StatsState {
  const StatsInitial() : super(hints: 4, hearts: 12, level: 1);
}

final class StateUpdated extends StatsState {
  const StateUpdated({required super.hints, required super.hearts, required super.level});
}

final class StateNextLevel extends StatsState {
  const StateNextLevel({required super.hints, required super.hearts, required super.level});
}

final class StateGameOver extends StatsState {
  const StateGameOver({required super.hints, required super.hearts, required super.level});
}
