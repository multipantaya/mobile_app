import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class RadioButtonCustom extends StatelessWidget {
  final String value;
  final String groupValue;
  final String title;
  final void Function(String? value)? onChanged;
  const RadioButtonCustom({super.key, required this.value, required this.groupValue, required this.title, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.red),
      child: RadioListTile.adaptive(
        value: value, 
        groupValue: groupValue, 
        title: Text(
          title,
          style: AppTheme.textStyles.white14F500,
        ),
        onChanged: onChanged,
        visualDensity: VisualDensity.compact,
        
      ),
    );
  }
}