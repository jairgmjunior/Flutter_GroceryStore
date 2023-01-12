import 'package:get/get.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/routes/app.pages.dart';
import 'package:greengrocer/src/services/utils.service.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRpository = AuthRepository();
  final utilServices = UtilService();

  UserModel user = UserModel();

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRpository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        //retira todas as outras telas e adiciona a proxima
        Get.offAllNamed(PagesRoutes.baseRoute);
      },
      error: (message) {
        utilServices.showToast(message: message, isError: true);
      },
    );
  }
}
