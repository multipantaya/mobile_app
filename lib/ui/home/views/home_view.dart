import 'package:flutter/material.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/widgets/main_appbar.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: HomeContent()
   );
  }
}