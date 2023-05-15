import 'package:get/get.dart';

import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burger_mobile/app/models/order.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_controller.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;

  final _address = "".obs;
  final _cpf = "".obs;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService;

  List<ShoppingCardModel> get products => _shoppingCardService.products;

  double get totalValue => _shoppingCardService.totalValue;
  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity + 1,
    );
  }

  void subtractQuantityProduct(ShoppingCardModel shoppingCaardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCaardModel.product,
      quantity: shoppingCaardModel.quantity - 1,
    );
  }

  void clear() => _shoppingCardService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      itens: products,
    );
    var orderPix = await _orderRepository.createOrder(order);
    orderPix = orderPix.copyWith(totalValue: totalValue);

    Get.offNamed("/orders/finished", arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
