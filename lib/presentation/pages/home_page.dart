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
                  onTap: () => _showCategorySelection(context, QuizMode.solo),
                ),
                const SizedBox(height: 20),
                _buildModeButton(
                  context,
                  title: 'Mode Duel',
                  icon: Icons.people,
                  onTap: () => _showCategorySelection(context, QuizMode.duel),
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

  void _showCategorySelection(BuildContext context, QuizMode mode) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) {
        final categories = [
          const _CategoryItem(
            title: 'Toutes les catégories',
            apiValue: null,
            icon: Icons.all_inclusive_rounded,
            gradientColors: [Color(0xFF673AB7), Color(0xFF512DA8)],
            description: 'Mélange aléatoire de toutes les questions.',
          ),
          const _CategoryItem(
            title: 'Géographie',
            apiValue: 'Géographie',
            icon: Icons.public_rounded,
            gradientColors: [Color(0xFF009688), Color(0xFF00796B)],
            description: 'Capitales, pays, fleuves, lacs et déserts.',
          ),
          const _CategoryItem(
            title: 'Histoire',
            apiValue: 'Histoire',
            icon: Icons.history_edu_rounded,
            gradientColors: [Color(0xFFFF9800), Color(0xFFF57C00)],
            description: 'Empires, grands leaders et indépendances.',
          ),
          const _CategoryItem(
            title: 'Culture & Art',
            apiValue: 'Culture',
            icon: Icons.music_note_rounded,
            gradientColors: [Color(0xFFE91E63), Color(0xFFC2185B)],
            description: 'Musique, langues, art, récits et coutumes.',
          ),
          const _CategoryItem(
            title: 'Sports',
            apiValue: 'Sports',
            icon: Icons.emoji_events_rounded,
            gradientColors: [Color(0xFFF44336), Color(0xFFD32F2F)],
            description: 'Coupe d\'Afrique, football et athlètes cultes.',
          ),
          const _CategoryItem(
            title: 'Sciences & Nature',
            apiValue: 'Sciences',
            icon: Icons.science_rounded,
            gradientColors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
            description: 'Faune sauvage, flore sauvage et géologie.',
          ),
        ];

        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.5,
          maxChildSize: 0.85,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900.withOpacity(0.98),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                border: Border.all(color: Colors.white12, width: 1.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const Text(
                    'Choisissez une catégorie',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    mode == QuizMode.solo
                        ? 'Mode Solo - 10 questions'
                        : 'Mode Duel - Affrontez un ami',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              context.push(
                                '/quiz',
                                extra: {
                                  'mode': mode,
                                  'category': cat.apiValue,
                                },
                              );
                            },
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: cat.gradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: cat.gradientColors[1].withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      cat.icon,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cat.title,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          cat.description,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white70,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _CategoryItem {
  final String title;
  final String? apiValue;
  final IconData icon;
  final List<Color> gradientColors;
  final String description;

  const _CategoryItem({
    required this.title,
    required this.apiValue,
    required this.icon,
    required this.gradientColors,
    required this.description,
  });
}
