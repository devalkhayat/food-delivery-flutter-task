class FavoriteItemEntity{
  final int id;
  final String name;
  final String imageLocation;
  final num price;
  
  FavoriteItemEntity({required this.id,required this.name,required this.imageLocation,required this.price});


  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name':name,
        'imageLocation': imageLocation,
        'price': price,

      };


  factory FavoriteItemEntity.fromJson(Map<dynamic,dynamic>? json) {


    return FavoriteItemEntity(
        id: json!['id'],
        name: json['name'],
        imageLocation: json['imageLocation'],
        price: json['price']);

  }
}