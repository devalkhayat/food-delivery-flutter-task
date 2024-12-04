import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';

import '../repo/cart_repository.dart';

class UpdateItemUseCase{
  final CartRepository cartRepository;
  UpdateItemUseCase({required this.cartRepository});
  call(CartItemEntity item){
    return cartRepository.updateItem(item);
  }
}