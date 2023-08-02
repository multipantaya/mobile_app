import 'package:domain/models/text/simple_text_model.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/main_appbar.dart';
import 'package:presentation/presentation.dart';

class TermAndConditionsView extends StatelessWidget {
  final String title;
  final List<SimpleTextModel> data;
  const TermAndConditionsView({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(enableActions: false,enableInfo: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Text(
              title.toUpperCase(),
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
                      if(data[index].title.isNotEmpty)...[
                        Text(
                        data[index].title,
                        textAlign: TextAlign.center,
                        style: AppTheme.textStyles.white16Bold,
                      ),
                      const SizedBox(height: 10,),
                      ],
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