import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../blocs/quiz_state.dart';

class ResultPage extends StatelessWidget {
  final QuizFinished state;

  const ResultPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    String title;
    String subtitle;

    if (state.mode == QuizMode.solo) {
      title = 'Quiz Terminé !';
      subtitle = 'Votre score : ${state.scorePlayer1} / 10';
    } else {
      title = 'Fin du Duel !';
      if (state.scorePlayer1 > state.scorePlayer2) {
        subtitle = 'Le Joueur 1 gagne (${state.scorePlayer1} à ${state.scorePlayer2})';
      } else if (state.scorePlayer2 > state.scorePlayer1) {
        subtitle = 'Le Joueur 2 gagne (${state.scorePlayer2} à ${state.scorePlayer1})';
      } else {
        subtitle = 'Égalité parfaite ! (${state.scorePlayer1} partout)';
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade900, Colors.deepPurple.shade600],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 120, color: Colors.amber),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 24, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () => context.go('/'),
                icon: const Icon(Icons.home, color: Colors.purple),
                label: const Text('Retour à l\'accueil', style: TextStyle(color: Colors.purple, fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
