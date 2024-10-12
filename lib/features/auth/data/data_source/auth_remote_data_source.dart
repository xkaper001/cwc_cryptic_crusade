import 'package:firebase_auth/firebase_auth.dart';

abstract interface class IAuthRemoteDataSource {
  Future<User?> loginWithEmailPassword({
    required String email,
    required String password,
    required String teamId,
  });
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  AuthRemoteDataSource();

  @override
  Future<User?> loginWithEmailPassword({
    required String email,
    required String password,
    required String teamId,
  }) async {
    final ans = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    ans.user!.updateDisplayName(teamId);
    return ans.user;
  }
}
