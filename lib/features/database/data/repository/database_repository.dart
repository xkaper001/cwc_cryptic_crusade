import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/i_database_repository.dart';
import '../data_source/database_remote_data_source.dart';

class DatabaseRepository implements IDatabaseRepository {
  final DatabaseRemoteDataSource databaseRemoteDataSource;
  DatabaseRepository(this.databaseRemoteDataSource);

  @override
  Future<Either<Failure, String>> someFunction(
      {required String someParam1,
      required String someParam2,
      }) async {
    try {
      throw UnimplementedError;
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
