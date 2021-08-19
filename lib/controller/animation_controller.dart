import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class AnimationCon extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(
      animationController,
    )..addListener(() => update());
    super.onInit();
  }

  void slide() {
    if (animationController.isDismissed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}
