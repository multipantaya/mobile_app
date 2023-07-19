part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const []
  });

  final List<ProductModel> products;
  
  @override
  List<Object?> get props => [
    products
  ];

  CartState copyWith({
    List<ProductModel>? products

  }){
    return CartState(
      products: products ?? this.products
    );
  }


}
