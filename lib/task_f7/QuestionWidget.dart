import 'dart:math';

import 'package:flutter/material.dart';
import '../task_f7/Question.dart';

class QuestionWidget extends StatelessWidget {
  late final Question _question;

  QuestionWidget({Key? key, required Question question}) : super(key: key){
    _question = question;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300, maxWidth: 400),
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
                color: _randomColor(),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
            ),
            child: Center(child: Text(_question.category.name, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),)),
          ),
          Expanded(
            child: Container(
                constraints: const BoxConstraints(maxHeight: 200, maxWidth: 300),
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

  static Color _randomColor(){
    int randomIndex = Random().nextInt(Colors.primaries.length);
    Color randomColor = Colors.primaries.elementAt(randomIndex);
    debugPrint("Random color is ${randomColor.toString()}");
    return randomColor;
  }
}