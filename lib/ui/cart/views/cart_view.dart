import 'package:flutter/material.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/widgets/main_appbar.dart';

class CartView extends StatelessWidget {
  static const routeName = 'cart_view';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(enableActions: false,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ContentCart(),
      )
    );
  }
}