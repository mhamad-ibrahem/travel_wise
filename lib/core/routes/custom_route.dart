import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRoutePage {
  static GetPage getPage(
      {Transition? transition,
      required String routeName,
      required Widget page,
      Bindings? binding}) {
    return GetPage(
        name: routeName,
        page: () => page,
        transition: transition ?? Transition.fade,
        binding: binding,
        transitionDuration: const Duration(milliseconds: 300));
  }
}
