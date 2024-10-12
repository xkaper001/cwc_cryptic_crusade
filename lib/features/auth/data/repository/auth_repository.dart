import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repository/i_auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepository implements IAuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepository(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User?>> loginWithTeamIDandPlayKey({
    required String teamId,
    required String playKey,
  }) async {
    try {
      final res = await authRemoteDataSource.loginWithEmailPassword(
        email: "$teamId@tcc.cwc",
        password: playKey,
        teamId: teamId
      );
      return right(res);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      log(e.message ?? 'An error occurred');
      return left(Failure(e.message ?? 'An error occurred'));
    }
  }
}
