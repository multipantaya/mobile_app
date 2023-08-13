import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/cart/cart.dart';
// import 'package:mobile_app/ui/information/information.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class ResumenBar extends StatelessWidget {
  final double totalPrice;
  final List<ProductModel> products;
  const ResumenBar({super.key, required this.totalPrice, required this.products});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: AppTheme.shadows.white10,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                AutoSizeText(
                  texts.totalToPayCart,
                  maxLines: 1, 
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: AppTheme.textStyles.white14F500,
                ),
                const SizedBox(height: 5,),
                AutoSizeText(
                  '\$${totalPrice} USD',
                  maxLines: 1,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: AppTheme.textStyles.white14F500,
                ),
              ],
            )
          ),
          const SizedBox(width: 10,),
          AppButtonMini(
            onPressed: products.isNotEmpty
              ? () {
                showDialog(
                  context: context,  
                  builder: (context) => AlertDialogCheck(
                    title: texts.importantInformation.toUpperCase(), 
                    text: '${texts.informationToSend}${texts.importantInformationText}', 
                    textAlign: TextAlign.justify,
                    onTap: () => Navigator.of(context).pop(true),
                  ),
                ).then((value) {
                  final cubit = context.read<CartCubit>();
                  if(value is bool && value){
                    String title = '${texts.messageIntroduction} \n\n';
                    for (var product in products) {
                      title = title + '✓ ${product.platform.totalAmount} ${product.platform.totalAmount == 1 ? texts.account : texts.accounts}  ${product.platform.namePlatform} ${texts.inPlans} ${product.platform.plans.first.namePlan} (${product.platform.plans.first.price} USD C/U) \n\n';
                    }
                    title = title + 'Metodo de pago seleccionado: *${cubit.state.paymentSelected.trim()}*\n\n';
                    title = title + '*${texts.totalToPay}: ${totalPrice} USD*\n';
                    
                    LinksAppUtils().openLinkApp(
                      context: context,
                      url: 'https://wa.me/18482367939?text=$title',
                      onClear: () => cubit.clearCart(),
                    );
                  }
                });
              }
              : null, 
            text: texts.makeAnOrder
          )
        ],
      ),
    );
  }
}