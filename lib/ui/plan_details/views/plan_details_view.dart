import 'package:flutter/material.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:mobile_app/widgets/main_appbar.dart';

class PlanDetailsView extends StatelessWidget {
  const PlanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: PlanDetailsContent(),
        ),
      ),
    );
  }
}