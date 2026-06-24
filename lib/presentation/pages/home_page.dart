import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../blocs/quiz_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade800, Colors.deepPurple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.psychology, size: 100, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'QuizMaster',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const Text(
                  "L'Arène du Savoir",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 60),
                _buildModeButton(
                  context,
                  title: 'Mode Solo',
                  icon: Icons.person,
                  onTap: () => context.push('/quiz', extra: QuizMode.solo),
                ),
                const SizedBox(height: 20),
                _buildModeButton(
                  context,
                  title: 'Mode Duel',
                  icon: Icons.people,
                  onTap: () => context.push('/quiz', extra: QuizMode.duel),
                  isOutlined: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModeButton(BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    bool isOutlined = false,
  }) {
    return SizedBox(
      width: 250,
      height: 60,
      child: isOutlined
          ? OutlinedButton.icon(
              onPressed: onTap,
              icon: Icon(icon, color: Colors.white),
              label: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            )
          : ElevatedButton.icon(
              onPressed: onTap,
              icon: Icon(icon, color: Colors.deepPurple),
              label: Text(title, style: const TextStyle(color: Colors.deepPurple, fontSize: 18, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
    );
  }
}
