import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/injection_container.dart' as di;
import 'core/router/app_router.dart';

void main() async {
  // S'assure que les bindings Flutter sont initialisés
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialisation de Hive pour le stockage local (Data Engineer / Intégrateur)
  await Hive.initFlutter();
  
  // Initialisation de l'injection de dépendances
  await di.init();
  
  runApp(const QuizMasterApp());
}

class QuizMasterApp extends StatelessWidget {
  const QuizMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QuizMaster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Inter', // Une police moderne
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
