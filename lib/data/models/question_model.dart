import 'package:html_unescape/html_unescape.dart';
import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  const QuestionModel({
    required super.category,
    required super.difficulty,
    required super.question,
    required super.correctAnswer,
    required super.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    var unescape = HtmlUnescape();
    
    String correct = unescape.convert(json['correct_answer'] as String);
    List<String> incorrect = (json['incorrect_answers'] as List)
        .map((e) => unescape.convert(e as String))
        .toList();
        
    List<String> allOptions = List.from(incorrect)..add(correct);
    allOptions.shuffle();

    return QuestionModel(
      category: unescape.convert(json['category'] as String),
      difficulty: unescape.convert(json['difficulty'] as String),
      question: unescape.convert(json['question'] as String),
      correctAnswer: correct,
      options: allOptions,
    );
  }
}
