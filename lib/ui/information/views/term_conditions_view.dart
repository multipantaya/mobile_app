import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/main_appbar.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class TermAndConditionsView extends StatelessWidget {
  const TermAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: const MainAppBar(enableActions: false,enableInfo: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Text(
              texts.termAndConditions.toUpperCase(),
              style: AppTheme.textStyles.titleText,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 15),
                physics: const BouncingScrollPhysics(),
                children: [
                  
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}