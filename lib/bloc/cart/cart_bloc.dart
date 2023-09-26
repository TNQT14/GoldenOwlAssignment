
import 'package:bloc/bloc.dart';

import '../../model/shoe_model.dart';
import '../../services/cart_serivce.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<Shoes>? _listShoes;
  final _cartService = CartService();

  CartBloc() : super(InitState()) {
    on<GetCart>(_getProduct);
    on<IncreaseProduct>(_increaseProduct);
    on<DecreaseProduct>(_decreaseProduct);
    on<RemoveProduct>(_removeProduct);
  }

  Future _getProduct(GetCart event, Emitter emit) async {
    try {
      emit(CartLoading());
      _listShoes ??= await readJson();
      emit(CartLoaded(
        listShoes: _listShoes ?? [],
        listCart: await _cartService.readAllItem(),
      ));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future _increaseProduct(IncreaseProduct event, Emitter emit) async{
    int quantity = ++event.cart.quantity;
    print(quantity);
    await _cartService.updateItem(event.cart.copyWith(quantity));
    emit(CartLoaded(
      listShoes: _listShoes ?? [],
      listCart: await _cartService.readAllItem(),
    ));
  }

  Future _decreaseProduct(DecreaseProduct event, Emitter emit) async{
    int quantity = --event.cart.quantity;
    print(quantity);
    if(quantity>0){
      await _cartService.updateItem(event.cart.copyWith(quantity));
    }
    else
      await _cartService.deleteItem(event.cart.id);
    emit(CartLoaded(
      listShoes: _listShoes ?? [],
      listCart: await _cartService.readAllItem(),
    ));
  }

  Future _removeProduct(RemoveProduct event, Emitter emit) async {
    await _cartService.deleteItem(event.id);
    emit(CartLoaded(
      listShoes: _listShoes ?? [],
      listCart: await _cartService.readAllItem(),
    ));
  }

}
