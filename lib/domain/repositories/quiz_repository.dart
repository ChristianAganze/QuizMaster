import '../entities/question.dart';

abstract class QuizRepository {
  Future<List<Question>> getQuestions({int amount = 10, String? category});
}
