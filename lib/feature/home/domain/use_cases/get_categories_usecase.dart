import 'package:food_delivery_app/feature/home/domain/repo/category_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase({required this.repository});
  call() {
    return repository.getAllCategories();
  }
}
