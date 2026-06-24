import '../../domain/entities/question.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_remote_datasource.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDataSource remoteDataSource;

  QuizRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Question>> getQuestions({int amount = 10, String? category}) async {
    // Dans une version plus avancée, on pourrait vérifier la connexion internet
    // ou cacher les questions dans Hive. Pour le MVP, on appelle directement l'API.
    return await remoteDataSource.getQuestions(amount: amount, category: category);
  }
}
