import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static List<Question> questions = [ Question.randomQuestion() ];
  static const SizedBox horizontalDivider = SizedBox(width: 20,);
  static const SizedBox verticalDivider = SizedBox(height: 20,);
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
          floatingActionButton: FloatingActionButton(
            onPressed: () => questions.add(Question.randomQuestion()),
            backgroundColor: Colors.deepOrangeAccent,
            child: const Icon(Icons.add),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Builder(
                builder: (context) {
                  final Size size = MediaQuery.of(context).size;
                  debugPrint("Width = ${size.width} | Height = ${size.height}");
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: isLargeDevice(size) ? Axis.horizontal : Axis.vertical,
                    // physics: const BouncingScrollPhysics(),
                    child: buildScrollChild(isLargeDevice(size)),
                  );
                }
              ),
            ),
          ),
        )
    );
  }

  Widget buildScrollChild(bool isLargeDevice){
    if(isLargeDevice){
      return Row(
        children: getChildren(horizontalDivider),
      );
    }
    return Column(
      children: getChildren(verticalDivider),
    );
  }

  List<Widget> getChildren(SizedBox divider){
    List<Widget> children = [];
    for (Question element in questions) {
      children.add(QuestionWidget(question: element));
      children.add(divider);
    }
    children.removeLast();
    return children;
  }

  bool isLargeDevice(Size size){
    return size.width >= 500.0 && size.height >= 1000.0;
  }
}

class QuestionWidget extends StatelessWidget {
  late final Question _question;

  QuestionWidget({Key? key, required Question question}) : super(key: key){
    _question = question;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400, maxWidth: 300),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(blurRadius: 5.0, spreadRadius: 3.0, color: Colors.black26)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: _question.color,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
            ),
            child: Center(child: Text(_question.category.name, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),)),
          ),
          Expanded(
            child: Container(
                color: Colors.white,
                child: Center(child: Text(_question.text, style: const TextStyle(fontSize: 17.0), textAlign: TextAlign.center,))
            ),
          ),
          FadeInImage(
            placeholder: Image.asset("assets/loading.gif").image,
            image: NetworkImage(_question.imageUrl),
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 15,)
        ],
      ),
    );
  }
}

class Question{
  static final List<Question> questionsDb = [
    Question(
        category: QuestionCategory.Cars,
        text: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla v bla bla bla bla bla bla bla bla bla bla bla bla bla bla v?",
        imageUrl: "https://super-cars.pl/wp-content/uploads/2022/02/bmw-1620x1080.jpg",
    ),
    Question(
        category: QuestionCategory.Space,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://as2.ftcdn.net/v2/jpg/02/79/03/07/1000_F_279030771_pMo4u606vF6mscufYoroxD2r1Wt5zmPe.jpg",
    ),
    Question(
        category: QuestionCategory.Football,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://www.fcbarcelona.com/fcbarcelona/photo/2022/10/23/95c05ed8-7b4a-4563-87ea-9085f9621385/VIC_1659.jpg",
    )
  ];
  late final QuestionCategory category;
  late final String text;
  late final String imageUrl;
  late Color color;

  Question({required this.category,required this.text, required this.imageUrl}){
    color = _randomColor();
  }

  static Color _randomColor(){
    int randomIndex = Random().nextInt(Colors.primaries.length);
    Color randomColor = Colors.primaries.elementAt(randomIndex);
    debugPrint("Random color is ${randomColor.toString()}");
    return randomColor;
  }

  static Question randomQuestion(){
    int randomIndex = Random().nextInt(questionsDb.length);
    Question randomQuestion = questionsDb[randomIndex];
    debugPrint("Random question is ${randomQuestion.category}");
    return randomQuestion;
  }

}

enum QuestionCategory{
  Cars, Football, Space
}
