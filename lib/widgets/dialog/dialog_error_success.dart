// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:presentation/presentation.dart';

// enum TypeDialog {succes, custom, error}

// class DialogErrorSuccess extends StatelessWidget {
//   final TypeDialog typeDialog;
//   final String? titleI;
//   final String? contentI;
//   final String? textButtonI;
//   final IconData? iconI;
//   final void Function()? onPressedGreen;
//   final void Function()? onPressedRed;
//   const DialogErrorSuccess({super.key, required this.typeDialog, this.titleI, this.contentI, this.textButtonI, this.iconI, this.onPressedGreen, this.onPressedRed});

//   @override
//   Widget build(BuildContext context) {
//     String title = '';
//     String content = '';
//     IconData icon = FontAwesomeIcons.faceSmile;
//     String textButtonGreen = '';
//     String textButtonRed = '';
//     switch (typeDialog) {
//       case TypeDialog.succes:
//         title = 'Todo fue un exito!';
//         content = 'Tu solicitud se proceso de forma satisfactoria.';
//         icon = FontAwesomeIcons.faceSmileWink;
//         textButtonGreen = 'Cerrar';
//         break;
//       case TypeDialog.error:
//         title = 'Lo sentimos se presento un error';
//         content = 'Verifica tu conexión a internet o intenta más tarde. Si el error persiste comunícate con nosotros, estamos para ayudarte.';
//         icon = FontAwesomeIcons.faceFrownOpen;
//         textButtonGreen = 'Reintentar';
//         textButtonRed = 'Cerrar';
//         break;
//       case TypeDialog.custom:
//         title = titleI!;
//         content = contentI!;
//         icon = iconI!;
//         textButtonGreen = textButtonI!;
//         break;
//       default:
//     }
//     return Dialog(
//       backgroundColor: AppTheme.colors.transparent,
//       child: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppTheme.colors.white,
//             borderRadius: BorderRadius.circular(15)
//           ),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: typeDialog == TypeDialog.error ? AppTheme.colors.red : AppTheme.colors.primaryColor,
//                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 5,),
//                     Icon(icon, color: AppTheme.colors.white,size: 40,),
//                     const SizedBox(height: 10,),
//                     AutoSizeText(
//                       title,
//                       textAlign: TextAlign.center,
//                       minFontSize: 14,
//                       maxLines: 1,
//                       style: AppTheme.textStyles.white16F500.copyWith(fontSize: 18),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Text(
//                   content,
//                   style: AppTheme.textStyles.darkGray14,
//                   textAlign: TextAlign.justify,
//                 ),
//               ),
//               if(typeDialog == TypeDialog.error)
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       AppButtonMiniCancel(
//                         text: textButtonRed,
//                         onPressed: onPressedRed,
//                       ),

//                       AppButtonMini(
//                         onPressed: onPressedGreen,
//                         text: textButtonGreen
//                       )
//                     ],
//                   ),
//                 ),
//               if(typeDialog != TypeDialog.error)
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: AppButton(
//                     name: textButtonGreen,
//                     onPressed: onPressedGreen,
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }