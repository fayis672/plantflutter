import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
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
        body: ListView.builder(
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Hero(
              tag: "img" + index.toString(),
              child: Image.asset(
                _images[index],
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          timeDilation = 3.0;
                          Get.toNamed('/profile', arguments: index);
                        },
                        child: Hero(
                          child: CircleAvatar(
                            backgroundImage:
                                Image.asset('asset/images/avatar.png').image,
                          ),
                          tag: "avatar" + index.toString(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Hero(
                        tag: "first_name" + index.toString(),
                        child: const Text(
                          "Teemu",
                          style: TextStyle(color: Colors.white, wordSpacing: 5),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Hero(
                        tag: "seconde_name" + index.toString(),
                        child: const Text(
                          "Paaneneen",
                          style: TextStyle(color: Colors.white, wordSpacing: 5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}
