
import '../repo/cart_repository.dart';

class RemoveItemUseCase{
  final CartRepository cartRepository;
  RemoveItemUseCase({required this.cartRepository});
  call(int id){
    return cartRepository.removeItem(id);
  }
}