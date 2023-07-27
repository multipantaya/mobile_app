import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class PlanDetailsContent extends StatelessWidget {
  const PlanDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    return BlocBuilder<PlanDetailsCubit, PlanDetailsState>(
      builder: (context, state) {
        final cuibt = context.read<CartCubit>();
        final cartCubit = context.read<PlanDetailsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Hero(
              tag: state.platform!.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MediaUtils().getImageWidget(
                  state.platform!.image,
                  useFileImage: false
                ),
              ),
            ),

            const SizedBox(height: 15,),

            PlanAndPrice(),

            const SizedBox(height: 20,),

            DropdownPlans(),

            const SizedBox(height: 20,),

            SelectAmount(
              onAdd: () => cartCubit.ChangeTotalAmount(true),
              onRemove: () => cartCubit.ChangeTotalAmount(false),
              totalAmount: state.platform!.totalAmount,
            ),

            const SizedBox(height: 20,),

            AppButton(
              name: texts.addToCart,
              onPressed: () {
                cuibt.addToCart(state.platform!.copyWith(plans: [state.plan!]));
                SnackbarUtils.popupSnackBar(context: context, text: texts.addedProduct);
              },
            ),

            const SizedBox(height: 20,),

            AutoSizeText(
              texts.characteristics,
              minFontSize: 14,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.textStyles.white16F500,
            ),

            const SizedBox(height: 10,),

            ...state.plan!.description.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: e.title,
                  style: AppTheme.textStyles.white14F700,
                  children: [
                    TextSpan(
                      text: ' ${e.content}',
                      style: AppTheme.textStyles.white14
                    )
                  ]
                )
              )
            ))
          ],
        );
      },
    );
  }
}