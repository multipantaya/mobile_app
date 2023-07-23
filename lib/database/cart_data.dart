import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
part 'cart_data.g.dart';

@HiveType(typeId: 3)
class CartData extends HiveObject {
  @HiveField(0)
  late List<ProductModel> products;

  CartData({required this.products});
}
