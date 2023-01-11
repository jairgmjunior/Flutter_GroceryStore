import 'package:get/state_manager.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRpository = AuthRepository();

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    await authRpository.signIn(email: email, password: password);

    isLoading.value = false;
  }
}
