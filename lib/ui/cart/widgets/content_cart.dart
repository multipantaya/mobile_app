import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class ContentCart extends StatelessWidget {
  const ContentCart({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            if(state.products.isEmpty)...[
              const SizedBox(height: 30,),
              Center(
                child: Text(
                  texts.buildThePlan,
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyles.titleText,
                ),
              ),
            ],
            Expanded(
              child: ListView.separated(
                itemCount: state.products.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 15,), 
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(state.products[index].id),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: AppTheme.colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.delete_outline,color: AppTheme.colors.white,size: 35,),
                    ),
                    child: CardProduct(product: state.products[index]),
                    onDismissed: (_) => context.read<CartCubit>().deleteProduct(state.products[index].id),
                  );
                }, 
              )
            ),
            const SizedBox(height: 15,),
            ResumenBar(totalPrice: state.total,products: state.products,)
          ],
        );
      },
    );
  }
}
