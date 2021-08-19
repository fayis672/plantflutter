import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/pages/anim.dart';
import 'package:profile_app/pages/home.dart';
import 'package:profile_app/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/profile', page: () => Profile()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/anim', page: () => const AnimExample())
      ],
      initialRoute: "/anim",
      home: const Home(),
    );
  }
}
