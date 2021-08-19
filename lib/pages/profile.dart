import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:profile_app/controller/animation_controller.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final AnimationCon _animationCon = Get.put(AnimationCon());

  final List<String> _bootmImages = const [
    'asset/images/bg2.jpg',
    'asset/images/bg4.jpg',
    'asset/images/bg3.jpg',
    'asset/images/bg1.jpg',
    'asset/images/bg5.jpg',
  ];
  final List<String> _images = const [
    'asset/images/bg1.jpg',
    'asset/images/bg2.jpg',
    'asset/images/bg3.jpg',
    'asset/images/bg4.jpg',
    'asset/images/bg5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Hero(
          tag: "img" + Get.arguments.toString(),
          child: Image.asset(
            _images[Get.arguments],
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
            child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 40, right: 40),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Hero(
                  tag: "avatar" + Get.arguments.toString(),
                  child: CircleAvatar(
                    backgroundImage:
                        Image.asset('asset/images/avatar.png').image,
                    radius: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Hero(
                  tag: "first_name" + Get.arguments.toString(),
                  child: const Text(
                    "Teemu",
                    style: TextStyle(
                        color: Colors.white, wordSpacing: 5, fontSize: 40),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Hero(
                  tag: "seconde_name" + Get.arguments.toString(),
                  child: const Text(
                    "Paaneneen",
                    style: TextStyle(
                        color: Colors.white, wordSpacing: 5, fontSize: 40),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "@xteemu",
                  style: TextStyle(
                    color: Colors.white70,
                    wordSpacing: 5,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(),
                      Text(
                        "Stockholm Sweeden",
                        style: TextStyle(
                          color: Colors.white,
                          wordSpacing: 5,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "instagram.com/teemography",
                        style: TextStyle(
                          color: Colors.white,
                          wordSpacing: 5,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )),
        Align(
            alignment: Alignment.bottomCenter,
            child: GetBuilder<AnimationCon>(
              init: AnimationCon(),
              initState: (_) {},
              builder: (controller) {
                return SlideTransition(
                  position: controller.animation,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 8;
                      if (details.delta.dy > sensitivity) {
                        _animationCon.slidedown();
                      } else if (details.delta.dy < -sensitivity) {
                        // Up Swipe
                      }
                    },
                    child: Container(
                        height: 250,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              const TabBar(
                                padding: EdgeInsets.all(20),
                                indicatorColor: Colors.transparent,
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                unselectedLabelStyle: TextStyle(fontSize: 13),
                                tabs: [
                                  Text("Photos"),
                                  Text("Likes"),
                                  Text("Collection")
                                ],
                                labelColor: Colors.black,
                              ),
                              Expanded(
                                  child: TabBarView(children: [
                                ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 20,
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(16),
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(13),
                                        child: Image.asset(
                                          _bootmImages[index],
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }),
                                const Center(
                                  child: Text("39 Likes",
                                      style: TextStyle(fontSize: 30)),
                                ),
                                const Center(
                                    child: Text("This is collection",
                                        style: TextStyle(fontSize: 30)))
                              ]))
                            ],
                          ),
                        )),
                  ),
                );
              },
            )),
      ],
    ));
  }
}

void showBottom(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 200,
          color: Colors.white,
        );
      });
}
