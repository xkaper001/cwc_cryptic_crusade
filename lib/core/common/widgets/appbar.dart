import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/game/cubit/stats_cubit.dart';

AppBar statsAppBar() {
  return AppBar(
    leadingWidth: 65,
    leading: BlocBuilder<StatsCubit, StatsState>(
      builder: (context, state) {
        return TextButton(
            onPressed: () => showHintConfirmation(context),
            child: Text('${state.hints} ⚡'));
      },
    ),
    title: BlocBuilder<StatsCubit, StatsState>(
      builder: (context, state) {
        String level;
        if (state.level == -1) {
          level = "Side Quest";
        } else if (state.level == 100) {
          level = "Congratulations!";
        } else {
          level = "Level ${state.level}";
        }
        return Text(level);
      },
    ),
    centerTitle: true,
    actions: [
      BlocBuilder<StatsCubit, StatsState>(
        builder: (context, state) {
          return TextButton(
              onPressed: () {}, child: Text('${state.hearts}' ' ❤️'));
        },
      ),
    ],
  );
}

showHintConfirmation(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('You will lose 1 ⚡'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<StatsCubit>().useHint();
              Navigator.pop(context);
            },
            child: const Text('Use Hint'),
          ),
        ],
      );
    },
  );
}
