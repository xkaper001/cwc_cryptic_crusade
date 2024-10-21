import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwc_cryptic_crusade/features/db/local_db.dart';
import 'package:cwc_cryptic_crusade/features/game/cubit/stats_cubit.dart';
import 'package:cwc_cryptic_crusade/features/game/levels/level5_screen.dart';
import 'package:cwc_cryptic_crusade/features/game/levels/level6_screen.dart';
import 'package:cwc_cryptic_crusade/features/game/levels/level7_screen.dart';
import 'package:cwc_cryptic_crusade/features/game/levels/side_quest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/widgets/appbar.dart';
import 'levels/level1_screen.dart';
import 'levels/level2_screen.dart';
import 'levels/level3_screen.dart';
import 'levels/level4_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
    setToCurrentLevel();
  }

  Future<void> setToCurrentLevel() async {
    final currentLevel = await getCurrentLevel();
    if (currentLevel != null) {
      context.read<StatsCubit>().updateLevel(currentLevel);
      if (currentLevel == -1) {
        pageController.jumpToPage(3);
      } else {
        final currentLevelIndex = currentLevel - 1;
        pageController.jumpToPage(currentLevelIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: statsAppBar(),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Level1Screen(pageController),
          Level2Screen(pageController),
          Level3Screen(pageController),
          SideQuest(pageController),
          Level4Screen(pageController),
          Level5Screen(pageController),
          Level6Screen(pageController),
          Level7Screen(pageController),
        ],
      ),
    );
  }
}
