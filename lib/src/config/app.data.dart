import 'package:greengrocer/src/models/cart_item.model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  itemName: 'Maçã',
  imgUrl: 'assets/fruits/apple-1.webp',
  unit: 'kg',
  price: 3.00,
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanta da região',
);

ItemModel grape = ItemModel(
  itemName: 'Uva',
  imgUrl: 'assets/fruits/grape.png',
  unit: 'kg',
  price: 18.00,
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanta da região',
);

ItemModel guava = ItemModel(
  itemName: 'Goiaba',
  imgUrl: 'assets/fruits/guava.png',
  unit: 'kg',
  price: 25.00,
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanta da região',
);

ItemModel kiwi = ItemModel(
  itemName: 'kiwi',
  imgUrl: 'assets/fruits/kiwi.png',
  unit: 'un',
  price: 3.00,
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanta da região',
);

ItemModel mango = ItemModel(
  itemName: 'Manga',
  imgUrl: 'assets/fruits/mango.png',
  unit: 'un',
  price: 3.00,
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanta da região',
);

ItemModel papaya = ItemModel(
  itemName: 'Mamão Papaya',
  imgUrl: 'assets/fruits/papaya.png',
  unit: 'kg',
  price: 3.00,
  description:
      'O melhor mamão papaya da região e que conta com o melhor preço de qualquer quitanta da região',
);

List<ItemModel> Items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Legumes',
  'Verduras',
  'Temperos',
  'Cereais'
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 1),
  CartItemModel(item: papaya, quantity: 3),
  CartItemModel(item: grape, quantity: 1),
  CartItemModel(item: guava, quantity: 5),
];

UserModel user = UserModel(
  name: 'João Maria José',
  email: 'joaomj@gmail.com',
  phone: '(62) 9999-9999',
  cpf: '999.999.999-99',
  password: '123456',
);

List<OrderModel> orders = [
  OrderModel(
    id: 'A22917',
    copyAndPast: 'q1w2e3r4t5y6',
    status: 'preparing_purchase',
    createdDateTime: DateTime.parse(
      '2022-10-15 10:00:00.450',
    ),
    overdueDateTime: DateTime.parse(
      '2023-10-15 10:00:00.450',
    ),
    total: 15,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: papaya,
        quantity: 2,
      ),
    ],
  ),
  OrderModel(
    id: 'CA2719',
    copyAndPast: 'q1w2e3r4t5y6',
    status: 'shipping',
    createdDateTime: DateTime.parse(
      '2022-08-21 00:10:00.150',
    ),
    overdueDateTime: DateTime.parse(
      '2022-12-10 90:00:00.450',
    ),
    total: 25,
    items: [
      CartItemModel(
        item: grape,
        quantity: 2,
      ),
    ],
  ),
  OrderModel(
    id: 'CA28969',
    copyAndPast: 'q1w298632r4t6',
    status: 'delivered',
    createdDateTime: DateTime.parse(
      '2022-08-22 00:10:00.150',
    ),
    overdueDateTime: DateTime.parse(
      '2022-12-05 90:00:00.450',
    ),
    total: 40,
    items: [
      CartItemModel(
        item: kiwi,
        quantity: 5,
      ),
      CartItemModel(
        item: mango,
        quantity: 1,
      ),
      CartItemModel(
        item: papaya,
        quantity: 1,
      ),
    ],
  ),
  OrderModel(
    id: 'TD548969',
    copyAndPast: 'q1w2988745r4t6',
    status: 'pending_payment',
    createdDateTime: DateTime.parse(
      '2022-05-22 00:10:00.150',
    ),
    overdueDateTime: DateTime.parse(
      '2022-07-05 90:00:00.450',
    ),
    total: 40,
    items: [
      CartItemModel(
        item: guava,
        quantity: 2,
      ),
      CartItemModel(
        item: kiwi,
        quantity: 5,
      ),
    ],
  ),
];
