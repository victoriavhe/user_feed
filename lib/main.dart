import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:user_feed/app/presentation/app_root.dart';

void main() async {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => AppRoot(),
    ),
  );
}