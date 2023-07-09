import 'dart:math';

import 'package:flutter/material.dart';

class Question{
  static final List<Question> questionsDb = [
    Question(
      category: QuestionCategory.Cars,
      text: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla v bla bla bla bla bla bla bla bla bla bla bla bla bla bla v?",
      imageUrl: "https://super-cars.pl/wp-content/uploads/2022/02/bmw-1620x1080.jpg",
      hints: ["First hint for cars question.", "Second hint for cars question"],
      solution: "This is answer for question about cars!"
    ),
    Question(
      category: QuestionCategory.Space,
      text: "bla bla bla bla bla bla ?",
      imageUrl: "https://as2.ftcdn.net/v2/jpg/02/79/03/07/1000_F_279030771_pMo4u606vF6mscufYoroxD2r1Wt5zmPe.jpg",
      hints: ["First hint for space question.", "Second hint for space question"],
      solution: "This is answer for question about space!"
    ),
    Question(
      category: QuestionCategory.Football,
      text: "bla bla bla bla bla bla ?",
      imageUrl: "https://www.fcbarcelona.com/fcbarcelona/photo/2022/10/23/95c05ed8-7b4a-4563-87ea-9085f9621385/VIC_1659.jpg",
      hints: ["First hint for football question.", "Second hint for football question"],
      solution: "This is answer for question about football!"
    )
  ];
  final QuestionCategory category;
  final String text;
  final String imageUrl;
  final List<String> hints;
  final String solution;

  Question({required this.category,required this.text, required this.imageUrl, required this.hints, required this.solution});

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
