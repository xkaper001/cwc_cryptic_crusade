import 'package:cwc_cryptic_crusade/core/theme/theme.dart';
import 'package:cwc_cryptic_crusade/features/game/cubit/stats_cubit.dart';
import 'package:cwc_cryptic_crusade/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatsCubit(),
      child: MaterialApp.router(
        theme: AppTheme.appThemeData,
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
