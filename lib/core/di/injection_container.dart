import 'package:get_it/get_it.dart';
import '../../core/network/api_client.dart';
import '../../data/datasources/quiz_remote_datasource.dart';
import '../../data/repositories/quiz_repository_impl.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../../domain/usecases/get_questions_usecase.dart';
import '../../presentation/blocs/quiz_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ---- Core ----
  sl.registerLazySingleton(() => ApiClient());
  
  // ---- Data (Data Engineer) ----
  sl.registerLazySingleton<QuizRemoteDataSource>(
    () => QuizRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(remoteDataSource: sl()),
  );
  
  // ---- Domain (Logicien) ----
  sl.registerLazySingleton(() => GetQuestionsUseCase(sl()));
  
  // ---- Presentation (UI/UX) ----
  sl.registerFactory(() => QuizCubit(getQuestionsUseCase: sl()));
}
