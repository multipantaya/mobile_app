import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/presentation.dart';

enum SPValidators {
  required,
  min,
  max,
  email,
  onlyLetters,
  url,
  password,
  equal,
  maxValue,
  minValue,
  hashtag
}

class InputWithShadow extends StatefulWidget {

  final String? focusNext, initialValue, helperText;
  final String labelText, hintText, errorText, urlImg;

  final Color? borderColor;

  final Function? onTap;
  final bool prefix, autofocus, obscureText, readOnly;

  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final Map<SPValidators, String>? validationMessages;
  final Map<SPValidators, dynamic>? validators;
  final FocusNode? focus;
  final TextEditingController? controller;
  final TextAlign textAling;
  final double? helperHeight;
  final int? maxLenght, maxLines, minLines, helperMaxLines, errorMaxLines;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final double borderRadius;

  final TextStyle? textStyle, labelStyle, hintStyle;
  final BoxConstraints? constraints;

  final void Function(String)? onSubmitted;
  final void Function(String)? onChange;
  final void Function(String)? onCorrect;

  final TextCapitalization textCapitalization;

  final void Function()? onEditingComplete;
  const InputWithShadow({
    super.key,
    this.textStyle,
    this.labelStyle,
    this.initialValue,
    this.constraints,
    this.suffixIcon,
    this.onSubmitted,
    this.focusNext,
    this.errorText = '',
    this.labelText = "",
    this.hintText = "",
    this.helperText,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.contentPadding,
    this.urlImg = "",
    this.prefix = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textAling = TextAlign.start,
    this.textInputAction = TextInputAction.done,
    this.validationMessages,
    this.validators,
    this.maxLenght,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderRadius = 10,
    this.borderColor,
    this.prefixWidget,
    this.onEditingComplete,
    this.onCorrect,
    this.onChange,
    this.controller,
    this.helperHeight = 35,
    this.helperMaxLines = 2,
    this.errorMaxLines = 3,
    this.textCapitalization = TextCapitalization.none, this.focus, this.hintStyle,
  });

  static String validateInputs(
      {Map<SPValidators, dynamic>? validators,
      String value = '',
      Map<SPValidators, String>? validationMessages}) {
    String error = '';

    if (validators != null) {
      final keys = validators.keys.toList();

      for (SPValidators key in keys) {
        bool itHasError = false;
        if (key == SPValidators.required && validators[key] && value.isEmpty) {
          itHasError = true;
        } else if (key == SPValidators.min && value.length < validators[key]) {
          itHasError = true;
        } else if (key == SPValidators.max && value.length > validators[key]) {
          itHasError = true;
        } else if (key == SPValidators.email && emailValidator(value)) {
          itHasError = true;
        } else if (key == SPValidators.hashtag && hashtagValidator(value)) {
          itHasError = true;
        } else if (key == SPValidators.url && urlValidator(value)) {
          itHasError = true;
        } else if (key == SPValidators.password && passwordValidator(value)) {
          itHasError = true;
        } else if (key == SPValidators.equal &&
            ((value.toString() != validators[key].toString()) ||
                validators[key].toString().isEmpty)) {
          itHasError = true;
        } else if (key == SPValidators.password && passwordValidator(value)) {
          itHasError = true;
        } else if (key == SPValidators.equal &&
            ((value.toString() != validators[key].toString()) ||
                validators[key].toString().isEmpty)) {
          itHasError = true;
        } else if (key == SPValidators.maxValue &&
            maxValueValidator(value, validators[key])) {
          itHasError = true;
        } else if (key == SPValidators.minValue &&
            minValueValidator(value, validators[key])) {
          itHasError = true;
        } else if (key == SPValidators.onlyLetters &&
            onlyLettersValidator(value)) {
          itHasError = true;
        }
        if (itHasError) {
          error = validationMessages != null
              ? validationMessages[key] ?? ''
              : 'Error';
        }
      }
    }
    return error;
  }

  static bool passwordValidator(String value) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
    if (passwordRegex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool minValueValidator(String value, dynamic validator) {
    if (value != "" && validator is int) {
      if (int.parse(value) < validator) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  static bool maxValueValidator(String value, dynamic validator) {
    if (value != "" && validator is int) {
      if (int.parse(value) > validator) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  static bool urlValidator(String value) {
    RegExp urlRegex = RegExp(r'(https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?');
    if (urlRegex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool hashtagValidator(String value) {
    RegExp hashtagRegex = RegExp(r'^#(\w+)(\s#(\w+))*$');
    if (hashtagRegex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool onlyLettersValidator(String value) {
    RegExp lettersRegex = RegExp(
        r'^[a-zA-ZàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕäëïöüÿÄËÏÖÜŸçÇßØøÅåÆæœñ ]+$');
    return !lettersRegex.hasMatch(value.trim());
  }

  static bool emailValidator(String value) {
    RegExp exp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (exp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  State<InputWithShadow> createState() => _InputWithShadowState();
}

class _InputWithShadowState extends State<InputWithShadow> {
  bool isFirstEdited = false;
  String errorText = '';

  @override
  void initState() {
    super.initState();
    isFirstEdited = false;

    errorText = '';

    if (widget.controller != null && widget.initialValue != null) {
      widget.controller!.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
            color: widget.borderColor ?? AppTheme.colors.primaryColor));

    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: widget.labelText.isNotEmpty
                  ? const EdgeInsets.only(top: 20)
                  : null,
              child: TextFormField(
                controller: widget.controller,
                inputFormatters: widget.keyboardType == TextInputType.number
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : [],
                textInputAction: widget.textInputAction,
                focusNode: widget.focus,
                autofocus: widget.autofocus,
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
                readOnly: widget.readOnly,
                textAlign: widget.textAling,
                maxLength: widget.maxLenght,
                maxLines: widget.maxLines,
                textCapitalization: widget.textCapitalization,
                onChanged: (s) {
                  errorText = '';
                  if (!isFirstEdited) {
                    isFirstEdited = true;
                  }
                  errorText = InputWithShadow.validateInputs(
                      validators: widget.validators,
                      value: s,
                      validationMessages: widget.validationMessages);
                  setState(() {});

                  if (errorText.isEmpty && isFirstEdited) {
                    widget.onCorrect?.call(s);
                  }
                  widget.onChange?.call(s);
                },
                decoration: InputDecoration(
                    prefixIcon: widget.prefixWidget,
                    helperStyle:AppTheme.textStyles.primaryColor14F500.copyWith(color: AppTheme.colors.primaryColor),
                    counterStyle: const TextStyle(height: 0, fontSize: 0),
                    counterText: '',
                    hintText: widget.hintText,
                    errorMaxLines: widget.errorMaxLines,
                    constraints: widget.constraints ?? const BoxConstraints(maxHeight: 45),
                    isCollapsed: true,
                    contentPadding: widget.contentPadding ??
                        const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 15),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle:widget.hintStyle ?? AppTheme.textStyles.primaryColor12F500.copyWith(color: AppTheme.colors.background),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(color: AppTheme.colors.white),
                    ),
                    border: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    labelText: widget.labelText,
                    labelStyle: widget.labelStyle ?? AppTheme.textStyles.primaryColor14F500.copyWith(color: AppTheme.colors.primaryColor),
                    suffixIcon: widget.suffixIcon),
                onEditingComplete: widget.onEditingComplete,
                onTap: widget.onTap == null
                    ? null
                    : () async {
                        widget.onTap!();
                      },
                onFieldSubmitted: widget.onSubmitted,
                style: widget.textStyle ??  AppTheme.textStyles.primaryColor14F500.copyWith(color: AppTheme.colors.primaryColor),
              ),
            ),
            (errorText.isNotEmpty)
                ? const SizedBox(height: 8)
                : const SizedBox.shrink(),
            if (widget.helperText?.isNotEmpty ?? false)
              Container(
                height: widget.helperHeight,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  widget.helperText!,
                  textAlign: TextAlign.left,
                  maxLines: widget.helperMaxLines,
                  style: AppTheme.textStyles.primaryColor12F500.copyWith(color: AppTheme.colors.background),
                ),
              ),
            if (errorText.isNotEmpty)
              Container(
                //height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  errorText,
                  textAlign: TextAlign.left,
                  maxLines: widget.errorMaxLines,
                  style: TextStyle(
                      color: AppTheme.colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
