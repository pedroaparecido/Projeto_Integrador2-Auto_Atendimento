import '../../../product/domain/entities/product_entity.dart';

class CartItemsEntity {
  final ProductEntity product;
  int _qnty = 1;

  CartItemsEntity({required this.product});

  int get getQntyItem => _qnty;
  double get totalValueItens => product.price * _qnty;

  addProduct() => _qnty += 1;
  removeProduct() => _qnty > 0 ? _qnty - 1 : 0;

  @override
  bool operator ==(covariant CartItemsEntity other) {
    if (identical(this, other)) return true;

    return other.product.id == product.id && other.product.name == product.name;
  }

  @override
  int get hashCode => product.hashCode;

  @override
  String toString() => 'CartItemsEntity(product: $product, _qnty: $_qnty)';
}
