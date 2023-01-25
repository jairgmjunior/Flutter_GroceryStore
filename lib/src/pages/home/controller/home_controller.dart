import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils.service.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilService = UtilService();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  void setLoading(bool value) {
    isLoading = value;

    update(); //getx para refletir na variavel
  }

  @override
  //para inicializar o controlador
  onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(success: (data) {
      allCategories.assignAll(data);

      if (allCategories.isEmpty) return;

      selectCategory(allCategories.first);
    }, error: (message) {
      utilService.showToast(message: message, isError: true);
    });
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update(); //getx para atualizar a interface
  }
}
