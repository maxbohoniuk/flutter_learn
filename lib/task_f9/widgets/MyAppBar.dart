import 'package:flutter/material.dart';

class MyAppBar extends AppBar{

  MyAppBar({super.key, required String titleText, List<Widget>? actions}) : super(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(titleText),
      titleTextStyle: const TextStyle(color: Colors.blue, fontSize: 20),
      actions: actions,
      actionsIconTheme: const IconThemeData(color: Colors.blue),
      iconTheme: const IconThemeData(color: Colors.blue)
  );


}