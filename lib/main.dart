import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:mobile_app/core/core.dart';
import 'package:mobile_app/ui/cubit/cubit.dart';
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