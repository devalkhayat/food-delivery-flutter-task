import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/feature/meal_details/data/repository/meal_details_repo_impl.dart';
import 'package:food_delivery_app/feature/meal_details/domain/entities/meal_details_entity.dart';
import 'package:food_delivery_app/feature/meal_details/domain/use_cases/get_meal_details_usecase.dart';

class MealDetailsScreenViewModel extends ChangeNotifier {
  MealDetailsEntity? _detailsEntity;
  MealDetailsEntity? get detailsEntity => _detailsEntity;

  final ValueNotifier<int> _quantity = ValueNotifier(1);
  ValueNotifier<int> get quantity => _quantity;




  Future<void> getData(String id) async {
    var x = await GetMealDetailsUseCase(
            mealDetailsRepository: MealDetailsRepoImpl())
        .call(id);
    x.fold((error) => print(error.errorMessage), (done) async {
      _detailsEntity = (done as MealDetailsEntity?);
    });
    notifyListeners();
  }

  void increaseQuantity() {
    _quantity.value++;
  }

  void decreaseQuantity() {
    if (_quantity.value >= 1) {
      _quantity.value--;
    }
  }
}
