import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_caard_model.dart';

class ShoppingCardService extends GetxService {
  final _shoppingCard = <int, ShoppingCaardModel>{}.obs;

  List<ShoppingCaardModel> get products => _shoppingCard.values.toList();

  int get totalProducts => _shoppingCard.values.length;

  ShoppingCaardModel? getById(int id) => _shoppingCard[id];

  double get totalValue {
    return _shoppingCard.values.fold(0, (totalValue, shoppingCaardModel) {
      totalValue +=
          shoppingCaardModel.product.price * shoppingCaardModel.quantity;
      return totalValue;
    });
  }

  void addAndRemoveProductInShoppingCard(
    ProductModel product, {
    required int quantity,
  }) {
    if (quantity == 0) {
      _shoppingCard.remove(product.id);
    } else {
      _shoppingCard.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCaardModel(quantity: quantity, product: product);
      });
    }
  }
}
