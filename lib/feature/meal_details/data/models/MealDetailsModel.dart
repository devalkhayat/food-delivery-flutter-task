class MealDetailsModel {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;


  MealDetailsModel(
      {required this.idMeal,
      required this.strMeal,

      required this.strCategory,
      required this.strArea,
      required this.strInstructions,
      required this.strMealThumb,
      });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {

    return MealDetailsModel(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],

        strCategory: json['strCategory'],
        strArea: json['strArea'],
        strInstructions: json['strInstructions'],
        strMealThumb: json['strMealThumb'] ,
        );
  }
}

class MealDetailsResponse {
  final List<MealDetailsModel> meals;
  
  MealDetailsResponse({required this.meals});
  
  factory MealDetailsResponse.fromJson(Map<String, dynamic> json) {
    final List<MealDetailsModel> tempMeals = [];

    json["meals"]
        .forEach((item) => tempMeals.add(MealDetailsModel.fromJson(item)));


    return MealDetailsResponse(meals: tempMeals);
  }
}
