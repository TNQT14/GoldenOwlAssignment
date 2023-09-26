import '../../model/cart_model.dart';
import '../../model/shoe_model.dart';

abstract class CartState {}

class InitState extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  List<Shoes> listShoes;
  List<CartModel> listCart;

  CartLoaded({required this.listShoes, required this.listCart});
}

class CartError extends CartState {
  String error;

  CartError(this.error);
}
