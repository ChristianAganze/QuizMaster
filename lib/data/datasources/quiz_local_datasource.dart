import '../models/question_model.dart';

abstract class QuizLocalDataSource {
  Future<List<QuestionModel>> getQuestions({int amount = 10, String? category});
}

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  static const List<Map<String, dynamic>> _localQuestions = [
    // === GÉOGRAPHIE ===
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quel est le plus long fleuve d\'Afrique ?',
      'correct_answer': 'Le Nil',
      'incorrect_answers': ['Le Congo', 'Le Niger', 'Le Zambèze']
    },
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quelle est la capitale administrative de la Côte d\'Ivoire ?',
      'correct_answer': 'Yamoussoukro',
      'incorrect_answers': ['Abidjan', 'Bouaké', 'San-Pédro']
    },
    {
      'category': 'Géographie',
      'difficulty': 'moyen',
      'question': 'Quel est le plus grand lac d\'Afrique par sa superficie ?',
      'correct_answer': 'Le lac Victoria',
      'incorrect_answers': ['Le lac Tanganyika', 'Le lac Malawi', 'Le lac Tchad']
    },
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quel est le point culminant du continent africain ?',
      'correct_answer': 'Le Kilimandjaro',
      'incorrect_answers': ['Le Mont Kenya', 'Le Mont Cameroun', 'Le Toubkal']
    },
    {
      'category': 'Géographie',
      'difficulty': 'difficile',
      'question': 'Quel pays africain est entièrement enclavé dans l\'Afrique du Sud ?',
      'correct_answer': 'Le Lesotho',
      'incorrect_answers': ['L\'Eswatini', 'Le Botswana', 'Le Zimbabwe']
    },
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quel océan borde la côte est de l\'Afrique ?',
      'correct_answer': 'L\'océan Indien',
      'incorrect_answers': ['L\'océan Atlantique', 'L\'océan Pacifique', 'L\'océan Arctique']
    },
    {
      'category': 'Géographie',
      'difficulty': 'moyen',
      'question': 'Quelle est la capitale administrative de l\'Afrique du Sud ?',
      'correct_answer': 'Pretoria',
      'incorrect_answers': ['Le Cap', 'Johannesburg', 'Bloemfontein']
    },
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quel pays d\'Afrique du Nord possède la plus grande superficie ?',
      'correct_answer': 'L\'Algérie',
      'incorrect_answers': ['La Libye', 'L\'Égypte', 'Le Maroc']
    },
    {
      'category': 'Géographie',
      'difficulty': 'difficile',
      'question': 'Dans quel pays se trouve le delta intérieur du Niger, une vaste zone humide au milieu du Sahel ?',
      'correct_answer': 'Le Mali',
      'incorrect_answers': ['Le Niger', 'Le Nigeria', 'Le Tchad']
    },
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quelle île de l\'océan Indien est la plus grande d\'Afrique ?',
      'correct_answer': 'Madagascar',
      'incorrect_answers': ['L\'île Maurice', 'La Réunion', 'Les Seychelles']
    },
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quel canal artificiel relie la mer Méditerranée à la mer Rouge ?',
      'correct_answer': 'Le canal de Suez',
      'incorrect_answers': ['Le canal de Panama', 'Le canal de Corinthe', 'Le canal de Kiel']
    },
    {
      'category': 'Géographie',
      'difficulty': 'facile',
      'question': 'Quel désert, le plus chaud du monde, couvre une grande partie de l\'Afrique du Nord ?',
      'correct_answer': 'Le Sahara',
      'incorrect_answers': ['Le Kalahari', 'Le Namib', 'Le désert de Gobi']
    },

    // === HISTOIRE ===
    {
      'category': 'Histoire',
      'difficulty': 'facile',
      'question': 'Quel célèbre leader sud-africain a passé 27 ans en prison avant d\'être élu président ?',
      'correct_answer': 'Nelson Mandela',
      'incorrect_answers': ['Desmond Tutu', 'Thabo Mbeki', 'Steve Biko']
    },
    {
      'category': 'Histoire',
      'difficulty': 'moyen',
      'question': 'Quel empereur du Mali du XIVe siècle est considéré comme l\'homme le plus riche de l\'histoire ?',
      'correct_answer': 'Mansa Moussa',
      'incorrect_answers': ['Soundiata Keïta', 'Askia Mohammad', 'Sunni Ali Ber']
    },
    {
      'category': 'Histoire',
      'difficulty': 'facile',
      'question': 'Quelle ancienne civilisation africaine est célèbre pour la construction des pyramides de Gizeh ?',
      'correct_answer': 'L\'Égypte antique',
      'incorrect_answers': ['L\'Empire d\'Aksoum', 'Le Royaume de Koush', 'L\'Empire du Ghana']
    },
    {
      'category': 'Histoire',
      'difficulty': 'moyen',
      'question': 'Quel pays africain est le seul à n\'avoir jamais été colonisé par une puissance européenne ?',
      'correct_answer': 'L\'Éthiopie',
      'incorrect_answers': ['Le Liberia', 'Le Ghana', 'Le Maroc']
    },
    {
      'category': 'Histoire',
      'difficulty': 'facile',
      'question': 'En quelle année la majorité des pays d\'Afrique francophone ont-ils accédé à l\'indépendance ?',
      'correct_answer': '1960',
      'incorrect_answers': ['1945', '1954', '1975']
    },
    {
      'category': 'Histoire',
      'difficulty': 'moyen',
      'question': 'Qui a été le premier président de la République du Sénégal et un grand poète de la négritude ?',
      'correct_answer': 'Léopold Sédar Senghor',
      'incorrect_answers': ['Félix Houphouët-Boigny', 'Kwame Nkrumah', 'Sékou Touré']
    },
    {
      'category': 'Histoire',
      'difficulty': 'difficile',
      'question': 'Quel royaume historique, situé dans l\'actuel Nigeria, était célèbre pour ses sculptures en bronze ?',
      'correct_answer': 'Le Royaume du Bénin',
      'incorrect_answers': ['Le Royaume Zoulou', 'L\'Empire Songhaï', 'Le Royaume du Dahomey']
    },
    {
      'category': 'Histoire',
      'difficulty': 'moyen',
      'question': 'Quel grand leader panafricaniste a été le premier président du Ghana indépendant en 1957 ?',
      'correct_answer': 'Kwame Nkrumah',
      'incorrect_answers': ['Jomo Kenyatta', 'Julius Nyerere', 'Patrice Lumumba']
    },
    {
      'category': 'Histoire',
      'difficulty': 'facile',
      'question': 'Quelle reine légendaire a été la dernière souveraine d\'Égypte avant l\'annexion romaine ?',
      'correct_answer': 'Cléopâtre VII',
      'incorrect_answers': ['Néfertiti', 'Hatchepsout', 'Néfertari']
    },
    {
      'category': 'Histoire',
      'difficulty': 'facile',
      'question': 'Quel leader révolutionnaire burkinabé, assassiné en 1987, est surnommé le « Che Guevara africain » ?',
      'correct_answer': 'Thomas Sankara',
      'incorrect_answers': ['Blaise Compaoré', 'Félix Houphouët-Boigny', 'Mobutu Sese Seko']
    },
    {
      'category': 'Histoire',
      'difficulty': 'difficile',
      'question': 'Quel empire marchand d\'Afrique de l\'Est a adopté le christianisme dès le IVe siècle sous le roi Ezana ?',
      'correct_answer': 'L\'Empire d\'Aksoum',
      'incorrect_answers': ['Le Grand Zimbabwe', 'L\'Empire du Mali', 'Le Royaume de Numidie']
    },
    {
      'category': 'Histoire',
      'difficulty': 'moyen',
      'question': 'Quelle ville malienne abrite les célèbres manuscrits anciens et l\'université historique de Sankoré ?',
      'correct_answer': 'Tombouctou',
      'incorrect_answers': ['Djenné', 'Gao', 'Mopti']
    },

    // === CULTURE & ART ===
    {
      'category': 'Culture',
      'difficulty': 'moyen',
      'question': 'Quel écrivain nigérian est l\'auteur du roman mondialement célèbre « Tout s\'effondre » ?',
      'correct_answer': 'Chinua Achebe',
      'incorrect_answers': ['Wole Soyinka', 'Chimamanda Ngozi Adichie', 'Ben Okri']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quel instrument traditionnel d\'Afrique de l\'Ouest est une harpe-luth à 21 cordes en calebasse ?',
      'correct_answer': 'La kora',
      'incorrect_answers': ['Le balafon', 'Le djembé', 'Le oud']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quelle chanteuse sud-africaine, célèbre pour la chanson « Pata Pata », est surnommée « Mama Africa » ?',
      'correct_answer': 'Miriam Makeba',
      'incorrect_answers': ['Cesária Évora', 'Angélique Kidjo', 'Brenda Fassie']
    },
    {
      'category': 'Culture',
      'difficulty': 'moyen',
      'question': 'Quel festival panafricain du cinéma majeur se déroule tous les deux ans à Ouagadougou ?',
      'correct_answer': 'Le FESPACO',
      'incorrect_answers': ['Les Journées Cinématographiques de Carthage', 'Le Festival de Marrakech', 'Le FESMAN']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quelle chanteuse béninoise, lauréate de plusieurs Grammy Awards, est célèbre pour son album « Logozo » ?',
      'correct_answer': 'Angélique Kidjo',
      'incorrect_answers': ['Miriam Makeba', 'Fatoumata Diawara', 'Rokia Traoré']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quel style de musique et de danse urbaine a été popularisé en Côte d\'Ivoire par Douk Saga en 2002 ?',
      'correct_answer': 'Le Coupé-décalé',
      'incorrect_answers': ['Le Makossa', 'L\'Afrobeats', 'Le Kuduro']
    },
    {
      'category': 'Culture',
      'difficulty': 'moyen',
      'question': 'Quel célèbre chanteur sénégalais a créé le style Mbalax et a été ministre de la Culture ?',
      'correct_answer': 'Youssou N\'Dour',
      'incorrect_answers': ['Salif Keïta', 'Alpha Blondy', 'Baaba Maal']
    },
    {
      'category': 'Culture',
      'difficulty': 'moyen',
      'question': 'Quel tissu royal africain, caractérisé par des bandes de soie colorée tissées, vient du peuple Ashanti au Ghana ?',
      'correct_answer': 'Le Kente',
      'incorrect_answers': ['Le Bogolan', 'Le Dashiki', 'Le Wax']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quel monument géant en bronze de 52 mètres, le plus grand d\'Afrique, domine la ville de Dakar ?',
      'correct_answer': 'Le Monument de la Renaissance africaine',
      'incorrect_answers': ['Le Monument de la Réunification', 'La Grande Mosquée', 'La Place des Martyrs']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quel sage malien a écrit la formule : « En Afrique, un vieillard qui meurt est une bibliothèque qui brûle » ?',
      'correct_answer': 'Amadou Hampâté Bâ',
      'incorrect_answers': ['Léopold Sédar Senghor', 'Cheikh Anta Diop', 'Camara Laye']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quelle langue bantoue est la plus parlée en Afrique de l\'Est et sert de langue officielle au Kenya et en Tanzanie ?',
      'correct_answer': 'Le swahili',
      'incorrect_answers': ['Le yoruba', 'Le zoulou', 'L\'amharique']
    },
    {
      'category': 'Culture',
      'difficulty': 'facile',
      'question': 'Quel plat traditionnel à base de semoule de blé dur et de légumes est emblématique de l\'Afrique du Nord ?',
      'correct_answer': 'Le couscous',
      'incorrect_answers': ['Le tajine', 'La pastilla', 'La harira']
    },

    // === SPORTS ===
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'Quel pays a remporté la Coupe d\'Afrique des Nations (CAN) de football le plus grand nombre de fois ?',
      'correct_answer': 'L\'Égypte',
      'incorrect_answers': ['Le Cameroun', 'Le Ghana', 'Le Nigeria']
    },
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'En quelle année la Coupe du Monde de football s\'est-elle tenue pour la première fois en Afrique ?',
      'correct_answer': '2010',
      'incorrect_answers': ['1998', '2006', '2014']
    },
    {
      'category': 'Sports',
      'difficulty': 'moyen',
      'question': 'Quel athlète éthiopien a remporté le marathon olympique de Rome en 1960 en courant pieds nus ?',
      'correct_answer': 'Abebe Bikila',
      'incorrect_answers': ['Haile Gebrselassie', 'Kenenisa Bekele', 'Eliud Kipchoge']
    },
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'Quel footballeur libérien est devenu le seul joueur africain à remporter le Ballon d\'Or européen en 1995 ?',
      'correct_answer': 'George Weah',
      'incorrect_answers': ['Didier Drogba', 'Samuel Eto\'o', 'Sadio Mané']
    },
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'De quel pays d\'Afrique de l\'Est est originaire le coureur légendaire Eliud Kipchoge ?',
      'correct_answer': 'Le Kenya',
      'incorrect_answers': ['L\'Éthiopie', 'L\'Ouganda', 'L\'Érythrée']
    },
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'Quel est le surnom officiel de l\'équipe nationale masculine de football du Cameroun ?',
      'correct_answer': 'Les Lions Indomptables',
      'incorrect_answers': ['Les Super Eagles', 'Les Éléphants', 'Les Fennecs']
    },
    {
      'category': 'Sports',
      'difficulty': 'moyen',
      'question': 'Quel pays d\'Afrique australe a remporté plusieurs fois la Coupe du Monde de Rugby (les Springboks) ?',
      'correct_answer': 'L\'Afrique du Sud',
      'incorrect_answers': ['La Namibie', 'Le Kenya', 'Le Zimbabwe']
    },
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'Quel footballeur sénégalais, vainqueur de la CAN 2022, a été nommé joueur africain de l\'année à deux reprises ?',
      'correct_answer': 'Sadio Mané',
      'incorrect_answers': ['El Hadji Diouf', 'Didier Drogba', 'Samuel Eto\'o']
    },
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'Quelle sélection nationale de football est surnommée « Les Fennecs » ?',
      'correct_answer': 'L\'Algérie',
      'incorrect_answers': ['La Tunisie', 'Le Maroc', 'L\'Égypte']
    },
    {
      'category': 'Sports',
      'difficulty': 'facile',
      'question': 'Quel pays d\'Afrique du Nord a atteint les demi-finales de la Coupe du Monde de football en 2022 ?',
      'correct_answer': 'Le Maroc',
      'incorrect_answers': ['Le Sénégal', 'Le Cameroun', 'Le Ghana']
    },

    // === SCIENCES & NATURE ===
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quel animal terrestre, le plus rapide du monde, vit principalement dans les savanes africaines ?',
      'correct_answer': 'Le guépard',
      'incorrect_answers': ['Le léopard', 'Le lion', 'La gazelle']
    },
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quel arbre majestueux, surnommé « arbre de vie », possède un tronc massif capable de stocker de l\'eau ?',
      'correct_answer': 'Le baobab',
      'incorrect_answers': ['L\'acacia', 'Le palmier à huile', 'L\'okoumé']
    },
    {
      'category': 'Sciences',
      'difficulty': 'moyen',
      'question': 'Quel grand singe menacé vit dans les forêts montagneuses du Rwanda et de la R.D. du Congo ?',
      'correct_answer': 'Le gorille des montagnes',
      'incorrect_answers': ['Le chimpanzé', 'Le bonobo', 'L\'orang-outan']
    },
    {
      'category': 'Sciences',
      'difficulty': 'moyen',
      'question': 'Quelle grande structure géographique d\'Afrique de l\'Est est célèbre pour ses fossiles et sa faune, souvent appelée « berceau de l\'humanité » ?',
      'correct_answer': 'La vallée du Grand Rift',
      'incorrect_answers': ['La vallée du Nil', 'La vallée du Limpopo', 'Le bassin du Congo']
    },
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quel célèbre fossile d\'Australopithèque datant de 3,2 millions d\'années a été découvert en Éthiopie en 1974 ?',
      'correct_answer': 'Lucy',
      'incorrect_answers': ['Toumaï', 'Abel', 'Ardi']
    },
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quel est le plus grand animal terrestre vivant que l\'on peut observer en Afrique ?',
      'correct_answer': 'L\'éléphant d\'Afrique',
      'incorrect_answers': ['Le rhinocéros blanc', 'L\'hippopotame', 'La girafe']
    },
    {
      'category': 'Sciences',
      'difficulty': 'moyen',
      'question': 'Quel fleuve d\'Afrique centrale possède le débit le plus élevé du continent et le deuxième plus élevé du monde ?',
      'correct_answer': 'Le fleuve Congo',
      'incorrect_answers': ['Le Nil', 'Le Niger', 'Le Zambèze']
    },
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quel insecte est le principal vecteur de transmission du paludisme (malaria) en Afrique ?',
      'correct_answer': 'Le moustique (anophèle)',
      'incorrect_answers': ['La mouche tsé-tsé', 'La tique', 'Le criquet pèlerin']
    },
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quelle plante médicinale succulente d\'origine africaine est réputée pour ses vertus apaisantes pour la peau ?',
      'correct_answer': 'L\'Aloe Vera',
      'incorrect_answers': ['Le cactus', 'L\'agave', 'Le baobab']
    },
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quel oiseau d\'Afrique, inapte au vol, est le plus grand et le plus lourd oiseau vivant sur Terre ?',
      'correct_answer': 'L\'autruche',
      'incorrect_answers': ['L\'outarde', 'Le marabout', 'Le condor']
    },
    {
      'category': 'Sciences',
      'difficulty': 'moyen',
      'question': 'Quel lac d\'Afrique de l\'Est est le deuxième lac le plus profond du monde ?',
      'correct_answer': 'Le lac Tanganyika',
      'incorrect_answers': ['Le lac Victoria', 'Le lac Nyassa', 'Le lac Kivu']
    },
    {
      'category': 'Sciences',
      'difficulty': 'moyen',
      'question': 'Comment appelle-t-on le vent saisonnier chaud, sec et poussiéreux soufflant du Sahara vers le golfe de Guinée ?',
      'correct_answer': 'L\'harmattan',
      'incorrect_answers': ['Le sirocco', 'Le khamsin', 'Le mistral']
    },
    {
      'category': 'Sciences',
      'difficulty': 'facile',
      'question': 'Quel reptile géant et redoutable peuple de nombreuses rivières africaines ?',
      'correct_answer': 'Le crocodile du Nil',
      'incorrect_answers': ['L\'alligator', 'Le caïman', 'L\'anaconda']
    },
    {
      'category': 'Sciences',
      'difficulty': 'moyen',
      'question': 'Quel mammifère semi-aquatique massif est responsable du plus grand nombre d\'accidents mortels en milieu fluvial africain ?',
      'correct_answer': 'L\'hippopotame',
      'incorrect_answers': ['Le rhinocéros', 'Le buffle du Cap', 'Le lion']
    }
  ];

  @override
  Future<List<QuestionModel>> getQuestions({int amount = 10, String? category}) async {
    // Filtrage par catégorie
    List<Map<String, dynamic>> filtered = _localQuestions;
    if (category != null && category.isNotEmpty && category != 'Toutes') {
      filtered = _localQuestions.where((q) => q['category'] == category).toList();
    }

    // Mélanger une copie
    final List<Map<String, dynamic>> shuffledList = List.from(filtered)..shuffle();

    // Prendre le montant demandé (ou le maximum disponible si insuffisant)
    final selected = shuffledList.take(amount).toList();

    return selected.map((e) => QuestionModel.fromJson(e)).toList();
  }
}
