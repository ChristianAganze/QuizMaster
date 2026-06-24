import 'package:get_it/get_it.dart';
import '../../data/datasources/quiz_local_datasource.dart';
import '../../data/repositories/quiz_repository_impl.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../../domain/usecases/get_questions_usecase.dart';
import '../../presentation/blocs/quiz_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ---- Data (Data Engineer) ----
  sl.registerLazySingleton<QuizLocalDataSource>(
    () => QuizLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(localDataSource: sl()),
  );
  
  // ---- Domain (Logicien) ----
  sl.registerLazySingleton(() => GetQuestionsUseCase(sl()));
  
  // ---- Presentation (UI/UX) ----
  sl.registerFactory(() => QuizCubit(getQuestionsUseCase: sl()));
}
