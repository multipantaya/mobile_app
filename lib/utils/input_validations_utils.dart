
import 'package:mobile_app/widgets/widgets.dart';

class InputValidationsUtils {
  InputValidationsUtils();

  bool validateControllers(String value, Map<SPValidators, dynamic> validators,Map<SPValidators, String> validationMessages) {
    bool isCorrect = true;
    if (InputWithShadow.validateInputs(value: value,validators: validators,validationMessages: validationMessages).isNotEmpty) {
      isCorrect = false;
    }
    return isCorrect;
  }

  static const validatorsOnlyRequiered = {
    SPValidators.required: true
  };
  static const validationMessagesOnlyRequiered = {
    SPValidators.required: 'El campo es obligatorio'
  };

  static const validatorsPinCode = {
    SPValidators.required: true
  };
  static const validationMessagesPinCode = {
    SPValidators.required: '*'
  };

  static const validatorsIban = {
    SPValidators.min: 24,
    SPValidators.max: 24,
  };
  static const validationMessagesIban = {
    SPValidators.min: 'El IBAN esta compuesto por 24 Caracteres',
    SPValidators.max: 'El IBAN esta compuesto por 24 Caracteres',
  };

  static const validatorsEmail = {
    SPValidators.email: true,
    SPValidators.required: true
  };
  static const validationMessagesEmail = {
    SPValidators.email: 'Correo electrónico invalido.',
    SPValidators.required: 'El campo es obligatorio'
  };
  static const validatorsPassword = {
    SPValidators.max: 20,
    SPValidators.password: true,
    SPValidators.required: true
  };
  static const validationMessagesPassword = {
    SPValidators.password:'Debe contener al menos 8 caracteres, una mayuscula, una minuscula y un numero',
    SPValidators.required: 'El campo es obligatorio',
    SPValidators.max: 'La contraseña debe tener máximo 20 caracteres'
  };

  static const validationMessagesRPassword = {
    SPValidators.equal: 'La contrasena no coincide',
    SPValidators.required: 'El campo es obligatorio',
    SPValidators.max: 'La contraseña debe tener máximo 20 caracteres',
  };

  static const namesValidator = {
    SPValidators.required: true,
    SPValidators.onlyLetters: true,
  };

  static const validationMessagesHashtag = {
    SPValidators.hashtag: 'No es un hashtag valido',
  };

  static const hashtagValidator = {
    SPValidators.hashtag: true,
  };

  static const namesValidationMessages = {
    SPValidators.required: 'Este campo es requerido',
    SPValidators.onlyLetters: 'El nombre no es válido',
  };

  static const addressValidator = {
    SPValidators.required: true,
    SPValidators.min: 5
  };

  static const addressValidationMessages = {
    SPValidators.required: 'Este campo es requerido',
    SPValidators.min: 'Minimo 5 caracteres'
  };

  static const urlValidator = {
    SPValidators.required: true,
    SPValidators.url: true,
  };

  static const urlValidationMessages = {
    SPValidators.required: 'Este campo es requerido',
    SPValidators.url: 'La url ingresa no es valida',
  };

}
