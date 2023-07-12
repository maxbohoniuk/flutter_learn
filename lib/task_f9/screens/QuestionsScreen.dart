import 'package:flutter/material.dart';
import '../task_f9.dart';
import '../models/Question.dart';
import '../widgets/MyAppBar.dart';
import '../widgets/QuestionWidget.dart';

class QuestionsScreen extends StatefulWidget {
  static List<Question> questions = Question.randomQuestions(listSize: 5);

  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          titleText: "Questions",
          actions: [IconButton(onPressed: refresh, icon: const Icon(Icons.refresh))]
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return QuestionWidget(question: QuestionsScreen.questions[index]);
              },
              separatorBuilder: (context, index) {
                return MyApp.isLargeDevice ? const SizedBox(width: 20,) : const SizedBox(height: 20,);
              },
              itemCount: QuestionsScreen.questions.length,
              scrollDirection: MyApp.isLargeDevice ? Axis.horizontal : Axis.vertical,
              padding: const EdgeInsets.all(10),

          )
        ),
      ),
    );
  }

  void refresh(){
    setState(() {});
  }
}
