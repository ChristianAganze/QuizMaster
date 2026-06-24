import 'package:go_router/go_router.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/quiz_page.dart';
import '../../presentation/pages/result_page.dart';
import '../../presentation/blocs/quiz_state.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) {
        final mode = state.extra as QuizMode? ?? QuizMode.solo;
        return QuizPage(mode: mode);
      },
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final finishedState = state.extra as QuizFinished;
        return ResultPage(state: finishedState);
      },
    ),
  ],
);
