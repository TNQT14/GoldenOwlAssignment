abstract class HomeEvent{}

class AddToCart extends HomeEvent{
  int id;
  AddToCart({required this.id});
}

class GetTheProduct extends HomeEvent{

}