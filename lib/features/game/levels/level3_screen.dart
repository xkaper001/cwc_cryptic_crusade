import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwc_cryptic_crusade/core/common/widgets/highlighted_container.dart';
import 'package:cwc_cryptic_crusade/features/game/cubit/stats_cubit.dart';
import 'package:cwc_cryptic_crusade/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Level3Screen extends StatefulWidget {
  final PageController pageController;
  const Level3Screen(this.pageController, {super.key});

  @override
  State<Level3Screen> createState() => _Level3ScreenState();
}

class _Level3ScreenState extends State<Level3Screen> {
  late TextEditingController flagController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    flagController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                AppConstants.level3Description,
              ),
              const SizedBox(height: 16),
              const RiddleBox(riddle: AppConstants.level3Riddle),
              const SizedBox(height: 16),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: flagController,
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
                    if (flagController.text.trim() == AppConstants.level3Flag) {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.easeInOut,
                      );
                      context
                          .read<StatsCubit>()
                          .updateLevel(-1);
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
            ],
          ),
        ),
      ),
    );
  }
}
