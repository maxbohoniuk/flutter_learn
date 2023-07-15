import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_learn/task_f10/application/AppService.dart';
import 'package:provider/provider.dart';
import '../task_f10.dart';
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
  final ScrollController _scrollController = ScrollController(keepScrollOffset: false);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    return Scaffold(
      appBar: MyAppBar(
          titleText: "Questions"
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Consumer<AppService>(
            builder: (context, appService, child) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return QuestionWidget(question: QuestionsScreen.questions[index]);
                },
                separatorBuilder: (context, index) {
                  return MyApp.isLargeDevice ? const SizedBox(width: 20,) : const SizedBox(height: 20,);
                },
                itemCount: QuestionsScreen.questions.length,
                scrollDirection: MyApp.isLargeDevice ? Axis.horizontal : Axis.vertical,
                reverse: true,
                controller: _scrollController,
                padding: const EdgeInsets.all(10),

              );
            },
          )
        ),
      ),
    );
  }
}
