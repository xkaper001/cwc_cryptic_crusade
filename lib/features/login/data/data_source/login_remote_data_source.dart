
import '../../../../core/error/exceptions.dart';

abstract interface class ILoginRemoteDataSource {
  Future<String> someFunction({
    required String name,
    required String email,
    required String password,
  });
}

class LoginRemoteDataSource implements ILoginRemoteDataSource {
  LoginRemoteDataSource();
  
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
