import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/di/injection_container.dart';
import '../blocs/quiz_cubit.dart';
import '../blocs/quiz_state.dart';

class QuizPage extends StatelessWidget {
  final QuizMode mode;
  final String? category;

  const QuizPage({super.key, required this.mode, this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QuizCubit>()..startQuiz(mode: mode, category: category),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade900, Colors.indigo.shade500],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: BlocConsumer<QuizCubit, QuizState>(
              listener: (context, state) {
                if (state is QuizFinished) {
                  context.go('/result', extra: state);
                }
              },
              builder: (context, state) {
                if (state is QuizLoading || state is QuizInitial) {
                  return const Center(child: CircularProgressIndicator(color: Colors.white));
                } else if (state is QuizError) {
                  return Center(
                    child: Text(state.message, style: const TextStyle(color: Colors.white)),
                  );
                } else if (state is QuizLoaded) {
                  return _buildQuizBody(context, state);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizBody(BuildContext context, QuizLoaded state) {
    final question = state.currentQuestion;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.mode == QuizMode.duel
                    ? 'Tour : ${state.currentPlayer == Player.player1 ? "Joueur 1" : "Joueur 2"}'
                    : 'Score : ${state.scorePlayer1}',
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: state.remainingSeconds / QuizCubit.timePerQuestion,
                    backgroundColor: Colors.white24,
                    color: state.remainingSeconds <= 3 ? Colors.redAccent : Colors.greenAccent,
                  ),
                  Text(
                    '${state.remainingSeconds}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Question ${state.currentIndex + 1}/${state.questions.length}',
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  question.question,
                  key: ValueKey(question.question + state.currentPlayer.toString()),
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ...question.options.map((option) => Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton(
                  onPressed: () => context.read<QuizCubit>().submitAnswer(option),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Colors.white.withOpacity(0.9),
                    foregroundColor: Colors.indigo.shade900,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(option, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                ),
              )),
        ],
      ),
    );
  }
}
