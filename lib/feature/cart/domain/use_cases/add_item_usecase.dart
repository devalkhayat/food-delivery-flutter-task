import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';
import 'package:food_delivery_app/feature/cart/domain/repo/cart_repository.dart';
import 'package:food_delivery_app/feature/favorites/data/repository/favorites_repo_impl.dart';

class AddItemUseCase{
  final CartRepository cartRepository;
  AddItemUseCase({required this.cartRepository});
  call(CartItemEntity item){
    return cartRepository.addItem(item);
  }
}