import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/usecases/get_questions_usecase.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final GetQuestionsUseCase getQuestionsUseCase;
  Timer? _timer;
  static const int timePerQuestion = 10;

  QuizCubit({required this.getQuestionsUseCase}) : super(QuizInitial());

  Future<void> startQuiz({required QuizMode mode, String? category}) async {
    emit(QuizLoading());
    try {
      final questions = await getQuestionsUseCase(amount: 10, category: category);
      emit(QuizLoaded(
        questions: questions,
        currentIndex: 0,
        scorePlayer1: 0,
        scorePlayer2: 0,
        currentPlayer: Player.player1,
        remainingSeconds: timePerQuestion,
        mode: mode,
      ));
      _startTimer();
    } catch (e) {
      emit(const QuizError(message: 'Impossible de charger les questions.'));
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentState = state;
      if (currentState is QuizLoaded) {
        if (currentState.remainingSeconds > 0) {
          emit(currentState.copyWith(remainingSeconds: currentState.remainingSeconds - 1));
        } else {
          // Temps écoulé
          submitAnswer(''); // Soumet une réponse vide/fausse
        }
      } else {
        timer.cancel();
      }
    });
  }

  void submitAnswer(String answer) {
    _timer?.cancel();
    final currentState = state;
    if (currentState is QuizLoaded) {
      bool isCorrect = answer == currentState.currentQuestion.correctAnswer;
      int newScore1 = currentState.scorePlayer1;
      int newScore2 = currentState.scorePlayer2;

      if (isCorrect) {
        if (currentState.currentPlayer == Player.player1) {
          newScore1++;
        } else {
          newScore2++;
        }
      }

      _nextTurn(currentState, newScore1, newScore2);
    }
  }

  void _nextTurn(QuizLoaded currentState, int newScore1, int newScore2) {
    if (currentState.mode == QuizMode.duel) {
      if (currentState.currentPlayer == Player.player1) {
        // Au tour du joueur 2
        emit(currentState.copyWith(
          scorePlayer1: newScore1,
          currentPlayer: Player.player2,
          remainingSeconds: timePerQuestion,
        ));
        _startTimer();
      } else {
        // Les deux ont répondu, question suivante
        _goToNextQuestion(currentState, newScore1, newScore2);
      }
    } else {
      // Mode Solo
      _goToNextQuestion(currentState, newScore1, newScore2);
    }
  }

  void _goToNextQuestion(QuizLoaded currentState, int newScore1, int newScore2) {
    if (currentState.currentIndex + 1 < currentState.questions.length) {
      emit(currentState.copyWith(
        currentIndex: currentState.currentIndex + 1,
        scorePlayer1: newScore1,
        scorePlayer2: newScore2,
        currentPlayer: Player.player1,
        remainingSeconds: timePerQuestion,
      ));
      _startTimer();
    } else {
      final finishedState = QuizFinished(
        scorePlayer1: newScore1,
        scorePlayer2: newScore2,
        mode: currentState.mode,
      );
      _saveHistory(finishedState);
      emit(finishedState);
    }
  }

  Future<void> _saveHistory(QuizFinished state) async {
    try {
      final box = await Hive.openBox('quiz_history');
      final record = {
        'date': DateTime.now().toIso8601String(),
        'mode': state.mode.toString(),
        'scorePlayer1': state.scorePlayer1,
        'scorePlayer2': state.scorePlayer2,
      };
      await box.add(record);
    } catch (e) {
      // Ignore errors
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
