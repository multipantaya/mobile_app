import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/ui/information/information.dart';
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
                  builder: (context) => AlertDialogCustom(
                    title: 'Informacion importante', 
                    text: 'Al enviar el pedido, usted acepta y se compromete a cumplir los términos y condiciones del servicio.',
                    needTwoButtons: true,
                    onTap: () => Navigator.of(context).pop(true),
                    colorsCancelButton: AppTheme.colors.primaryColor,
                    textButtonCancel: 'Ver politicas',
                    onTapCancel: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TermAndConditionsView())),
                  ),
                ).then((value) {
                  if(value is bool && value){
                    String title = '${texts.messageIntroduction} \n\n';
                    for (var product in products) {
                      title = title + '✓ ${product.platform.totalAmount} ${product.platform.totalAmount == 1 ? texts.account : texts.accounts}  ${product.platform.namePlatform} ${texts.inPlans} ${product.platform.plans.first.namePlan} \n';
                    }
                    title = title + '\n ${texts.totalToPay}: ${totalPrice} USD';
                    LinksAppUtils().openLinkApp(
                      context: context,
                      url: 'https://wa.me/18482367939?text=$title',
                      onClear: () {
                        context.read<CartCubit>().clearCart();
                      },
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