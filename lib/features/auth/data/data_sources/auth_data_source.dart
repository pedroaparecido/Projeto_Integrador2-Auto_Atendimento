abstract class AuthDataSource {
  Future<bool> signIn({required String email, required String password});
  Future<bool> signOut();
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<bool> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
