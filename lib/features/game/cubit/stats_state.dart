part of 'stats_cubit.dart';

@immutable
sealed class StatsState {
  final TeamStats teamStats;

  const StatsState({required this.teamStats});
}

final class StatsInitial extends StatsState {
  final String teamId;
  StatsInitial(this.teamId)
      : super(
          teamStats: TeamStats(
            teamId: '',
            lives: 12,
            hints: 3,
            onLevel: 0,
            timestamps: TimeStamps(
              level1: null,
              level2: null,
              level3: null,
              level4: null,
              level5: null,
              level6: null,
              level7: null,
              sidequest: null,
              startedAt: null,
            ),
          ),
        );
}

final class StateUpdated extends StatsState {
  const StateUpdated({required super.teamStats});
}

final class StateNextLevel extends StatsState {
  const StateNextLevel({required super.teamStats});
}

final class StateGameOver extends StatsState {
  const StateGameOver({required super.teamStats});
}
