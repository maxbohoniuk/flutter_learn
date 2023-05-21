import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.green,
              title: const Text("Questions")
          ),
          body: QuestionWidget(question: Question(category: "Cars", text: "bla bla?")),
        )
    );
  }
}

class QuestionWidget extends StatelessWidget {
  late final Question _question;

  QuestionWidget({Key? key, required Question question}) : super(key: key){
    _question = question;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(70, 300, 70, 300),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [BoxShadow(blurRadius: 15.0, spreadRadius: 3.0, color: Colors.black26)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 30,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                  ),
                  child: Center(child: Text(_question.category, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                flex: 70,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                  ),
                    child: Center(child: Text(_question.text, style: const TextStyle(fontSize: 17.0),))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Question{
  late final String category;
  late final String text;

  Question({required this.category,required this.text});

}
