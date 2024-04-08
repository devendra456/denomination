import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int count2000 = 0;
  int count500 = 0;
  int count200 = 0;
  int count100 = 0;
  int count50 = 0;
  int count20 = 0;
  int count10 = 0;
  int count5 = 0;
  int count2 = 0;
  int count1 = 0;

  TextEditingController textEditingController2000 = TextEditingController();
  TextEditingController textEditingController500 = TextEditingController();
  TextEditingController textEditingController200 = TextEditingController();
  TextEditingController textEditingController100 = TextEditingController();
  TextEditingController textEditingController50 = TextEditingController();
  TextEditingController textEditingController20 = TextEditingController();
  TextEditingController textEditingController10 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();

  RxInt count = 0.obs;

  void updateCount() {
    final c = count2000 +
        count500 +
        count200 +
        count100 +
        count50 +
        count20 +
        count10 +
        count5 +
        count2 +
        count1;

    count.value = c;
  }

  void clearAll() {
    textEditingController2000.clear();
    textEditingController500.clear();
    textEditingController200.clear();
    textEditingController100.clear();
    textEditingController50.clear();
    textEditingController20.clear();
    textEditingController10.clear();
    textEditingController5.clear();
    textEditingController2.clear();
    textEditingController1.clear();
    count.value = 0;
  }
}
