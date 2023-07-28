import 'package:flutter/material.dart';
import 'package:mobile_app/database/information/term_conditons_data.dart';
import 'package:mobile_app/widgets/main_appbar.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class TermAndConditionsView extends StatelessWidget {
  const TermAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    final data = TermConditionData.dataTerms();
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
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                itemCount: data.length,
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10,);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(
                        data[index].title,
                        textAlign: TextAlign.center,
                        style: AppTheme.textStyles.white16Bold,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        data[index].content,
                        textAlign: TextAlign.justify,
                        style: AppTheme.textStyles.white14F400,
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}