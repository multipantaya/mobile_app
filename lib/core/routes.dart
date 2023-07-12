import 'package:flutter/material.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/ui/splash/slpash_view.dart';
import 'package:mobile_app/widgets/widgets.dart';
class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext contex) =>  const SplashPage(),
   HomeView.routeName: (BuildContext contex) => HomeView(),
   AppLayout.routeName: (BuildContext contex) => const AppLayout(),
  };
}
