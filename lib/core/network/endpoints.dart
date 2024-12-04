import 'package:http/http.dart' as http;



abstract class EndPoints{
  Future<http.Response> getCategories();
  Future<http.Response> getMealDetails(String mealId);
  Future<http.Response> getMeals(String name);

}
