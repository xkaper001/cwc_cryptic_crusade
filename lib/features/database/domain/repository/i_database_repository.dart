import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

abstract interface class IDatabaseRepository {
  @override
  Future<Either<Failure, String>> someFunction(
      {required String someParam1,
      required String someParam2,}) ;
}