import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:mobile_app/core/core.dart';
import 'package:mobile_app/database/cart_data.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/ui/cubit/cubit.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';
import 'database/platform_data.dart';

void main() async{
  //INICIA HIVE
  await Hive.initFlutter();
  Hive.registerAdapter(SimpleTextModelAdapter());
  Hive.registerAdapter(PlansModelAdapter());
  Hive.registerAdapter(PlatformsModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(CartDataAdapter());
  Hive.registerAdapter(PlatformDataAdapter());
  await Hive.openBox<CartData>(MPYKeys.boxCart);
  await Hive.openBox<PlatformData>(MPYKeys.boxPlatforms);
  runApp(const MyApp());
}

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
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => PlanDetailsCubit()),
        BlocProvider(create: (context) => CartCubit()..init()),
      ],
      child: MaterialApp(
        builder: (_, child) => Portal(child: child!),
        title: 'Multi Pantaya',
        theme: ThemeData(fontFamily: 'Poppins',scaffoldBackgroundColor: AppTheme.colors.background),
        debugShowCheckedModeBanner: false,
        routes: AppRouter.routes,
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      )
    );
  }
}