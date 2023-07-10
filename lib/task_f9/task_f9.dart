import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/task_f9/screens/QuestionAddScreen.dart';
import 'package:flutter_learn/task_f9/screens/QuestionsScreen.dart';

import 'CustomScrollBehaviour.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static bool isLargeDevice = false;

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static Color randomColor() {
    int randomIndex = Random().nextInt(Colors.primaries.length);
    Color randomColor = Colors.primaries.elementAt(randomIndex).shade800;
    debugPrint("Random color is ${randomColor.toString()}");
    return randomColor;
  }
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _navBarScreens = [QuestionsScreen(), QuestionAddScreen()];
  int _navBarIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        checkDeviceSize(constraints.maxWidth, constraints.maxHeight);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehaviour(),
            home: Scaffold(
                bottomNavigationBar: Container(
                  padding: const EdgeInsets.fromLTRB(8, 1, 8, 10),
                  decoration: const BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10.0, spreadRadius: 3.0, color: Colors.black12)], color: Colors.transparent),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BottomNavigationBar(
                      items: const [BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"), BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add")],
                      currentIndex: _navBarIndex,
                      onTap: _navBarNavigate,
                      elevation: 10,
                    ),
                  ),
                ),
                body: IndexedStack(
                  index: _navBarIndex,
                  children: _navBarScreens,
                )
            )
        );
      },
    );
  }

  void refresh(){
    setState(() {});
  }


  void _navBarNavigate(int index){
    setState(() {
      _navBarIndex = index;
    });
  }

  void checkDeviceSize(double width, double height){
    debugPrint("Width = ${width} | Height = ${height}");
    MyApp.isLargeDevice = width >= 600.0 && height >= 1000.0;
  }
}