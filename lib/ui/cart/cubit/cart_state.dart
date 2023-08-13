part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const [],
    this.objetProducts,
    this.total = 0,
    this.paymentSelected = ''
  });

  final List<ProductModel> products;
  final double total;
  final Box<CartData>? objetProducts;
  final String paymentSelected;
  
  @override
  List<Object?> get props => [
    products,total,objetProducts,paymentSelected
  ];

  CartState copyWith({
    List<ProductModel>? products,
    Box<CartData>? objetProducts,
    double? total,
    String? paymentSelected

  }){
    return CartState(
      products: products ?? this.products,
      objetProducts: objetProducts ?? this.objetProducts,
      total: total ?? this.total,
      paymentSelected: paymentSelected ?? this.paymentSelected
    );
  }
}
