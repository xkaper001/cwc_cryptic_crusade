import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

abstract interface class UseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}
