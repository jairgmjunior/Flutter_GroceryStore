import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils.service.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilService = UtilService();

  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  RxString searchTile = ''.obs; //variável observável do getx

  // /////////////// MÉTODOS GET /////////////////////////////////////
  List<ItemModel> get allProducts => currentCategory?.items ?? [];

  bool get isLastPage {
    if (currentCategory!.items.length < itemsPerPage) return true;

    return currentCategory!.pagination * itemsPerPage > allProducts.length;
  }
  // /////////////////////////////////////////////////////////////////

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }

    update(); //getx para refletir na variavel
  }

  @override
  //para inicializar o controlador
  onInit() {
    super.onInit();

    debounce(
      searchTile,
      (_) {
        update();
      },
      time: const Duration(milliseconds: 600),
    );

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
    update();

    if (currentCategory!.items.isNotEmpty) return;

    getAllProducts(); //getx para atualizar a interface
  }

  Future<void> getAllProducts({bool canLoad = true}) async {
    if (canLoad) {
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'ItemsPerPage': itemsPerPage
    };

    HomeResult<ItemModel> result = await homeRepository.getAllProducts(body);

    setLoading(false, isProduct: true);

    result.when(success: (data) {
      currentCategory!.items.addAll(data);
    }, error: (message) {
      utilService.showToast(message: message, isError: true);
    });
  }

  void loadMoreProducts() {
    currentCategory!.pagination++;
    getAllProducts(canLoad: false);
  }
}
