import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:presentation/presentation.dart';

class PlanAndPrice extends StatelessWidget {
  const PlanAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanDetailsCubit, PlanDetailsState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppTheme.colors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AutoSizeText(
                  state.plan!.price.toString()
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
