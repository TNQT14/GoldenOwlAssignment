import 'package:bloc/bloc.dart';
import 'package:mobile_intern_assignment/model/cart_model.dart';

import '../../model/shoe_model.dart';
import '../../services/cart_serivce.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  List<Shoes>? _listShoes;
  final _cartService = CartService();

  HomeBloc() : super(InitState()) {
    on<GetTheProduct>(getProduct);
    on<AddToCart>(addToCart);
  }

  Future getProduct (GetTheProduct event, Emitter emitter) async{
    print("0");
    try{
      emit(HomeLoading());
      print("1");
      _listShoes??= await readJson();
      print("List shoes:");
      emit(HomeLoaded(
        listShoes: _listShoes ?? [],
        listItem: await _cartService.readAllItem(),
      ));
    } catch(e){
      emit(HomeError(e.toString()));
      print(e);
    }
  }

  Future addToCart(AddToCart event, Emitter emit) async {
    print("addToCart home_bloc.dart");
    await _cartService.addItem(CartModel(id: 0, idItem: event.id, quantity: 1));
    print("Done addToCart home_bloc.dart");
    emit(HomeLoaded(
      listShoes: _listShoes ?? [],
      listItem: await _cartService.readAllItem(),
    ));
  }



}