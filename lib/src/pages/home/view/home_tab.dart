import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/components/custom_shimmer.dart';
import 'package:greengrocer/src/pages/components/greengrocer_logo.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/home/controller/home_controller.dart';
import 'package:greengrocer/src/pages/home/view/components/item_tile.dart';

import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // String selectedCategory = 'Frutas'; // mock
  // bool isLoading = true; // mock

  // ////////////////////////////////////////////////////////////// //
  // para o widget add_to_cart_animation
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  // ////////////////////////////////////////////////////////////// //

  final searchController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   //mock
  //   Future.delayed(const Duration(seconds: 3), () {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,

        //logo
        title: GreenGrocerLogo(
          fontSize: 30,
          greenColor: CustomColors.customSwatchColor,
          grocerColor: CustomColors.customContrastColor,
        ),

        //carrinho de compras
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              //pubspec
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(microseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            //pesquisa
            GetBuilder<HomeController>(
              builder: (controller) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      //adicionando valor a variavel do getx
                      controller.searchTile.value = value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintText: 'Pesquisar...',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: CustomColors.customContrastColor,
                        size: 21,
                      ),
                      suffixIcon: controller.searchTile.value.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                searchController.clear();
                                controller.searchTile.value = '';
                                FocusScope.of(context).unfocus();
                              },
                              icon: Icon(
                                Icons.close,
                                color: CustomColors.customContrastColor,
                                size: 21,
                              ),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            //categorias

            GetBuilder<HomeController>(
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.only(left: 25),
                  height: 40,
                  // child: !isLoading // mock
                  child: !controller.isCategoryLoading
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CategoryTile(
                              //category: app_data.categories[index], mock
                              category: controller.allCategories[index].title,
                              isSelected:
                                  //app_data.categories[index] == selectedCategory, //mock
                                  controller.allCategories[index] ==
                                      controller.currentCategory,
                              onPressed: () {
                                // setState(() { //mock
                                //   selectedCategory = app_data.categories[index];
                                // });
                                controller.selectCategory(
                                    controller.allCategories[index]);
                              },
                            );
                          },
                          separatorBuilder: (_, index) => const SizedBox(
                            width: 10,
                          ),
                          // itemCount: app_data.categories.length, //mock
                          itemCount: controller.allCategories.length,
                        )
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            9,
                            (index) => Container(
                              margin: const EdgeInsets.only(right: 12),
                              alignment: Alignment.center,
                              child: CustomShimmer(
                                height: 20,
                                width: 80,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),

            //grid
            GetBuilder<HomeController>(
              builder: (controller) {
                return Expanded(
                  //child: !isLoading//mock
                  child: !controller.isProductLoading
                      ? GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 9 / 11.5),
                          itemCount: controller.allProducts.length,
                          itemBuilder: (_, index) {
                            //paginação
                            if ((index + 1) == controller.allProducts.length) {
                              if (!controller.isLastPage) {
                                controller.loadMoreProducts();
                              }
                            }

                            return ItemTile(
                                item: controller.allProducts[index],
                                cartAnimationMethod:
                                    itemSelectedCartAnimations);
                          },
                        )
                      : GridView.count(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                          children: List.generate(
                            10,
                            (index) => CustomShimmer(
                              height: double.infinity,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
