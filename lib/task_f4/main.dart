import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static List<Question> questions = [
    Question(
        category: QuestionCategory.Cars,
        text: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla v bla bla bla bla bla bla bla bla bla bla bla bla bla bla v?",
        imageUrl: "https://super-cars.pl/wp-content/uploads/2022/02/bmw-1620x1080.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Space,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://as2.ftcdn.net/v2/jpg/02/79/03/07/1000_F_279030771_pMo4u606vF6mscufYoroxD2r1Wt5zmPe.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Football,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://www.fcbarcelona.com/fcbarcelona/photo/2022/10/23/95c05ed8-7b4a-4563-87ea-9085f9621385/VIC_1659.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Cars,
        text: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla v bla bla bla bla bla bla bla bla bla bla bla bla bla bla v?",
        imageUrl: "https://super-cars.pl/wp-content/uploads/2022/02/bmw-1620x1080.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Space,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://as2.ftcdn.net/v2/jpg/02/79/03/07/1000_F_279030771_pMo4u606vF6mscufYoroxD2r1Wt5zmPe.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Football,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://www.fcbarcelona.com/fcbarcelona/photo/2022/10/23/95c05ed8-7b4a-4563-87ea-9085f9621385/VIC_1659.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Cars,
        text: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla v bla bla bla bla bla bla bla bla bla bla bla bla bla bla v?",
        imageUrl: "https://super-cars.pl/wp-content/uploads/2022/02/bmw-1620x1080.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Space,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://as2.ftcdn.net/v2/jpg/02/79/03/07/1000_F_279030771_pMo4u606vF6mscufYoroxD2r1Wt5zmPe.jpg",
        color: randomColor()
    ),
    Question(
        category: QuestionCategory.Football,
        text: "bla bla bla bla bla bla ?",
        imageUrl: "https://www.fcbarcelona.com/fcbarcelona/photo/2022/10/23/95c05ed8-7b4a-4563-87ea-9085f9621385/VIC_1659.jpg",
        color: randomColor()
    )
  ];
  static const SizedBox divider = SizedBox(width: 20,);
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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                // physics: const BouncingScrollPhysics(),
                child: Row(
                  children: getChildren(),
                ),
              ),
            ),
          ),
        )
    );
  }

  static Color randomColor(){
    int randomIndex = Random().nextInt(Colors.primaries.length);
    Color randomColor = Colors.primaries.elementAt(randomIndex);
    debugPrint("Random color is ${randomColor.toString()}");
    return randomColor;
  }

  List<Widget> getChildren(){
    List<Widget> children = [];
    for (Question element in questions) {
      children.add(QuestionWidget(question: element));
      children.add(divider);
    }
    children.removeLast();
    return children;
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
  late final QuestionCategory category;
  late final String text;
  late final String imageUrl;
  late final Color color;

  Question({required this.category,required this.text, required this.imageUrl, required this.color});

}

enum QuestionCategory{
  Cars, Football, Space
}
