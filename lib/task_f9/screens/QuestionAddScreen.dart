import 'package:flutter/material.dart';
import 'package:flutter_learn/task_f9/models/Question.dart';
import 'package:flutter_learn/task_f9/screens/QuestionsScreen.dart';
import 'package:flutter_learn/task_f9/widgets/MyImageWidget.dart';

class QuestionAddScreen extends StatefulWidget {
  QuestionAddScreen({Key? key}) : super(key: key);

  @override
  State<QuestionAddScreen> createState() => _QuestionAddScreenState();
}

class _QuestionAddScreenState extends State<QuestionAddScreen> {
  final TextEditingController _questionTextController = TextEditingController();
  final TextEditingController _questionHintsController = TextEditingController();
  final TextEditingController _questionSolutionController = TextEditingController();

  QuestionCategory selectedCategory = QuestionCategory.values.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.amber,
            title: const Text("Add question")
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyImageWidget(imageUrl: selectedCategory.imageUrl),
              const SizedBox(height: 30,),
              SegmentedButton<QuestionCategory>(
                  segments: QuestionCategory.values.map((e) => ButtonSegment<QuestionCategory>(value: e, label: Text(e.name))).toList(),
                  selected: {selectedCategory},
                  onSelectionChanged: (selection){
                    setState(() {
                      selectedCategory = selection.first;

                    });
                  },
              ),
              const SizedBox(height: 10,),
              TextField(
                maxLines: 3,
                controller: _questionTextController,
                decoration: const InputDecoration(
                  hintText: "Question text",
                  border: OutlineInputBorder(),
                    labelText: "Question text"
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _questionHintsController,
                decoration: const InputDecoration(
                    hintText: "Question hints (separeted with \",\")",
                    border: OutlineInputBorder(),
                    labelText: "Question hints"
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _questionSolutionController,
                decoration: const InputDecoration(
                    hintText: "Question solution",
                    border: OutlineInputBorder(),
                    labelText: "Question solution"
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: addQuestionClicked, child: const Text("Add new question"))
            ],
          ),
        ),
      ),
    );
  }

  void addQuestionClicked() {
    debugPrint("Add new question button clicked!");
    QuestionsScreen.questions.add(Question(
        category: selectedCategory,
        text: _questionTextController.text,
        hints: _questionHintsController.text.split(","),
        solution: _questionSolutionController.text));
    clearSelections();
  }

  void clearSelections(){
    setState(() {
      _questionTextController.clear();
      _questionHintsController.clear();
      _questionSolutionController.clear();
      selectedCategory = QuestionCategory.values.first;
    });
  }
}
