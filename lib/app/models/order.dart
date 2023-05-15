import 'shopping_card_model.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCardModel> itens;
  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.itens,
  });
}
