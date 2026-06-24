# QuizMaster 🧠

QuizMaster est une application mobile Flutter moderne et interactive de quiz de culture générale, entièrement en **français**, conçue spécifiquement pour le public africain. L'application propose des questions et des réponses axées sur la géographie, l'histoire, la culture, le sport et les sciences/nature de la zone géographique africaine.

---

## ✨ Fonctionnalités

*   **🌍 Thématique Africaine & Francophone** : Plus de 60 questions rédigées en français couvrant la richesse culturelle, historique et géographique de l'Afrique.
*   **🎮 Deux Modes de Jeu** :
    *   **Mode Solo** : Testez vos connaissances seul à travers une série de 10 questions chronométrées.
    *   **Mode Duel** : Affrontez un ami sur le même appareil dans un duel palpitant au tour par tour.
*   **🗂️ Sélection par Catégorie** : Choisissez de jouer avec un mélange global ou filtrez par domaine d'intérêt grâce à une interface de sélection interactive (Bottom Sheet) :
    *   *Géographie d'Afrique* (capitales, lacs, fleuves, déserts)
    *   *Histoire d'Afrique* (empires historiques, grands leaders, indépendances)
    *   *Culture & Art* (musique, instruments, langues comme le Swahili, littérature)
    *   *Sports en Afrique* (Coupe d'Afrique des Nations, légendes du football et athlètes)
    *   *Sciences & Nature* (faune, flore endémique comme le baobab, géologie, fossiles)
*   **⚡ Mode Chrono** : Vous disposez de 10 secondes par question pour répondre sous pression !
*   **💾 Historique Local** : Sauvegarde automatique de l'historique et des scores de vos parties via une base de données locale rapide.

---

## 🏗️ Architecture du Projet

Le projet applique les principes de la **Clean Architecture** couplés au patron de gestion d'état **BLoC / Cubit**. Le code est découpé en couches distinctes pour maximiser la testabilité et la maintenabilité :

```text
lib/
├── core/
│   ├── di/             # Injection de dépendances (GetIt)
│   ├── network/        # Client réseau (obsolète après passage au mode local)
│   └── router/         # Configuration des routes (GoRouter)
├── data/
│   ├── datasources/    # Source de données locale (QuizLocalDataSource)
│   ├── models/         # Modélisation JSON (QuestionModel)
│   └── repositories/   # Implémentation du dépôt (QuizRepositoryImpl)
├── domain/
│   ├── entities/       # Entités métiers pures (Question)
│   ├── repositories/   # Contrats/Interfaces du dépôt (QuizRepository)
│   └── usecases/       # Cas d'utilisation de l'application (GetQuestionsUseCase)
├── presentation/
│   ├── blocs/          # Gestion d'état (QuizCubit, QuizState)
│   └── pages/          # Écrans de l'interface utilisateur (HomePage, QuizPage, ResultPage)
└── main.dart           # Point d'entrée de l'application
```

### Couches principales :
1.  **Domain (Métier)** : Contient les entités métier de base et les cas d'utilisation. Cette couche est totalement indépendante des frameworks, bases de données ou de l'interface utilisateur.
2.  **Data (Données)** : Gère la récupération des données. Les questions sont stockées localement sous forme de structures JSON indexées dans [quiz_local_datasource.dart](file:///c:/Users/Herom/FlutterProjects/QuizMaster/lib/data/datasources/quiz_local_datasource.dart).
3.  **Presentation (UI/UX)** : Écrans Flutter gérés de manière réactive par un `QuizCubit`. Les transitions entre écrans utilisent `GoRouter`.

---

## 🛠️ Stack Technique

*   **Framework** : [Flutter](https://flutter.dev) (Dart SDK)
*   **Gestion d'état** : [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
*   **Routage** : [go_router](https://pub.dev/packages/go_router)
*   **Persistance locale (Historique)** : [hive](https://pub.dev/packages/hive) & [hive_flutter](https://pub.dev/packages/hive_flutter)
*   **Injection de dépendances** : [get_it](https://pub.dev/packages/get_it)

---

## 🚀 Démarrage Rapide

### Prérequis
Assurez-vous d'avoir installé le [SDK Flutter](https://docs.flutter.dev/get-started/install).

### Installation et exécution

1.  **Récupérer les dépendances** :
    ```bash
    flutter pub get
    ```

2.  **Lancer l'application** :
    ```bash
    flutter run
    ```

3.  **(Optionnel) Générer le code pour les dépendances externes** :
    Si des modèles ou fichiers de code généré doivent être reconstruits :
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
