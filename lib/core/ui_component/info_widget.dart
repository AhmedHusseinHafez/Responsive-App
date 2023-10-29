import 'package:flutter/material.dart';
import 'package:responsive_app/core/functions/get_device_type.dart';
import 'package:responsive_app/core/models/device_info.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.builder});
  final Widget Function(
    BuildContext context,
    MyDeviceInfo deviceInfo,
  ) builder;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        MediaQueryData mediaQueryData = MediaQuery.of(context);
        var deviceInfo = MyDeviceInfo(
            orientation: mediaQueryData.orientation,
            deviceType: getDeviceType(mediaQueryData),
            screenHeight: mediaQueryData.size.height,
            screenWidth: mediaQueryData.size.width,
            localWidth: constraints.maxWidth,
            localHeight: constraints.maxHeight);
        return builder(context, deviceInfo);
      },
    );
  }
}
