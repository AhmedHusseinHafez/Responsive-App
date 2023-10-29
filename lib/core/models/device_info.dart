import 'package:flutter/material.dart';

import '../enums/device_type.dart';

class MyDeviceInfo {
  final Orientation orientation;
  final MyDeviceType deviceType;
  final double screenHeight;
  final double screenWidth;
  final double localWidth;
  final double localHeight;

  MyDeviceInfo({required this.orientation, required this.deviceType, required this.screenHeight,
      required this.screenWidth, required this.localWidth, required this.localHeight});
}
