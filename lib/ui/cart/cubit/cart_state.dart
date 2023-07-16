part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.platforms = const []
  });

  final List<PlatformModel> platforms;
  
  @override
  List<Object?> get props => [
    platforms
  ];

  CartState copyWith({
    List<PlatformModel>? platforms

  }){
    return CartState(
      platforms: platforms ?? this.platforms
    );
  }


}
