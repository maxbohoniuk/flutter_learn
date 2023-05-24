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
          body: QuestionWidget(question: Question(category: "Cars", text: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla v bla bla bla bla bla bla bla bla bla bla bla bla bla bla v?")),
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
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 400),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [BoxShadow(blurRadius: 15.0, spreadRadius: 3.0, color: Colors.black26)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                ),
                child: Center(child: Text(_question.category, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),)),
              ),
              Expanded(
                child: Container(
                    color: Colors.white,
                    child: Center(child: Text(_question.text, style: const TextStyle(fontSize: 17.0), textAlign: TextAlign.center,))
                ),
              ),
              FadeInImage(
                placeholder: Image.asset("assets/loading.gif").image,
                image: const NetworkImage("https://mediapool.bmwgroup.com/cache/P9/202009/P90399203/P90399203-the-new-bmw-m4-competition-coup-09-2020-600px.jpg"),
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 15,)
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
