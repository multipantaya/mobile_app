import 'package:flutter/material.dart';
import 'package:mobile_app/ui/information/information.dart';
import 'package:mobile_app/widgets/main_appbar.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(enableActions: false,enableInfo: false),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: InformationContent(),
        ),
      ),
    );
  }
}