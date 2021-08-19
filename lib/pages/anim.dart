import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/controller/animation_controller.dart';

class AnimExample extends StatefulWidget {
  const AnimExample({Key? key}) : super(key: key);

  @override
  _AnimExampleState createState() => _AnimExampleState();
}

class _AnimExampleState extends State<AnimExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat(reverse: true);

  late final Animation<Offset> animation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0)).animate(
    animationController,
  );

  final AnimationCon _animationCon = Get.put(AnimationCon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<AnimationCon>(
      init: AnimationCon(),
      initState: (_) {},
      builder: (controller) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _animationCon.slide();
                  },
                  child: const Text("Move up")),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SlideTransition(
                    position: controller.animation,
                    child: Container(
                      height: 300,
                      color: Colors.red,
                    ),
                  )),
            ]);
      },
    ));
  }
}
