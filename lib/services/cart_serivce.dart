  import 'package:mobile_intern_assignment/model/cart_model.dart';
import 'package:mobile_intern_assignment/repositories/repository.dart';

class CartService{
  late Reponsitory _reponsitory;
  CartService(){
    _reponsitory = Reponsitory();
  }

  addItem(CartModel cartModel)async{
    return await _reponsitory.insertData('db_Cart', cartModel.toMap());
  }

  readAllItem() async{
    return await _reponsitory.readData("db_Cart");
  }

  readItemById(cartModelID) async{
    return await _reponsitory.readDataById('db_Cart',cartModelID);
  }

  updateItem(CartModel cartModel) async{
    return await _reponsitory.updateData('db_Cart',cartModel.toMap());
  }

  deleteItem(cartModelID) async{
    return await _reponsitory.deleteData('db_Cart',cartModelID);
  }


}