class MealDetailsEntity{
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final num price;
  final String rate;
  final String description;
  final String deliveryInfo;


  MealDetailsEntity({required this.id,required this.name,required this.category, required this.imageUrl, required this.price, required this.rate,
      required this.description, required this.deliveryInfo});
}