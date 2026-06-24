import '../../domain/entities/question.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_local_datasource.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizLocalDataSource localDataSource;

  QuizRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Question>> getQuestions({int amount = 10, String? category}) async {
    return await localDataSource.getQuestions(amount: amount, category: category);
  }
}
