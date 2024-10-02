import 'package:flutter/material.dart';

class RiddleBox extends StatelessWidget {
  final String riddle;
  const RiddleBox({super.key, required this.riddle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent[100],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SelectableText(
        riddle,
        selectionControls: MaterialTextSelectionControls(),
        style: const TextStyle(
          fontFamily: 'SpaceMono',
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
