import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class AppStarter {
  static void start() {
    runApp(DevicePreview(
      enabled: true,
      builder: (context) => const ECommerceApp(),
    ));
  }
}