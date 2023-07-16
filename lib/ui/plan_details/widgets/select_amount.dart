import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:presentation/presentation.dart';

class SelectAmount extends StatelessWidget {
  const SelectAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlanDetailsCubit>();
    return BlocBuilder<PlanDetailsCubit, PlanDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: Text(
              'Cuentas a comprar',
              style: AppTheme.textStyles.white16F700,
            )),
            const SizedBox(width: 10,),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.colors.primaryColor)
              ),
              child: Row(
                children: [
                  IconButtonCustom(
                    icon: Icons.remove,
                    color: AppTheme.colors.white,
                    onPressed: () => cubit.ChangeTotalAmount(false),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    state.platform!.totalAmount.toString(),
                    style: AppTheme.textStyles.white16F500,
                  ),
                  const SizedBox(width: 10,),
                  IconButtonCustom(
                    icon: Icons.add,
                    color: AppTheme.colors.white,
                    onPressed: () => cubit.ChangeTotalAmount(true),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}