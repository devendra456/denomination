import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DenomiModel {
   int amount;
   TextEditingController controller;
   String? hintText;
   RxBool showClearButton;
   RxInt value;

  DenomiModel({
    required this.amount,
    required this.controller,
    this.hintText,
    required this.showClearButton,
    required this.value,
  });
}
