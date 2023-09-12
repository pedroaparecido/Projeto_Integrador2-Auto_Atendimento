import 'package:get/get.dart';

import '../../../../core/configs/route_config.dart';
import '../../../../core/widgets/dialog_widget.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/entities/cart_itens_entity.dart';

class CartController extends GetxController {
  final itemsCart = <CartItemsEntity>[].obs;

  void clearItemsCart() {
    itemsCart.clear();
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

  void removeItemCart(int index) => itemsCart.removeAt(index);

  void toCartDetail() {
    if (itemsCart.isNotEmpty) {
      Get.toNamed(RouteConfig.cartDetail);
    } else {
      DialogWidget.feedback(result: false, message: 'Por favor adicione um produto para continuar...');
    }
  }
}
