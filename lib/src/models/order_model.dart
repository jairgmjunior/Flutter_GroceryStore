import 'package:greengrocer/src/models/cart_item.model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  List<CartItemModel> items;
  DateTime overdueDateTime;
  String status;
  String copyAndPast;
  double total;

  OrderModel({
    required this.copyAndPast,
    required this.createdDateTime,
    required this.id,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.total,
  });
}
