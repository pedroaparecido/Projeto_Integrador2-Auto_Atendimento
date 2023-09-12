import 'package:atendimento_automatico/features/cart/domain/entities/cart_itens_entity.dart';

class CartEntity {
  CartEntity({required this.itemsCartProduct});

  final List<CartItemsEntity>? itemsCartProduct;

  double totalItemCart() {
    double totalCartValue = 0.0;
    if (itemsCartProduct != null && itemsCartProduct!.isNotEmpty) {
      for (var product in itemsCartProduct!) {
        totalCartValue += product.totalValueItens;
      }
      return totalCartValue;
    } else {
      return 0.0;
    }
  }
}
