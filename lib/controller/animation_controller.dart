import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class AnimationCon extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void onInit() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn))
      ..addListener(() => update());
    animationController.forward();
    super.onInit();
  }

  void slidedown() {
    animationController.reverse();
  }
}
