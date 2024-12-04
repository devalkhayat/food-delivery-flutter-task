import 'package:food_delivery_app/feature/home/domain/repo/meal_repository.dart';

class GetMealsUseCase {
  final MealRepository repository;

  GetMealsUseCase({required this.repository});
  call(String name) {
    return repository.getAllMeals(name);
  }
}