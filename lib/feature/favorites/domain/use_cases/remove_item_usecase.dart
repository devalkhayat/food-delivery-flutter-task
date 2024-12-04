import 'package:food_delivery_app/feature/favorites/domain/repo/favorites_repository.dart';
import 'package:food_delivery_app/feature/favorites/domain/entities/favorite_item_entity.dart';
class RemoveItemUseCase{
  final FavoritesRepository favoritesRepository;
  RemoveItemUseCase({required this.favoritesRepository});
  call(FavoriteItemEntity item){
    return favoritesRepository.removeItem(item);
  }
}