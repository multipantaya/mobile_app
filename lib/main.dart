import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:mobile_app/core/core.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/ui/cubit/cubit.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:presentation/presentation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppLayoutCubit()),
        BlocProvider(create: (context) => HomeCubit()..initPlatform()),
        BlocProvider(create: (context) => PlanDetailsCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        builder: (_, child) => Portal(child: child!),
        title: 'Multi Pantaya',
        theme: ThemeData(fontFamily: 'Poppins',scaffoldBackgroundColor: AppTheme.colors.background),
        debugShowCheckedModeBanner: false,
        routes: AppRouter.routes,
      )
    );
  }
}