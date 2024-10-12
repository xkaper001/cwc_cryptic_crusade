
import '../../../../core/error/exceptions.dart';

abstract interface class IDatabaseRemoteDataSource {
  Future<String> someFunction({
    required String name,
    required String email,
    required String password,
  });
}

class DatabaseRemoteDataSource implements IDatabaseRemoteDataSource {
  DatabaseRemoteDataSource();
  
  @override
  Future<String> someFunction({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      //TODO: Implement someFunction
      throw UnimplementedError;
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }
}
