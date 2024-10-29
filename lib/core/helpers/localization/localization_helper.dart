

import '../../services/app_services.dart';

class LocalizationHelper {
  static String translate({required String enText, required String arText}) {
    if (AppServices.localizationController?.language.languageCode == 'ar') {
      return arText;
    } else {
      return enText;
    }
  }

  static bool isEnglishLanguage() {
    if (AppServices.localizationController?.language.languageCode == 'ar') {
      return false;
    } else {
      return true;
    }
  }
}
