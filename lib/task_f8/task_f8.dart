import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/task_f8/QuestionsScreen.dart';

import 'CustomScrollBehaviour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool isLargeDevice = false;

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return LayoutBuilder(
      builder: (context, constraints) {
        checkDeviceSize(constraints.maxWidth, constraints.maxHeight);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: QuestionsScreen(),
          scrollBehavior: CustomScrollBehaviour(),
        );
      },
    );
  }

  void checkDeviceSize(double width, double height){
    debugPrint("Width = ${width} | Height = ${height}");
    MyApp.isLargeDevice = width >= 600.0 && height >= 1000.0;
  }

  static Color randomColor() {
    int randomIndex = Random().nextInt(Colors.primaries.length);
    Color randomColor = Colors.primaries.elementAt(randomIndex).shade800;
    debugPrint("Random color is ${randomColor.toString()}");
    return randomColor;
  }
}