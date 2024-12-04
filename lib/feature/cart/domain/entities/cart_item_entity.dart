class CartItemEntity{
  final int id;
  final String name;
  final String imageLocation;
  final num price;
   int quantity;
   num totalAmount;

  CartItemEntity({required this.id,required this.name,required this.imageLocation,required this.price,required this.quantity,required this.totalAmount});


   Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name':name,
        'imageLocation': imageLocation,
        'price': price,
        'quantity': quantity,
        'totalAmount': totalAmount,

      };

  factory CartItemEntity.fromJson(Map<dynamic,dynamic>? json) {


    return CartItemEntity(
        id: json!['id'],
        name: json['name'],
        imageLocation: json['imageLocation'],
        price: json['price'],
        quantity: json['quantity'],
       totalAmount: json['totalAmount']);
  }
}
