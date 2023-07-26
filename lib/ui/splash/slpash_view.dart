import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/utils/media_utils.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        AppLayout.routeName,
      );
    });
  }

  @override
  void didChangeDependencies() {
    context.read<HomeCubit>().initPlatform(AppLocalizations.of(context)!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: MediaUtils().getImageWidget(
              MPYImages.logo,
              useFileImage: false,
              width: size.width * 0.35,
              height: size.width * 0.35,
              fit: BoxFit.contain
            )
          ),

          Positioned(
            top: size.height * 0.55,
            right: size.width * 0.45,
            child: SpinKitCircle(
              color: AppTheme.colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
