import '../../model/cart_model.dart';

abstract class CartEvent {}

class GetCart extends CartEvent {}

class IncreaseProduct extends CartEvent {
  CartModel cart;

  IncreaseProduct({required this.cart});
}

class DecreaseProduct extends CartEvent {
  CartModel cart;

  DecreaseProduct({required this.cart});
}

class RemoveProduct extends CartEvent {
  int id;

  RemoveProduct(this.id);
}
