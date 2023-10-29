import 'package:flutter/material.dart';
import 'package:responsive_app/core/enums/device_type.dart';

MyDeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 950) {
    return MyDeviceType.desktop;
  } else if (width >= 600) {
    return MyDeviceType.tablet;
  } else {
    return MyDeviceType.mobile;
  }
}
