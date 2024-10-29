import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/sub_service/local_storage/get_storage.dart';
import '../../services/sub_service/local_storage/local_storage_box/local_storage_box.dart';
import '../../theme/theme.dart';


class LocalizationController extends GetxController {
  late Locale language;
  String languageCode = '';
  changeLanguage(String codeLanguage) async {
    Locale locale = Locale(codeLanguage);
     LocalStorageService().setString(
        key: LocalStorageBox.languageKey, value: codeLanguage);
    Get.updateLocale(locale);
    language = Locale(codeLanguage);
    languageCode = language.languageCode;
    update();
    log("lang is $languageCode");
    if(languageCode=='ar'){
      Get.changeTheme(AppTheme.lightThemeArLang);
    }else{
      Get.changeTheme(AppTheme.lightsTheme);
    }
    log("local is ${language.languageCode}");
  }

  initializeLanguage() async {
    String lang =  LocalStorageService().getString(LocalStorageBox.languageKey);
    log("lang is $lang");
    if (lang == 'ar') {
      language = const Locale('ar');
      languageCode = 'AR';
    } else if (lang == 'en') {
      language = const Locale('en');
      languageCode = 'EN';
    } else {
      // language = Locale(Get.deviceLocale!.languageCode);
       language = const Locale('en');
      if (language.languageCode == 'ar') {
        languageCode = 'EN';
        language = const Locale('ar');
      } else {
        languageCode = 'AR';
        language = const Locale('en');
      }
      log("language is $languageCode  ${language.languageCode}");
    }
  }

  @override
  void onInit() async {
    initializeLanguage();
    super.onInit();
  }
}
