import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/size/app_size.dart';

class SplashScreenEffect extends StatefulWidget {
  const SplashScreenEffect({super.key, required this.child});
  final Widget child;
  @override
  State<SplashScreenEffect> createState() => _SplashScreenEffectState();
}

class _SplashScreenEffectState extends State<SplashScreenEffect>
    with SingleTickerProviderStateMixin {
  double ballY = 0;
  double widthVal = 50;
  double heightVal = 50;
  double bottomVal = 500;
  bool add = false;
  bool showShadow = false;
  int times = 0;
  bool showComic = false;

  late AnimationController _controller;
  playAnimation() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700))
          ..addListener(
            () {
              if (add) {
                ballY += 15;
              } else {
                ballY -= 15;
              }
              if (ballY <= -200) {
                times += 1;
                add = true;
                showShadow = true;
              }
              if (ballY >= 0) {
                add = false;
                showShadow = false;
                widthVal += 50;
                heightVal += 50;
                bottomVal -= 200;
              }
              if (times == 3) {
                showShadow = false;
                widthVal = AppSize.screenWidth(context: context);
                heightVal = AppSize.screenHeight(context: context);
                Timer(const Duration(milliseconds: 200), () {
                  setState(() {
                    showComic = true;
                  });
                });
                _controller.stop();
              }
              setState(() {});
            },
          );
    _controller.repeat();
  }

  @override
  void initState() {
    super.initState();
    playAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          bottom: bottomVal,
          duration: const Duration(milliseconds: 600),
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0, ballY),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: times == 3 ? 5 : 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    width: widthVal,
                    height: heightVal,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primaryColor),
                  ),
                ),
              ),
              if (showShadow)
                Container(
                  width: 50,
                  height: 3,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                      borderRadius: BorderRadius.circular(100)),
                )
            ],
          ),
        ),
        if (showComic) widget.child
      ],
    );
  }
}
