import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom.colors.dart';
import 'package:greengrocer/src/models/item.model.dart';
import 'package:greengrocer/src/pages/components/HeroImage.component.dart';
import 'package:greengrocer/src/pages/product/product.screen.dart';
import 'package:greengrocer/src/services/utils.service.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final UtilService utils = UtilService();

  // ///////////////////////////////////////////////////////// //
  //para o widget add_to_cart_animation
  final void Function(GlobalKey) cartAnimationMethod;
  final GlobalKey imageGk = GlobalKey();
  // ///////////////////////////////////////////////////////// //

  ItemTile({Key? key, required this.item, required this.cartAnimationMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Conteúdo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (p) {
                  return ProductScreen(item: item);
                },
              ),
            );
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Imagem

                  // HeroImageComponent(
                  //   urlImage: item.imgUrl,
                  //   key: imageGk,
                  // ),

                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(
                        item.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),

                  //Nome
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //Preço - unid
                  Row(
                    children: [
                      Text(
                        utils.priceToCurrency(item.price),
                        style: TextStyle(
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        //botão add carrinho
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              cartAnimationMethod(imageGk);
            },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
