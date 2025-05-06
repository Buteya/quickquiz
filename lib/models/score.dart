import 'package:flutter/material.dart';

class Score with ChangeNotifier {
  final String id;
  final String email;
  final String totalScore;
  final DateTime createdAt;

  Score({
    required this.id,
    required this.email,
    required this.totalScore,
    required this.createdAt,
  });
}
