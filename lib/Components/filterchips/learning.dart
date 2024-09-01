import 'package:flutter/material.dart';

class LearningFilterchip extends StatefulWidget {
  const LearningFilterchip({super.key});

  @override
  State<LearningFilterchip> createState() => _LearningFilterchipState();
}

class _LearningFilterchipState extends State<LearningFilterchip> {

  bool isSelected =false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: const Text("Learning Path"),
      selectedColor: Colors.greenAccent,
      onSelected:(bool selected){
        setState(() {
          isSelected = !isSelected;
        });
      },
      selected: isSelected,
    );
  }
}
