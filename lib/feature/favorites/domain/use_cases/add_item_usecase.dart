import 'package:food_delivery_app/feature/favorites/domain/repo/favorites_repository.dart';
import 'package:food_delivery_app/feature/favorites/domain/entities/favorite_item_entity.dart';


class AddItemUseCase{
  final FavoritesRepository favoritesRepository;
  AddItemUseCase({required this.favoritesRepository});
  call(FavoriteItemEntity item){
   return favoritesRepository.addItem(item);
  }
}