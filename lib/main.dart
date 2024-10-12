import 'package:cwc_cryptic_crusade/core/theme/theme.dart';
import 'package:cwc_cryptic_crusade/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cwc_cryptic_crusade/features/game/cubit/stats_cubit.dart';
import 'package:cwc_cryptic_crusade/init_dependencies.dart';
import 'package:cwc_cryptic_crusade/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => StatsCubit(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.appThemeData,
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}