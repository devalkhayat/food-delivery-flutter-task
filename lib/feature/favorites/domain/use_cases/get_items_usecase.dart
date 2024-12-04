import 'package:food_delivery_app/feature/favorites/domain/repo/favorites_repository.dart';

class GetItemsUseCase {
  final FavoritesRepository favoritesRepository;
  GetItemsUseCase({required this.favoritesRepository});
  call(){
    return favoritesRepository.getItems();
  }
}