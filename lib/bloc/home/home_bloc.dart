import 'package:bloc/bloc.dart';

import '../../model/shoe_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  List<Shoes>? _listShoes;

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
        listItem: [],
      ));
    } catch(e){
      emit(HomeError(e.toString()));
      print(e);
    }
  }

  Future addToCart(AddToCart event, Emitter emit) async {
    await _dbHelper
        .addItemToCart(CartItem(id: 0, idItem: event.id, quantity: 1));
    emit(HomeLoaded(
      listShoes: _listShoes ?? [],
      listItem: await _dbHelper.getAllItem(),
    ));
  }



}