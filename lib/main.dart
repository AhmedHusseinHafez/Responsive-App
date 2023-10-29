import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/core/enums/device_type.dart';
import 'package:responsive_app/core/functions/get_device_type.dart';
import 'package:responsive_app/core/ui_component/info_widget.dart';

void main() => runApp(MyApp()
    //DevicePreview(builder: (context) => MyApp())
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    print("screenHight: $screenHight");
    print("screenHight/2: ${screenHight / 2}");
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive App',
      //builder: (context, child) => DevicePreview.appBuilder(context, child),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Responsive App"),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Container(
              width: screenWidth / 1.2,
              height: screenHight / 2,
              color: Colors.teal,
              child: Center(
                child: InfoWidget(
                  builder: (context, deviceInfo) {
                    print("deviceType:${deviceInfo.deviceType}");
                    print("orientation:${deviceInfo.orientation}");
                    print("screenHeight:${deviceInfo.screenHeight}");
                    print("screenWidth:${deviceInfo.screenWidth}");
                    print("localHeight:${deviceInfo.localHeight}");
                    print("localWidth:${deviceInfo.localWidth}");

                    return SizedBox(
                      width: deviceInfo.localWidth / 2,
                      height: deviceInfo.localHeight / 2,
                      child: Container(
                        color: Colors.red,
                        child: Center(child: textToType(mediaQueryData: mediaQueryData))
                      ),
                    );
                  },
                ),
              )),
        ),
      ),
    );
  }

  Widget textToType({required MediaQueryData mediaQueryData}) {
    if (getDeviceType(mediaQueryData) == MyDeviceType.mobile) {
      return const Text("Mobile Type");
    }else if (getDeviceType(mediaQueryData) == MyDeviceType.desktop) {
      return const Text("desktop Type");
    }else if (getDeviceType(mediaQueryData) == MyDeviceType.tablet) {
      return const Text("tablet Type");
    }
    return const Text("UnKnown Type");
  }
}
