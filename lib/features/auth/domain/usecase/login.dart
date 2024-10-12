import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/i_auth_repository.dart';

class Login implements UseCase<User?, LoginParams> {
  final IAuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User?>> call(LoginParams params) async {
    return await repository.loginWithTeamIDandPlayKey(
      teamId: params.teamId,
      playKey: params.playKey,
    );
  }
}

class LoginParams {
  final String teamId;
  final String playKey;

  LoginParams({required this.teamId, required this.playKey});
}
