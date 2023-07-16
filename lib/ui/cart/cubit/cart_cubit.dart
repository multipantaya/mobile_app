import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  addToCart (PlatformModel platform) {
    List<PlatformModel> newPlatforms = [];

    for (var platforms in state.platforms) {
      newPlatforms.add(platforms);
    }
    newPlatforms.add(platform);
    emit(state.copyWith(platforms: newPlatforms));
  }
}
