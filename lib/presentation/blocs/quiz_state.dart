import 'package:equatable/equatable.dart';
import '../../domain/entities/question.dart';

enum QuizMode { solo, duel }
enum Player { player1, player2 }

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Question> questions;
  final int currentIndex;
  final int scorePlayer1;
  final int scorePlayer2;
  final Player currentPlayer;
  final int remainingSeconds;
  final QuizMode mode;

  const QuizLoaded({
    required this.questions,
    required this.currentIndex,
    required this.scorePlayer1,
    required this.scorePlayer2,
    required this.currentPlayer,
    required this.remainingSeconds,
    required this.mode,
  });

  Question get currentQuestion => questions[currentIndex];

  QuizLoaded copyWith({
    List<Question>? questions,
    int? currentIndex,
    int? scorePlayer1,
    int? scorePlayer2,
    Player? currentPlayer,
    int? remainingSeconds,
    QuizMode? mode,
  }) {
    return QuizLoaded(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      scorePlayer1: scorePlayer1 ?? this.scorePlayer1,
      scorePlayer2: scorePlayer2 ?? this.scorePlayer2,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      mode: mode ?? this.mode,
    );
  }

  @override
  List<Object?> get props => [
        questions,
        currentIndex,
        scorePlayer1,
        scorePlayer2,
        currentPlayer,
        remainingSeconds,
        mode,
      ];
}

class QuizFinished extends QuizState {
  final int scorePlayer1;
  final int scorePlayer2;
  final QuizMode mode;

  const QuizFinished({
    required this.scorePlayer1,
    required this.scorePlayer2,
    required this.mode,
  });

  @override
  List<Object?> get props => [scorePlayer1, scorePlayer2, mode];
}

class QuizError extends QuizState {
  final String message;
  const QuizError({required this.message});

  @override
  List<Object?> get props => [message];
}
