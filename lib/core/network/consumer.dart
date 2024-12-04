import 'package:food_delivery_app/core/network/endpoints.dart';
import 'package:food_delivery_app/core/constants.dart' as constants;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Consumer extends EndPoints {
  @override
  Future<Response> getCategories() async => await http
      .get(Uri.parse(constants.NetworkCalls.categories.name.toString()));

  @override
  Future<Response> getMealDetails(String mealId) async {
    final queryParams = {
      'i': mealId,
    };

    final uri =
        Uri.parse(constants.NetworkCalls.mealDetails.name.toString())
            .replace(queryParameters: queryParams);
    return await http.get(
      uri,
    );
  }

  @override
  Future<Response> getMeals(String name) async {
    final queryParams = {
      'c': name.toString(),
    };

    final uri =
        Uri.parse(constants.NetworkCalls.mealsByCategory.name.toString())
            .replace(queryParameters: queryParams);

    return await http.get(
      uri,
    );
  }
}
