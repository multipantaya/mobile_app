
class StringsUtils {
  static const String _regExpUrl =r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)';

  bool isValidUrl(String url) {
    if (url.isEmpty) return false;

    final regExp = RegExp(_regExpUrl);

    return regExp.hasMatch(url);
  }

}
