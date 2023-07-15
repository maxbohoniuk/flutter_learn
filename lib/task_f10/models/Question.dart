import 'dart:math';

import 'package:flutter/material.dart';

class Question{
  static final List<Question> questionsDb = [
    Question(
      category: QuestionCategory.Cars,
      text: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla v bla bla bla bla bla bla bla bla bla bla bla bla bla bla v?",
      hints: ["First hint for cars question.", "Second hint for cars question"],
      solution: "This is answer for question about cars!"
    ),
    Question(
      category: QuestionCategory.Space,
      text: "bla bla bla bla bla bla ?",
      hints: ["First hint for space question.", "Second hint for space question"],
      solution: "This is answer for question about space!"
    ),
    Question(
      category: QuestionCategory.Football,
      text: "bla bla bla bla bla bla ?",
      hints: ["First hint for football question.", "Second hint for football question"],
      solution: "This is answer for question about football!"
    )
  ];
  final QuestionCategory category;
  final String text;
  late final String imageUrl;
  final List<String> hints;
  final String solution;

  Question({required this.category,required this.text, required this.hints, required this.solution}){
    imageUrl = category.imageUrl;
  }

  static Question randomQuestion(){
    int randomIndex = Random().nextInt(questionsDb.length);
    Question randomQuestion = questionsDb[randomIndex];
    debugPrint("Random question is ${randomQuestion.category}");
    return randomQuestion;
  }

  static List<Question> randomQuestions({required int listSize}){
    List<Question> res = [];
    for(int i = 0; i < listSize; i++){
      res.add(randomQuestion());
    }
    return res;
  }
}

enum QuestionCategory{
  Cars(imageUrl: "https://images.pexels.com/photos/93615/pexels-photo-93615.jpeg?auto=compress&cs=tinysrgb&h=350"),
  Football(imageUrl: "https://images.pexels.com/photos/3148452/pexels-photo-3148452.jpeg?auto=compress&cs=tinysrgb&h=350"),
  Space(imageUrl: "https://as2.ftcdn.net/v2/jpg/02/79/03/07/1000_F_279030771_pMo4u606vF6mscufYoroxD2r1Wt5zmPe.jpg");

  const QuestionCategory({required this.imageUrl});

  final String imageUrl;

}
