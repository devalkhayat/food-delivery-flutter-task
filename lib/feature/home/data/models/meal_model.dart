class MealModel{
  String id;
  String name;
  String image;



  MealModel({required this.id,required this.name,required this.image});

  factory MealModel.fromJson(Map<String,dynamic> json){
    return MealModel(id: json['idMeal'], name: json['strMeal'], image: json['strMealThumb']+ "/preview");
  }

}

class MealsResponse{
  final List<MealModel> meals;
  MealsResponse({required this.meals});
  factory MealsResponse.fromJson(Map<String, dynamic> json) {

    final List<MealModel> tempMeals = [];
    json["meals"].forEach((item) => tempMeals.add(MealModel.fromJson(item)));

    return MealsResponse(meals: tempMeals);
  }
}