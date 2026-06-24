import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String category;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> options; // correctAnswer + incorrectAnswers mélangées

  const Question({
    required this.category,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.options,
  });

  @override
  List<Object?> get props => [category, difficulty, question, correctAnswer, options];
}
