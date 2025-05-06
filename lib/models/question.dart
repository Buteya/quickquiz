import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Question with ChangeNotifier {
  final String id;
  final String questionText;
  final List<String> choices;
  final String answer;
  final String score;
  final DateTime createdAt;

  Question({
    required this.id,
    required this.questionText,
    required this.choices,
    required this.answer,
    required this.score,
    required this.createdAt,
  });

  final db = FirebaseFirestore.instance;

  void submitQuestion(Question question, BuildContext context) {
    final ques = <String, dynamic>{
      "id": question.id,
      "questionText": question.questionText,
      "choices": question.choices,
      "answer": question.answer,
      "score": question.score,
      "createdAt": question.createdAt,
    };
    db.collection("Questions").doc(question.id).set(ques).then((_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('question created successfully'),
          ),
        );
      }
    }).onError((e, _) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('error uploading question'),
          ),
        );
      }
    });
  }
}
