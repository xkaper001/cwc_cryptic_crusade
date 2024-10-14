import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:cwc_cryptic_crusade/utils/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../db/local_db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer timer;
  int number = 3;
  int seconds = 3;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
          seconds = -1;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'team-uid',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "🛡️ Game Rules",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 500,
                child: Swiper(
                  itemCount: rules.length,
                  viewportFraction: 0.9,
                  scale: 0.9,
                  pagination: const SwiperPagination(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(36.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: rules[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  if (seconds == -1) {
                    showCodeDialog(context);
                    // AppRoutes.router.go('/level1');
                  }
                },
                child: Text(
                  seconds != -1 ? 'Cooldown: $seconds seconds' : "Start Game",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get rules {
    return [
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '🧑🏻‍🤝‍🧑🏻 Team Setup\n\n',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Your team consists of 4 members.\n\nEach team starts with a total of 12 lives (3 lives per member) displayed at top right.\n\nYou\'ll lose a life 💔 every time your team inputs a wrong answer.\n\nYou have 3 hints ⚡ for the whole game, use them wisely!',
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '🎯 Objective\n\n',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "Progress through 7 levels by decrypting strings, solving riddles, and reaching the designated locations.\n\nAt each location, you must scan a QR code to proceed to the next level",
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '🎮 Gameplay\n\n',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "On each level, your team will receive an encrypted string. Decrypt it to reveal a riddle.\n\nSolve the riddle to discover the next location on campus.\n\nOnce you reach the correct location, scan the QR code to unlock the next level.",
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '🔍 Side Quest\n\n',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "You might discover a hidden side quest that may be a powerup or just a time-waster.\n\nIt's up to you to decide if it's worth the risk.\n\nThis side quest is optional, and you can skip it without penalty.",
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '🏆 Winning\n\n',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "Your team must complete all 7 levels with at least one life remaining to win.\n\nThe first team to finish wins the game!",
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '❌ Cheating & Fair Play\n\n',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "Sharing QR codes, hints, or skipping locations is considered cheating.\n\nIf you're caught cheating, your team will be disqualified.\n\n Remember, If you are caught ;)\n\nPlay fair and have fun!",
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '💡 Tips\n\n',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "Work together to decrypt strings and solve riddles quickly.\n\nExplore the campus carefully when searching for the QR codes.",
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "SpaceMono",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Future<void> showCodeDialog(BuildContext context) async {
    final codeController = TextEditingController();
    final teamId = FirebaseAuth.instance.currentUser!.displayName!;
    // Init Firebase Firestore
    // try {
    //   final db = FirebaseFirestore.instance.collection('leaderboard').doc(teamId).set(
    //     {
    //       'team': teamId,
    //       'lives': 12,
    //       'onlevel': 1,
    //       'hints': 4,
    //       'array': {
    //         'level1': null,
    //         'level2': null,
    //         'level3': null,
    //         'sidequest': null,
    //         'level4': null,
    //         'level5': null,
    //         'level6': null,
    //         'level7': null,
    //       }
    //     },
    //   );
    //   log('Firestore initialized');
    // } catch (e) {
    //   log(e.toString());
    // }

    showDialog(
        context: context,
        builder: (context) {
          setStart();
          return AlertDialog(
            title: const Text('Enter code'),
            content: TextField(
              controller: codeController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter code',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  AppRoutes.router.pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (codeController.text.trim() == "code") {
                    AppRoutes.router.go(AppRoutes.game);
                  }
                },
                child: const Text('Start'),
              ),
            ],
          );
        });
  }
}
