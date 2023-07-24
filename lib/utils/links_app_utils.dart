
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/presentation.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksAppUtils {
  LinksAppUtils();

  openLinkApp ({Uri? uri, String url = '', required BuildContext context}) async{
    if(url.isNotEmpty){
      try {
        await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication); 
      } catch (e) {
        print('no pude');
      }
    }else if (uri != null){
      try {
        await launchUrl(uri,mode: LaunchMode.externalApplication);
      } catch (e) {
        print('nooooooooo');
      }
    }
  }

  copydataWithSnackbar ({required BuildContext context, required String copy}) {
    Clipboard.setData(ClipboardData(text: copy)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          '$copy ${'copiado correctamente'}',
          style: AppTheme.textStyles.white14F400,
        ),
        backgroundColor: AppTheme.colors.primaryColor,
        duration: const Duration(seconds: 1),
      ));
    });
  }

  String? pasteText(){
    String? text;
    Clipboard.getData(Clipboard.kTextPlain).then((value) {
      if (value?.text != null) {
        text = value!.text!;
      }
    });
    return text;
  }
}