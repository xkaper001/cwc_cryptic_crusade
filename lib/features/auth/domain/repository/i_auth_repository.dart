import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, User?>> loginWithTeamIDandPlayKey({
    required String teamId,
    required String playKey,
  });
}
