import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/highlighted_container.dart';
import '../../../utils/constants.dart';
import '../cubit/stats_cubit.dart';

class SideQuest extends StatefulWidget {
  final PageController pageController;
  const SideQuest(this.pageController, {super.key});

  @override
  State<SideQuest> createState() => _SideQuestState();
}

class _SideQuestState extends State<SideQuest> {
  late PageController sideQuestPageController;

  @override
  void initState() {
    sideQuestPageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PageView(
          controller: sideQuestPageController,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            QuerySideQuest(
              pageController: widget.pageController,
              sideQuestPageController: sideQuestPageController,
            ),
            MainSideQuest(widget.pageController),
          ],
        ),
      ),
    );
  }
}

class QuerySideQuest extends StatelessWidget {
  final PageController sideQuestPageController;
  final PageController pageController;
  const QuerySideQuest(
      {super.key,
      required this.sideQuestPageController,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Do you want to take up\nthe side quest?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const Text(
            "Perhaps just a hunch... but not every detour is worth the risk. Some paths may only distract you from your goal. Stay focused, or take a chance—though not every shortcut leads forward.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () {
              sideQuestPageController.nextPage(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: const Text(
              "Try my luck",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.easeInOut,
              );
              // context
              //     .read<StatsCubit>()
              //     .setLevelCompletedTime('level4', DateTime.now());
            },
            child: const Text(
              "Skip",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "This isn’t a must, you can succeed without it.",
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MainSideQuest extends StatefulWidget {
  final PageController pageController;
  const MainSideQuest(this.pageController, {super.key});

  @override
  State<MainSideQuest> createState() => _MainSideQuestState();
}

class _MainSideQuestState extends State<MainSideQuest> {
  late TextEditingController keyController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    keyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              AppConstants.sideQuestDescription,
            ),
            const SizedBox(height: 16),
            const RiddleBox(riddle: AppConstants.sideQuestRiddle),
            const SizedBox(height: 16),
            TextField(
              textAlign: TextAlign.center,
              controller: keyController,
              decoration: const InputDecoration(
                hintText: 'Enter Key',
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    isLoading = false;
                  });
                  if (keyController.text == AppConstants.sideQuestFlag) {
                    widget.pageController.animateToPage(
                      5,
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                    );
                    context
                        .read<StatsCubit>()
                        .setLevelCompletedTime('sidequest', DateTime.now());
                  } else {
                    context.read<StatsCubit>().lostHeart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incorrect Key'),
                      ),
                    );
                  }
                });
              },
              child: isLoading
                  ? const AnimatedLoadingJumpingDots(
                      dotSize: 5,
                      jumpingHeight: 10,
                    )
                  : const Text(
                      'Verify',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.easeInOut,
                );
                // context
                //     .read<StatsCubit>()
                //     .setLevelCompletedTime('level4', DateTime.now());
              },
              child: const Text(
                "Skip",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
