import 'package:flutter/material.dart';

class QuestionHintWidget extends StatelessWidget {
  final String text;
  bool isVisible;
  QuestionHintWidget({Key? key, required this.text, required this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(seconds: 2),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: const [BoxShadow(blurRadius: 8.0, spreadRadius: 3.0, color: Colors.black26)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Hint", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              )
            ],
          ),
        ),
      ),
    );
  }
}
