import '../../core/network/api_client.dart';
import '../models/question_model.dart';

abstract class QuizRemoteDataSource {
  Future<List<QuestionModel>> getQuestions({int amount = 10, String? category});
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final ApiClient apiClient;

  QuizRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<QuestionModel>> getQuestions({int amount = 10, String? category}) async {
    final queryParams = <String, dynamic>{
      'amount': amount,
      'type': 'multiple',
    };
    if (category != null && category.isNotEmpty) {
      queryParams['category'] = category;
    }

    final response = await apiClient.get('api.php', queryParameters: queryParams);

    if (response.statusCode == 200) {
      final data = response.data;
      if (data['response_code'] == 0) {
        final List results = data['results'];
        return results.map((e) => QuestionModel.fromJson(e)).toList();
      } else {
        throw ServerException(message: 'Impossible de récupérer les questions');
      }
    } else {
      throw ServerException(message: 'Erreur réseau');
    }
  }
}
