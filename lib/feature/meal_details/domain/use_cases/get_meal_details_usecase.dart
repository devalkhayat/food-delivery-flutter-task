import 'package:food_delivery_app/feature/meal_details/domain/repo/meal_details_repository.dart';

class GetMealDetailsUseCase {
  final MealDetailsRepository mealDetailsRepository;
  GetMealDetailsUseCase({required this.mealDetailsRepository});
  call(String id) {
    return mealDetailsRepository.getDetails(id);
  }
}
