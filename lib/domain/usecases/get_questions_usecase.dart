import '../entities/question.dart';
import '../repositories/quiz_repository.dart';

class GetQuestionsUseCase {
  final QuizRepository repository;

  GetQuestionsUseCase(this.repository);

  Future<List<Question>> call({int amount = 10, String? category}) async {
    return await repository.getQuestions(amount: amount, category: category);
  }
}
