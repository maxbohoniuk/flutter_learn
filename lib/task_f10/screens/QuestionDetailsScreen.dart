import 'package:flutter/material.dart';
import 'package:flutter_learn/task_f10/widgets/MyImageWidget.dart';
import 'package:flutter_learn/task_f10/widgets/QuestionHintWidget.dart';
import '../../task_f10/models/Question.dart';
import '../widgets/MyAppBar.dart';

class QuestionDetailsScreen extends StatefulWidget {
  late final Question _question;

  QuestionDetailsScreen({Key? key, required Question question})
      : super(key: key) {
    this._question = question;
  }

  @override
  State<QuestionDetailsScreen> createState() => _QuestionDetailsScreenState();
}

class _QuestionDetailsScreenState extends State<QuestionDetailsScreen> {
  int _hintCounter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          titleText: widget._question.category.name
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => fabPressed(context),
        child: const Icon(Icons.arrow_forward),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyImageWidget(imageUrl: widget._question.imageUrl, answer: _hintCounter >= widget._question.hints.length ? widget._question.solution : null,),
                const SizedBox(height: 35,),
                Center(
                    child: Text(
                  widget._question.text,
                  style: const TextStyle(
                  fontSize: 19.0,
                  color: Colors.black),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(height: 35,),
                QuestionHintWidget(
                  text: widget._question.hints[0],
                  isVisible: _hintCounter >= 0,
                ),
                const SizedBox(
                  height: 15,
                ),
                QuestionHintWidget(
                  text: widget._question.hints[1],
                  isVisible: _hintCounter >= 1
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                          onPressed: () => hintButtonPressed(context),
                          icon: const Icon(Icons.question_mark),
                          iconSize: 50,
                          color: Colors.deepOrange,

                      );
                    }
                  ),
                )
              ],
            )),
      ),
    );
  }

  void fabPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuestionDetailsScreen(question: Question.randomQuestion())
        )
    );
  }

  void hintButtonPressed(BuildContext context){
      setState(() {
        _hintCounter++;
      });
  }
}
