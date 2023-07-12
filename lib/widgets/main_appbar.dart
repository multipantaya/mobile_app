import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:presentation/presentation.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key, this.activateNotifications = true,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
      super(key: key);
  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  final Size preferredSize;
  final bool activateNotifications;
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.colors.background,
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MediaUtils().getImageWidget(
            MPYImages.logo,
            useFileImage: false,
            width: 30,
            height: 30,
            fit: BoxFit.contain,
            color: AppTheme.colors.white.withOpacity(0.5)
          ),
          const SizedBox(width: 5,),
          AutoSizeText(
            'MultiPantaya',
            maxLines: 1,
            minFontSize: 14,
            style: AppTheme.textStyles.titleTextAppbar
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            
          }, 
          icon: Icon(Icons.shopping_bag_outlined),
          visualDensity: VisualDensity.compact,
          splashRadius: 18,
        )
      ],
    );
  }
}
