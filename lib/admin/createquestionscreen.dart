import 'package:flutter/material.dart';
import 'package:shortquiz/models/question.dart';
import 'package:uuid/uuid.dart';

class CreateQuestionScreen extends StatefulWidget {
  const CreateQuestionScreen({super.key});

  @override
  State<CreateQuestionScreen> createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _choice1Controller = TextEditingController();
  final _choice2Controller = TextEditingController();
  final _answerController = TextEditingController();
  final _scoreController = TextEditingController();
  var question = Question(
    id: '',
    questionText: '',
    choices: [],
    answer: '',
    score: '',
    createdAt: DateTime.now(),
  );

  @override
  void dispose() {
    _questionController.dispose();
    _choice1Controller.dispose();
    _choice2Controller.dispose();
    _answerController.dispose();
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _questionController,
                decoration: InputDecoration(labelText: 'question'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a question';
                  }
                  if (value.length < 3) {
                    return 'please enter a valid question';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _choice1Controller,
                decoration: InputDecoration(labelText: 'choice 1'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter first choice';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _choice2Controller,
                decoration: InputDecoration(labelText: 'choice 2'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter second choice';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _answerController,
                decoration: InputDecoration(labelText: 'answer'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter an answer';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _scoreController,
                decoration: InputDecoration(labelText: 'score'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a score';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    question.submitQuestion(
                        Question(
                          id: Uuid().v4(),
                          questionText: _questionController.text,
                          choices: [_choice1Controller.text,_choice2Controller.text,_answerController.text],
                          answer: _answerController.text,
                          score: _scoreController.text,
                          createdAt: DateTime.now(),
                        ),
                        context);
                    _questionController.clear();
                    _choice1Controller.clear();
                    _choice2Controller.clear();
                    _answerController.clear();
                    _scoreController.clear();
                  }
                },
                child: Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
