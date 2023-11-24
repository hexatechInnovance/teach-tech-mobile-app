import 'package:flutter/material.dart';

class SnackBarMessage {
  String? message;
  Color? backgroundColor;

  SnackBarMessage({
    this.message,
    this.backgroundColor,
  });

  bool isNotEmpty() {
    return message != null && message != "";
  }
}
