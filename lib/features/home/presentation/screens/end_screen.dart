import 'package:cwc_cryptic_crusade/core/models/teamstats.dart';
import 'package:cwc_cryptic_crusade/features/db/local_db.dart';
import 'package:cwc_cryptic_crusade/features/game/cubit/stats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  String teamId = "Survivors";
  String lives = "";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    String? id = await getTeamId();
    setState(() {
      teamId = id!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Congratulations!🎉",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                teamId,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const Text(
                "You have survived through \nthe Cryptic Crusade on\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                DateTime.now().toLocal().toString(),
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 32),
              BlocBuilder<StatsCubit, StatsState>(
                builder: (context, state) {
                  return Text("Lives Remaining: ${state.lives} ❤️");
                },
              ),
              const SizedBox(height: 32),
              const Text(
                "Thank you for playing.\nKeep your fingers crossed 🤞🏻\nResults will be announced shortly.\n\n\nPlease take a screenshot.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
