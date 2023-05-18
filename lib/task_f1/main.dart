import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const TextStyle myTextStyle = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold
  );

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
              title: const Text("App title!")
          ),
          floatingActionButton: Builder(
              builder: (context) {
                return FloatingActionButton(
                  onPressed: () => fabClicked(context),
                  backgroundColor: Colors.deepOrange,
                  child: const Icon(Icons.account_circle),
                );
              }
          ),
          body: const Center(
            child: Text(
              "Hello world!",
              style: myTextStyle,
            ),
          ) ,
        )
    );
  }

  void fabClicked(BuildContext context){
    debugPrint("FAB clicked!");
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("This is snackbar", style: myTextStyle)
        )
    );
  }
}

