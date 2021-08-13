import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var stated = false.obs;
  @override
  void onInit() {
    stated.value = true;

    super.onInit();
  }
}
