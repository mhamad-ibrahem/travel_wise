import 'package:flutter/material.dart';

mixin GreyLevelsColorMixin {
  Color get grey => const Color(0xFFcbcbcb);
  Color get lightGrey => const Color.fromARGB(255, 183, 177, 177);
  Color? get lightGrey2 =>  Colors.grey[200];
   Color? get lightGrey3 =>  Colors.grey[100];
  Color get darkGrey => const Color(0xFF8f8f8f);
}
