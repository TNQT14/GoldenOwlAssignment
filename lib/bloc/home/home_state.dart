
import '../../model/item.dart';
import '../../model/shoe_model.dart';

abstract class HomeState{}

class InitState extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState{

  List<Shoes> listShoes;
  List<Item> listItem;

  HomeLoaded({required this.listShoes, required this.listItem});
}

class HomeError extends HomeState{
  String error;

  HomeError(this.error);
}