import 'package:flutter/material.dart';
import '../task_f7/Question.dart';
import '../task_f7/QuestionWidget.dart';

class QuestionsScreen extends StatefulWidget {
  static List<Question> questions = [ Question.randomQuestion() ];
  static late bool _isLargeDevice;

  QuestionsScreen({Key? key, required bool isLargeDevice}) : super(key: key){
    _isLargeDevice = isLargeDevice;
  }

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text("Questions")
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => setState(() {
              QuestionsScreen.questions.add(Question.randomQuestion());
            }),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: () => setState(() {
              QuestionsScreen.questions.removeLast();
            }),
            backgroundColor: Colors.deepOrangeAccent,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return QuestionWidget(question: QuestionsScreen.questions[index]);
              },
              separatorBuilder: (context, index) {
                return QuestionsScreen._isLargeDevice ? const SizedBox(width: 20,) : const SizedBox(height: 20,);
              },
              itemCount: QuestionsScreen.questions.length,
              scrollDirection: QuestionsScreen._isLargeDevice ? Axis.horizontal : Axis.vertical,
              padding: const EdgeInsets.all(10),

          )
        ),
      ),
    );
  }
}
