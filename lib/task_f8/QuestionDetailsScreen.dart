import 'package:flutter/material.dart';
import '../task_f8/Question.dart';
import '../task_f8/task_f8.dart';

class QuestionDetailsScreen extends StatelessWidget {
  late final Question _question;
  int _hintCounter = -1;

  QuestionDetailsScreen({Key? key, required Question question})
      : super(key: key) {
    this._question = question;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyApp.randomColor(),
          title: Text(_question.category.name)),
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
              children: [
                Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 8.0,
                        spreadRadius: 3.0,
                        color: Colors.black26)
                  ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage(
                      placeholder: Image.asset("assets/loading.gif").image,
                      image: NetworkImage(_question.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 35,),
                Center(
                    child: Text(
                  _question.text,
                  style: const TextStyle(
                  fontSize: 19.0,
                  color: Colors.black),
                  textAlign: TextAlign.center,
                )),
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
      _hintCounter++;
      if(_hintCounter < _question.hints.length){
        showHint(context);
      } else{
        showAnswer(context);
      }
    
  }
  
  void showHint(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_question.hints[_hintCounter]),
          duration: Duration(seconds: 2),
        )
    );
  }
  
  void showAnswer(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(title: const Text("Answer"), content: Text(_question.solution));
    });
  }
}
