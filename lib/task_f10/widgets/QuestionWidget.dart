import 'package:flutter/material.dart';
import 'package:flutter_learn/task_f10/screens/QuestionDetailsScreen.dart';
import 'package:flutter_learn/task_f10/task_f10.dart';
import '../models/Question.dart';

class QuestionWidget extends StatelessWidget {
  late final Question _question;

  QuestionWidget({Key? key, required Question question}) : super(key: key) {
    _question = question;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionDetailsScreen(question: _question)));
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300, maxWidth: 600),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 8.0, spreadRadius: 3.0, color: Colors.black26)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: MyApp.randomColor()
                ),
                child: Center(
                    child: Text(_question.category.name, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                )),
              ),
              Expanded(
                child: Stack(
                  fit: StackFit.passthrough,
                    alignment: Alignment.topCenter,
                    children: [
                  FadeInImage(
                    placeholder: Image.asset("assets/loading.gif").image,
                    image: NetworkImage(_question.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.black.withOpacity(0.4),
                      child: Center(
                          child: Text(_question.text, style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,)
                      )
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
