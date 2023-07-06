import 'package:flutter/material.dart';

class MyTextEditingControllerList {
  final List<TextEditingController> controllers;
  final List<String> fieldList; // Added fieldList property
  MyTextEditingControllerList(this.fieldList)
      : controllers =
            fieldList.map((field) => TextEditingController()).toList();

  Map<String, dynamic> getData() {
    Map<String, dynamic> result = {};
    for (int i = 0; i < controllers.length; i++) {
      result[fieldList[i]] = controllers[i].text;
    }
    return result;
  }

  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
  }
}
