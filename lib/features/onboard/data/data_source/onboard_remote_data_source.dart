
import '../../../../core/error/exceptions.dart';

abstract interface class IOnboardRemoteDataSource {
  Future<String> someFunction({
    required String name,
    required String email,
    required String password,
  });
}

class OnboardRemoteDataSource implements IOnboardRemoteDataSource {
  OnboardRemoteDataSource();
  
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
