import 'package:flutter/material.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/widgets/main_appbar.dart';
import 'package:presentation/presentation.dart';


class HomeView extends StatelessWidget {
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  '¡Disfruta del Entretenimiento sin Límites!',
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyles.titleText,
                ),
                const SizedBox(height: 20,),
                Wrap(
                  runSpacing: 20,
                  spacing: 15,
                  children: [
                    CardPlatform(),
                    CardPlatform(),
                    CardPlatform(),
                    CardPlatform(),
                    CardPlatform(),
                    CardPlatform(),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ), 
        ),
      )
   );
  }
}