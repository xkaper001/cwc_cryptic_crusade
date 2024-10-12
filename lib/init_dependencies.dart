import 'package:cwc_cryptic_crusade/features/auth/domain/repository/i_auth_repository.dart';
import 'package:cwc_cryptic_crusade/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/data_source/auth_remote_data_source.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/domain/usecase/login.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/game/cubit/stats_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  serviceLocator
    ..registerLazySingleton<FirebaseApp>(
      () => firebaseApp,
    )
    ..registerFactory(
      () => AuthRemoteDataSource(),
    )
    ..registerFactory<IAuthRepository>(
      () => AuthRepository(serviceLocator()),
    )
    ..registerLazySingleton(
      () => StatsCubit(),
    )
    ..registerFactory<Login>(
      () => Login(serviceLocator()),
    )
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(serviceLocator()),
    );
}
