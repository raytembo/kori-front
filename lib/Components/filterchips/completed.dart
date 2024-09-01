import 'package:flutter/material.dart';

class Completedfilterchip extends StatefulWidget {
  const Completedfilterchip({super.key});

  @override
  State<Completedfilterchip> createState() => _CompletedfilterchipState();
}

class _CompletedfilterchipState extends State<Completedfilterchip> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selectedColor: Colors.greenAccent,
      label: Text("Completed"),
      onSelected:(bool selected){
        setState(() {
          isSelected = !isSelected;
        });
      },
      selected: isSelected,
    );
  }
}
