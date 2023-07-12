import 'package:flutter/material.dart';
import 'package:mobile_app/ui/home/home.dart';

class AppLayout extends StatelessWidget {
  static String routeName = "app_view";
  const AppLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return HomeView();
  }
}