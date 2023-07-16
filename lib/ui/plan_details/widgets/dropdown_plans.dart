import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:presentation/presentation.dart';

class DropdownPlans extends StatefulWidget {
  const DropdownPlans({super.key});

  @override
  State<DropdownPlans> createState() => _DropdownPlansState();
}

class _DropdownPlansState extends State<DropdownPlans> {
  late PlanDetailsCubit cubit;
  late List<String> data;
  late String dropdownValue;
  @override
  void initState() {
    cubit = context.read<PlanDetailsCubit>();
    data = cubit.state.platform!.plans.map((e) => e.namePlan).toList();
    dropdownValue = data.first;
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        color: AppTheme.colors.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppTheme.shadows.white10
      ),
      child: DropdownButton(
        value: dropdownValue,
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: AppTheme.colors.background,
        menuMaxHeight: 300,
        style: AppTheme.textStyles.white16F500,
        borderRadius: BorderRadius.circular(20),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
            cubit.setPlan(value);
          });
        },
        items: data.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

