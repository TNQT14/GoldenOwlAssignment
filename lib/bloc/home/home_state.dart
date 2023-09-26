
import 'package:mobile_intern_assignment/model/cart_model.dart';
import '../../model/shoe_model.dart';

abstract class HomeState{}

class InitState extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState{

  List<Shoes> listShoes;
  List<CartModel> listItem;

  HomeLoaded({required this.listShoes, required this.listItem});
}

class HomeError extends HomeState{
  String error;

  HomeError(this.error);
}