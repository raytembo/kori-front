import 'package:flutter/material.dart';

class AllFilterChip extends StatefulWidget {
  const AllFilterChip({super.key});

  @override
  State<AllFilterChip> createState() => _AllFilterChipState();
}

class _AllFilterChipState extends State<AllFilterChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selectedColor: Colors.greenAccent,
      label: const Text("All"),
      onSelected:(bool selected){
        setState(() {
          isSelected = !isSelected;
        });
      },
      selected: isSelected,
    );
  }
}
