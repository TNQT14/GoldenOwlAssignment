class CartModel {
  int id;
  int idItem;
  int quantity;

  CartModel({required this.id, required this.idItem, required this.quantity});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'idItem': idItem,
      'quantity': quantity,
    };
    return map;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) =>
      CartModel(id: map['id'], idItem: map['idItem'], quantity: map['quantity']);

  CartModel copyWith(int? quantity) {
    return CartModel(
        id: id, idItem: idItem, quantity: quantity ?? this.quantity);
  }
}