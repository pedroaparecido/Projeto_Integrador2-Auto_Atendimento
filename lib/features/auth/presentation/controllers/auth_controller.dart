import 'package:get/get.dart';

import '../../domain/entities/auth_entity.dart';

class AuthController extends GetxController {
  // final _authRepository = sl<AuthRepository>();

  final auth = <AuthEntity>[].obs;

  Future<void> signIn({required String email, required String password}) async {}

  Future<void> signOut() async {}
}
