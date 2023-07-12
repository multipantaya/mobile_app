import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class HomeViewTemplate extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final String titlePage;
  final IconData icon;
  final bool isAlingToLeft;
  const HomeViewTemplate({
    super.key,
    required this.child,
    this.onPressed,
    this.icon = Icons.cancel_outlined, required this.titlePage, this.isAlingToLeft = false
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppTheme.gradients.primarylinearGradiant,
          begin: Alignment.topCenter
        )
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              margin: EdgeInsets.only(top: size.height * 0.1),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppTheme.colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: Column(
                children: [
                  TitleTextCustom(title: titlePage, isSpacing: true,),
                  const SizedBox(height: 5,),
                  Divider(color: AppTheme.colors.primaryColor),
                  const SizedBox(height: 5,),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        child
                      ],
                    )
                  )
                ],
              )
            ),
            Positioned(
              right: isAlingToLeft ? null : 5,
              left: isAlingToLeft ? 5 : null,
              top: size.height * 0.11,
              child: IconButtonCustom(
                icon: icon,
                onPressed: onPressed,
              )
            )
          ],
        ),
      ),
    );
  }
}