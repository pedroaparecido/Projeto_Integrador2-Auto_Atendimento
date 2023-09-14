import 'package:get/get.dart';

import '../../../../core/configs/route_config.dart';
import '../../../../core/widgets/dialog_widget.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/entities/cart_itens_entity.dart';

class CartController extends GetxController {
  final itemsCart = <CartItemsEntity>[].obs;
  final valueTotalItems = 0.0.obs;
  final refreshTotalItems = false.obs;

  void clearItemsCart() {
    itemsCart.clear();
    // totalValueItems();
    DialogWidget.feedback(result: true, message: 'Carrinho Limpo');
  }

  void addItemCart(ProductEntity product) {
    if (itemsCart.isEmpty) {
      itemsCart.add(CartItemsEntity(product: product));
    } else {
      for (var item in itemsCart) {
        if (item.product.id == product.id) {
          item.addProduct();

          DialogWidget.feedback(
            result: true,
            message: 'Produto Incrementado: ${item.product.name}\nQnt: ${item.getQntyItem}',
          );
          return;
        }
      }
      itemsCart.add(CartItemsEntity(product: product));
    }

    DialogWidget.feedback(result: true, message: 'Adicionado Produto: ${product.name}');
  }

  void removeItemCart(int index) {
    final itemRemoved = itemsCart.removeAt(index);
    valueTotalItems.value -= (itemRemoved.getQntyItem * itemRemoved.product.price);
  }

  void incrementItem(CartItemsEntity item) {
    refreshTotalItems.value = true;
    item.addProduct();
    valueTotalItems.value += item.product.price;
    refreshTotalItems.value = false;
  }

  void decrementItem(CartItemsEntity item) {
    refreshTotalItems.value = true;
    if (item.getQntyItem == 1) {
      itemsCart.remove(item);
    } else {
      item.removeProduct();
    }
    valueTotalItems.value -= item.product.price;
    refreshTotalItems.value = false;
  }

  void sumTotalValueItems() {
    if (itemsCart.isEmpty) {
      valueTotalItems.value = 0.0;
      return;
    }

    for (var item in itemsCart) {
      valueTotalItems.value += item.totalValueItens;
    }
  }

  void toCartDetail() {
    if (itemsCart.isNotEmpty) {
      sumTotalValueItems();
      Get.toNamed(RouteConfig.cartDetail);
    } else {
      DialogWidget.feedback(result: false, message: 'Por favor adicione um produto para continuar...');
    }
  }
}
