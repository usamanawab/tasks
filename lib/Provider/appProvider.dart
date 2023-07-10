
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  final ValueNotifier<Locale> _localeNotifier = ValueNotifier(Locale('en'));

  Locale get locale => _localeNotifier.value;

  set locale(Locale locale) {
    _localeNotifier.value = locale;
    notifyListeners();
  }
}