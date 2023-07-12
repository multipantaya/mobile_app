import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/main_appbar.dart';
import 'package:presentation/presentation.dart';


class HomeView extends StatelessWidget {
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              '¡Disfruta del Entretenimiento sin Límites!',
              textAlign: TextAlign.center,
              style: AppTheme.textStyles.titleText,
            ),
          ],
        ), 
      )
   );
  }
}