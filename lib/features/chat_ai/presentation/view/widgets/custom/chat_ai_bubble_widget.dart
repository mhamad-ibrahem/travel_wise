import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';

class ChatAiBubbleWidget extends StatelessWidget {
  const ChatAiBubbleWidget({super.key, this.isSender = true, required this.message});
  final bool isSender;
  final String message;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      color: isSender ? AppColors().lightGrey3! : AppColors.primaryColor,
      tail: true,
      isSender: isSender,
      textStyle: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(color: isSender ? null : AppColors().white),
    );
  }
}
