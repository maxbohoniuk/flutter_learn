import 'package:flutter/material.dart';
import 'package:flutter_learn/task_f7/QuestionsScreen.dart';

import 'CustomScrollBehaviour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool _isLargeDevice = false;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return LayoutBuilder(
      builder: (context, constraints) {
        checkDeviceSize(constraints.maxWidth, constraints.maxHeight);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: QuestionsScreen(isLargeDevice: _isLargeDevice,),
          scrollBehavior: CustomScrollBehaviour(),
        );
      },
    );
  }

  void checkDeviceSize(double width, double height){
    debugPrint("Width = ${width} | Height = ${height}");
    MyApp._isLargeDevice = width >= 600.0 && height >= 1000.0;
  }
}