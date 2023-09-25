class Item {
  int id;
  int idItem;
  int quantity;

  Item({required this.id, required this.idItem, required this.quantity});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'idItem': idItem,
      'quantity': quantity,
    };
    return map;
  }

  factory Item.fromMap(Map<String, dynamic> map) =>
      Item(id: map['id'], idItem: map['idItem'], quantity: map['quantity']);

  Item copyWith(int? quantity) {
    return Item(
        id: id, idItem: idItem, quantity: quantity ?? this.quantity);
  }
}
